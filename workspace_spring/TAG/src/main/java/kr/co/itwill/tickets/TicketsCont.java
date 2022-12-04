package kr.co.itwill.tickets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TicketsCont {

	public TicketsCont() {
		System.out.println("--------TicketsCont() 객체 생성");
	}// default constructor
	
	@RequestMapping("/tickets")
	public String tickets() {
		return "/tickets/test";
	}//tickets() end
	
	
	@RequestMapping("map1F.do")
	public String map1F() {
		return "/tickets/map1F";
	}//map1F() end
	
	@RequestMapping("map2F.do")
	public String map2F() {
		return "/tickets/map2F";
	}//map2F() end

	
}//class end
