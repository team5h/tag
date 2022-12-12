package kr.co.itwill.memberSeller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.memberGeneral.MemberGeneralDTO;


@Controller
public class MemberSellerCont {
	
	public MemberSellerCont() {
		System.out.println("------- MemberSellerCont() 객체 생성됨 ");
	}//MemberSellerCont() end
	

	@Autowired
	MemberSellerDAO memberSellerDao;
	
	
//  [로그인 / 로그아웃] 시작  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	// [로그인] - 일반 or 판매자 로그인 선택 페이지 연결
	@RequestMapping(value = "/loginS.do", method = RequestMethod.GET)
	public String loginSeller() {
		return "memberSeller/loginFormSeller";
	}//loginSeller() end

	
	// [로그인] - 로그인 페이지 연결
	@RequestMapping(value = "/loginS.do", method = RequestMethod.POST)
	public ModelAndView loginSellerProc(@ModelAttribute MemberSellerDTO dto, 
														 HttpServletRequest req, 
														 HttpServletResponse resp, 
														 HttpSession session) throws Exception{
		
		// 사용자가 loginForm에 입력한 아이디(m_id) 와 비밀번호(m_pw) 가져오기.
		String id=dto.getP_id();
		String pw=dto.getP_pw();	
		
		// 아이디 저장 가져오기 <input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="saveId" value="SAVE">아이디 저장</label>
		String saveId = req.getParameter("saveId");
		//System.out.println(saveId); 
		// -> 아이디저장 체크를 하면 "SAVE" 값이 들어오고, 체크하지않으면 null값이 들어온다.
		
		
		
		// DB에 저장돼있는 아이디와 비밀번호 비교해야함.
		dto.setP_id(id);
		dto.setP_pw(pw);
		
		// mapper에서 담아온 select문을 DAO에 담아준 후 그 값을 변수에 담아준다. --> B등급 나옴.
		String mem_grade = memberSellerDao.select(dto);
		
		
		// mapper -> DAO 에 담아온 sql문 값이 있는지? 없는지? 
		ModelAndView mav = new ModelAndView();
		if(!(mem_grade == null)) {
			// 로그인 성공
			// 로그인 되면 세션값 저장
			session.setAttribute("mem_grade", mem_grade);

			
			Cookie cookie=null;
			if(saveId!=null) {
				cookie = new Cookie("id", id);
				cookie.setMaxAge(24 * 30 * 60 * 60 * 1000); //30일간 저장
				resp.addCookie(cookie);
				
			}else {
				cookie = new Cookie("id", "");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}//if end
			
			// 홈으로 이동
			mav.setViewName("redirect:/home");
			
		}else {
			// 로그인 실패
			// 결과값을 0으로 지정.
			int result=0;
			// 0 값을 "result"라는 이름으로 사용할 수 있도록 만들어준다.
			session.setAttribute("result", result);
			
			// 실패하면 그대로 로그인 페이지에 남아있도록 링크를 걸어준다.
			mav.setViewName( "redirect:/loginS.do");
		}//if end
		
		mav.addObject("dto", dto);
		return mav;
		
	}//loginGeneralProc() end

	
	
    // [회원가입] 시작  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
	
	
	// [회원가입] - 약관동의 페이지 연결
	@RequestMapping(value = "/agreementS.do", method = RequestMethod.GET)
	public String agreementG() {
		return "memberSeller/agreementS";
	}//loginGeneral() end
	
	
	// [회원가입] - 회원가입 페이지 연결
	@RequestMapping(value = "/joinS.do", method = RequestMethod.GET)
	public String joinG() {		
		return "memberSeller/joinS";
	}//loginGeneral() end
	
	
	// [회원가입] - 아이디 중복체크
	@PostMapping("/idCheckS")
	@ResponseBody
	public int idCheckS(@RequestParam("p_id") String p_id) {
		int cnt = memberSellerDao.idCheckS(p_id);
		//System.out.println(cnt); -> 1이 들어오면 아이디가 있는 것! (중복)
		return cnt;
	}//idCheck() end
	
	
	// [회원가입] - 이메일 중복체크
	@PostMapping("/emailScheck")
	@ResponseBody
	public int emailScheck(@RequestParam("com_email") String com_email) {
		int cnt = memberSellerDao.emailScheck(com_email);
		//System.out.println(cnt); -> 1이 들어오면 아이디가 있는 것! (중복)
		return cnt;
	}//idCheck() end
	
	
	// // [회원가입] - 성공
	@RequestMapping(value = "/joinSproc.do", method = RequestMethod.POST)
	public String joinSproc( MemberSellerDTO dto, 
							 HttpServletRequest req, 
							 HttpServletResponse resp)throws Exception{
		//System.out.println(dto);
		
		int cnt = memberSellerDao.joinS(dto);
		
		try {
			if(cnt == 1) { //로그인 성공
			   req.setAttribute("msg", "회원가입을 축하합니다.");
			   req.setAttribute("url", "/home");
			}//if end
			
		} catch(Exception e) {
			e.printStackTrace();
		}//try end
		
		return "memberGeneral/alert";
		
	}//joinGeneralProc() end
	
	
	
	
	
}//class end 
