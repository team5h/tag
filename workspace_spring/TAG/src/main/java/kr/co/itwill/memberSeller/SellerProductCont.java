package kr.co.itwill.memberSeller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

import net.utility.UploadSaveManager;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Controller
public class SellerProductCont {
	
	public SellerProductCont() {
		System.out.println("----------------ProdcutCont()");
	}//end
	
	@Autowired
	SellerProductDAO sellerproductdao;
	
	@RequestMapping("/mypageS/create")
	public ModelAndView productForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memberSeller/productForm");
		mav.addObject("concertlist",sellerproductdao.concertlist());
		
		return mav;
	}//end

//------------------------------------------------------------------------- SUMMER NOTE 

	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		/*
		 	[ ???????????? ???????????? ??????????????? ?????? ??? ????????? ?????? ?????? ?????? ?????? ??????????????? ???????????? ???????????? ????????????(??????????????????!)
			String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/storage");
			String fileRoot = contextRoot+"/summernoteImage/";
		*/
		
		String fileRoot = "C:\\summernote_image\\";	//????????? ?????? ?????? ??????
		//?????? ????????? /Users/macbook-id/summernote_image/ ??? ??????! 
		
		String originalFileName = multipartFile.getOriginalFilename();	//???????????? ?????????
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//?????? ?????????
				
		String savedFileName = UUID.randomUUID() + extension;	//????????? ?????? ???
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//?????? ??????
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//????????? ?????? ??????
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	

	@Configuration
	public class WebMvcConfig implements WebMvcConfigurer {
	
		//web root??? ?????? ?????? ????????? ?????? ???????????? url??? ????????? ??? ????????? ??????
	    //?????? localhost:8090/summernoteImage/1234.jpg
	    //??? ???????????? C:/summernote_image/1234.jpg ????????? ????????????.
	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/summernoteImage/**")
	                .addResourceLocations("file:///C:/summernote_image/");
	        							 //?????? ????????? file:///Users/macbook-id/summernote_image/ ??? ??????! 
	    }
	}//?????? ?????? ?????? ??????
	
//------------------------------------------------------------------------- SUMMER NOTE 	
	
	@RequestMapping(value = "/mypageS/productProc", method = RequestMethod.POST )
	public ModelAndView productProc(@ModelAttribute SellerProductDTO dto
									,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		
//------------------------------------------------------------------------- ?????? ?????? ??????
		
		String basePath = req.getRealPath("/storage"); 	
		
		// ???????????? ????????? ???????????? ?????? 
		MultipartFile fileimg = dto.getFileimg();

		String postername = UploadSaveManager.saveFileSpring30(fileimg, basePath);
		dto.setpostername(postername);
		
		int cnt = sellerproductdao.productInsert(dto); 

		if (cnt == 0) {
			mav.setViewName("index");	
			// ??????????????????? 
		} else {
			mav.setViewName("redirect:/mypageS/productM");
			//mav.setViewName("/mypageS/productM");
		}
		
		return mav; 
	}//productProc() end
	
	@RequestMapping("/mypageS/productM")
	public ModelAndView productM() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/memberSeller/productM");
		mav.addObject("productlist", sellerproductdao.productlist());
		
		return mav; 
	}

	
	@ResponseBody
	@RequestMapping(value = "/mypageS/delete", method = RequestMethod.POST )
	 public int ckdelete(@RequestParam Map<String, Object> parameters) throws Exception{
	      
		  /* chkList??? ????????? ???????????? ???????????? ?????? */
	      String chkArray = parameters.get("chkList").toString();
	      
	      // ?????? [] ?????? ??????
	      chkArray = chkArray.substring(1, (chkArray.length()- 1));
	      // " ?????? ??????
	      chkArray = chkArray.replace("\"","");
	      // ,????????? ????????? ?????? ??? ????????? ??????
	      String [] chkList = chkArray.split(","); 
	      // ????????? List??? ??????
	      List list = Arrays.asList(chkList);
		
	      SellerProductDTO dto = new SellerProductDTO();
	      dto.setChkList(list);
	      
	      return sellerproductdao.chkdelete(dto);
	}//end
	
	
	@ResponseBody
	@RequestMapping(value = "/mypageS/statusupdate", method = RequestMethod.POST)
	public int productstusupdate (@RequestParam int pro_no, @RequestParam String status) {
		SellerProductDTO dto = new SellerProductDTO();
		dto.setPro_no(pro_no);
		dto.setStatus(status);
		
		return sellerproductdao.productstatusup(dto);
	}//end
	

	@RequestMapping (value = "/mypageS/productupdate", method = RequestMethod.POST )
	public ModelAndView productupdate(@ModelAttribute SellerProductDTO dto, HttpServletRequest req) {
		
		String basePath = req.getRealPath("/storage");
		SellerProductDTO oldDTO = sellerproductdao.productread(dto.getPro_no());	
		
//------------------------------------------------------------------------------------ ????????? ???????????????????
		
		// ???. 
		MultipartFile fileimg = dto.getFileimg();
		if (fileimg.getSize() > 0) {
		// = ???????????? ?????? ????????? 0???????????? = ????????? ????????? ?????????????????? 
			
			UploadSaveManager.deleteFile(basePath, oldDTO.getpostername());	// ?????? ?????? ??????
			String postername = UploadSaveManager.saveFileSpring30(fileimg, basePath);	// ?????? ????????? ?????? ??????
			dto.setpostername(postername);	//?????? ????????? ????????? dto??? ??????
		
		}else {
		// ???????????? ???????????? ???????????? = ????????? ????????? ???????????? ???????????? 
			
			dto.setpostername(oldDTO.getpostername()); 		// ?????? ????????? ????????? ??????
		
		}//if end
		
//------------------------------------------------------------------------------------ ????????? ???????????????????
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = sellerproductdao.productupdate(dto);
		
		if (cnt == 0) {
			mav.setViewName("/ErrorView");
		}else {
			mav.setViewName("redirect:/mypageS/productM");
		}//if end

		return mav;
	}//end

	@ResponseBody
	@RequestMapping(value = "/mypageS/productdelete", method = RequestMethod.POST)
	public int productdelete(@RequestParam int pro_no, HttpServletRequest req) {
				
		String postername = sellerproductdao.posternameread(pro_no);	// storage?????? ?????? ??????
		if(postername != null && !postername.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");	// ?????? ????????? ??????
			
			File file = new File(path + "\\" + postername);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end
		
		int cnt = sellerproductdao.productdelete(pro_no); // DB?????? ??? ??????
		
		return cnt;	
	}//end 

	@RequestMapping ("/mypageS/orderM") 
	public ModelAndView orderM() {
		ModelAndView mav = new ModelAndView();
		
		String p_id = "privatecurve"; 	// ???????????????! 
		
		mav.setViewName("/memberSeller/orderM");
		mav.addObject("orderlist",sellerproductdao.orderlist(p_id));
	
		return mav;
	}
	
	@RequestMapping("/mypageS/orderMdetail")
	public ModelAndView orderMdetail() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/memberSeller/orderMdetail");
		
		return mav;
	}
	
	
}//Cont end
