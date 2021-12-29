package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;
import kh.spring.utils.EncrpytionUtils;

@Controller
@RequestMapping("/member/") // 이 컨트롤러만 확인 할 수 있도록.
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("join")
	public String memberJoin(){
		return "member/join";
	}
	
	@ResponseBody // 이 메서드가 리턴하는 것은 포워드도 리다이렉트도 아니다. ajax응답용로도 사용한다.
	@RequestMapping("idDuplCheck")
	public String idDuplCheck(String id) throws Exception {
		//중복검사를 하고, 결과를 이클립스 콘솔에 출력하는 것 까지 만드세요.
		int result = dao.idCheck(id);
		return String.valueOf(result);
	}
	
	@RequestMapping("signup")
	public String signup(MemberDTO dto) throws Exception {
		//패스워드 암호화
		String encPw = EncrpytionUtils.getSHA512(dto.getPw()); 
		dto.setPw(encPw);	
		int result = dao.insert(dto);
		return "home";
	}
	
	@RequestMapping("login")
	public String login(String id, String pw) throws Exception{
		pw = EncrpytionUtils.getSHA512(pw);
		int result = dao.login(id,pw);
		if(result>0) {
			session.setAttribute("loginID",id);
		}
		return "redirect:/";	
	}
	
	@RequestMapping("myPage")
	public String myPage(Model model)throws Exception{
		String id = (String)session.getAttribute("loginID");
		MemberDTO dto = dao.selectAll(id);
		model.addAttribute("dto",dto);
		return "member/mypage";
	}
	
	@RequestMapping("modify")
	public String modify(String id) throws Exception{
		int result = dao.modify(id);
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout() throws Exception{
		 session.invalidate();
	        return "redirect:/";
	}
	
	@RequestMapping("leave")
	public String leave() throws Exception{
		String id = (String)session.getAttribute("loginID");
		int result = dao.leave(id);
		session.invalidate(); // 세션 초기화
		return "redirect:/";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "redirect:/"; 
	}

	

}
