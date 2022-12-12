package kr.co.itwill.tickets;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TicketsCont {

	public TicketsCont() {
		System.out.println("--------TicketsCont() 객체 생성");
	}// default constructor
	
	@RequestMapping("/tickets")
	public String tickets() {
		return "/tickets/book";
	}//tickets() end
	
	/*
	@RequestMapping("map1F.do")
	public String map1F() {
		return "/tickets/map1F";
	}//map1F() end
	
	@RequestMapping("map2F.do")
	public String map2F() {
		return "/tickets/map2F";
	}//map2F() end
	
	@RequestMapping(value="seatAddForm.do", method = RequestMethod.GET)
	public String seatAddForm() {
		return "/tickets/seatAddForm";
	}//seatAddForm() end
	
	@RequestMapping("ticketSale.do")
	public String ticketSale() {
		return "/tickets/ticketSale";
	}//ticketSale() end
	
	@RequestMapping("ticketAddForm.do")
	public String ticketAddForm() {
		return "/tickets/ticketAddForm";
	}//ticketAddForm() end
	*/

	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public ModelAndView submitTest(@ModelAttribute TicketOrderDTO orderDto, @ModelAttribute TicketDetailDTO detailDto) {
		ModelAndView mav=new ModelAndView();
		
		
		
		
		System.out.println("modelAndView 접근성공");
		mav.setViewName("/tickets/msgView");
		mav.addObject("msg1", "성공");
		mav.addObject("content1", orderDto.toString());
		mav.addObject("content2", detailDto.toString());
		
		return mav;
	}//tickets() end
	
	
	
}//class end
