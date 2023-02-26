package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	
	/*
	 * 회원등록 화면
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() { // 아직은 DB 접근 기능이 없어서 throws Exception 처리는 하지 않음
		
		
		
		return "member/memberWrite";
	}
}
