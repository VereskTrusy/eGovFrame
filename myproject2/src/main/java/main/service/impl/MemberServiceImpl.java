package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	/*
	 * 회원가입 - 회원등록 처리
	 */
	@Override /* 다형성(오버라이딩, 오버로딩 */
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

	/*
	 * 회원가입 - 아이디 중복체크
	*/
	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		return memberDAO.selectMemberIdCheck(userid);
	}

	/*
	 * 회원가입 - 우편번호 검색 
	*/
	@Override
	public List<?> selectPostList(String dong) throws Exception {
		return memberDAO.selectPostList(dong);
	}

	/*
	 * 로그인 - 로그인 데이터 확인
	 */
	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCount(vo);
	}

}
