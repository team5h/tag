package kr.co.itwill.tickets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TicketsCont {

	public TicketsCont() {
		System.out.println("--------TicketsCont() 객체 생성");
	}// default constructor
	
	@RequestMapping("/tickets")
	public String home() {
		return "/tickets/test";
	}

	
}//class end
