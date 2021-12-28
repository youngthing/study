package kh.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.web.dao.MessageDAO;
import kh.web.dto.MessageDTO;


@Controller
public class HomeController {
	
	@Autowired
	public MessageDAO dao;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("inputForm")
	public String inputForm() {	
		return "inputForm";
	}
	
	@RequestMapping("inputProc")
	public String inputProc(MessageDTO dto) throws Exception{
		int result = dao.insert(dto);
		return "redirect:/" ;
	}
	
	@RequestMapping("outputView")
	public String outputView(Model model) throws Exception{
		  List <MessageDTO> list = dao.selectAll();
		  model.addAttribute("list", list);
		  return "output";
	}
	
	@RequestMapping("deleteProc")
	public String deleteProc(int delTarget) throws Exception{
		int result = dao.delete(delTarget);
		return "redirect:outputView";
	}
	
	@RequestMapping("updateProc")
	public String updateProc(MessageDTO dto) throws Exception{
		 int result = dao.update(dto);
		 return "redirect:outputView";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "redirect:/"; 
	}

	
}
