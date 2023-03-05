package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	
	/*
	 * 회원가입 - 화면
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() { // 아직은 DB 접근 기능이 없어서 throws Exception 처리는 하지 않음
		return "member/memberWrite";
	}
	
	/*
	 * 회원가입 - 회원등록 처리
	 */
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
	
	/*
	 * 회원가입 - 아이디 중복체크
	 */
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid) throws Exception {
		
		String message = ""; 
		
		int count = memberService.selectMemberIdCheck(userid);
		if( count == 0 ) {
			message = "ok";
		} else {
			message = "fail";
		}
		
		return message;
	}
	
	/*
	 * 회원가입 - 우편번호 찾기 : 사용 안함 처리함
	 */
	/*
	 * @RequestMapping("/post1.do") public String post1() { return "member/post1"; }
	 */
	
	/*
	 * 회원가입 - 우편번호 찾기 처리 : 사용 안함 처리함
	 */
	/*
	 * @RequestMapping("/post2.do") public String post2(String dong, ModelMap model)
	 * throws Exception {
	 * 
	 * System.out.println("테스트"); List<?> list = memberService.selectPostList(dong);
	 * //model.addAttribute("resultList", list); System.out.println("리스트");
	 * System.out.println(list.size());
	 * 
	 * return "member/post2"; }
	 */
	
}
