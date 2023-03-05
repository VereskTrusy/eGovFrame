package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	
	/*
	 * 회원가입 - 회원등록 처리
	 */
	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember", vo);
	}

	/*
	 * 회원가입 - 아이디 중복체크
	*/
	public int selectMemberIdCheck(String userid) {
		return (int) select("memberDAO.selectMemberIdCheck", userid);
	}

	public List<?> selectPostList(String dong) {
		return (List<?>) select("memberDAO.selectPostList", dong);
	}

}
