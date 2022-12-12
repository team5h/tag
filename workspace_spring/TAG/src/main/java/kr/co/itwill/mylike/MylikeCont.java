package kr.co.itwill.mylike;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MylikeCont {

	public MylikeCont() {
		System.out.println("-----MylikeCont() 객체생성됨");
	}//end
	
	@Autowired
	MylikeDAO mylikeDao;
	
	/*
	@RequestMapping("mypage/mylike")
	public String mylike() {
		return "mypage/mylike";
	}//mylike() end
	*/
	
	@RequestMapping("mypage/mylike")
	public ModelAndView list(HttpSession session) {
		
		//현재 로그인되어 있는 아이디
		//나중에 소스 취합할때 주석 지우고 이부분으로 하면 됨
		//String s_m_id=(String)session.getAttribute("s_m_id");		
		String s_m_id="daseul";//소스 취합할때 이 줄 삭제하고, 위줄에 있는 거로 해야 함
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/mylike");
		
		List<MylikeDTO> list=mylikeDao.list(s_m_id);
		mav.addObject("list", list);
		
		List<Map<String, Object>> list_c=mylikeDao.list_c(s_m_id);
		mav.addObject("list_c", list_c);
		//8세 이상 / prep.png / 전R석
		//만 7세이상 / Maksim.jpg / 전 R석 / 가격 R132000 / 22.12.24 ~ 22.12.25
		/*for(int i=0; i<list_c.size(); i++) {
			System.out.println((String)list_c.get(i));
			
		}//for end
		*/
		
		
		
		List<Map<String, Object>> list_p=mylikeDao.list_p(s_m_id);
		mav.addObject("list_p", list_p);
		
		
		
		return mav;
	}//list() end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class end
