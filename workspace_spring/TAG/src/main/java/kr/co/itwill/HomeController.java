package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("--------HomeController() 객체 생성");
	}// default constructor
	
	@RequestMapping("/home")
	public String home() {
		return "index";
	}

}