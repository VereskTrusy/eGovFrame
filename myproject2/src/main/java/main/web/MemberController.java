package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	
	/*
	 * 회원등록 화면
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() { // 아직은 DB 접근 기능이 없어서 throws Exception 처리는 하지 않음
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		// String result = null; (성공)
		if( result == null ) {
			message = "ok";
		}
		
		return message;
	}
	/* @ResponseBody 비동기전송방식에서 jsp쪽으로 데이터를 전달해줄때 사용하는 어노테이션 */
}
