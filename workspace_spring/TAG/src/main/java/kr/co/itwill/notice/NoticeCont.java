package kr.co.itwill.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice")
public class NoticeCont {

	public NoticeCont() {
		System.out.println("-----NoticeCont() 객체생성됨");
	}//end
	
	@Autowired
	NoticeDAO noticeDao;
	
	
	
	
	@RequestMapping(value="/write")
	public String write() {
		return "/notice/write";
	}//write() end
	
	/*
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(@ModelAttribute NoticeDTO dto) {
		
		String subject=dto.getSubject();
		System.out.println(subject);//null
		
		
	}*/
	
	/*
	@RequestMapping("/notice.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		//redirect : 등록한 명령어를 호출할 수 있다		
		mav.setViewName("notice/list");
		return mav;
	}//home() end
	*/
	
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public int insert(@RequestParam String subject, @RequestParam String edit) throws Exception {

		NoticeDTO notice=new NoticeDTO();
		notice.setSubject(subject);
		notice.setEdit(edit);
		
		return noticeDao.insert(notice);
	}//insert() end
		
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/list");
		
		List<NoticeDTO> list=noticeDao.list();
		//System.out.println(list.size());		
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		return mav;
	}//list() end
	
	/*	
	@RequestMapping("/list")
	private List<NoticeDTO> list(@RequestParam String subject, @RequestParam String edit) throws Exception {
		return noticeDao.list(subject);
	}//list() end
	*/
	
	@RequestMapping("/detail/{n_no}")
	public ModelAndView detail(@PathVariable int n_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/detail");
		mav.addObject("notice", noticeDao.detail(n_no));
		return mav;
	}//detail() end
	
	
}//class end
