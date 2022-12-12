package kr.co.itwill.myticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.point.PointDTO;

@Controller
public class MyticketCont {

	public MyticketCont() {
		System.out.println("-----MyticketCont() 객체생성됨");
	}//end
	
	
	@Autowired
	MyticketDAO myticketDao;
	
	/*
	@RequestMapping("mypage/myticket")
	public String myticket() {
		return "mypage/myticket";
	}//myticket() end
	*/
	
	@RequestMapping("mypage/myticket")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myticket");
		
		List<MyticketDTO> list=myticketDao.list();
		mav.addObject("list", list);
		return mav;
	}//list() end
	
}//class end
