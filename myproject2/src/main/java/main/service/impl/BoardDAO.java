package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

/*
 * 일반게시판 - DAO(Data Access Object) 실제로 Database에 접근하는 객체
 * SQL과의 연결담당, 상위클래스의 메소드 상속
 */
@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {
	
	/*
	 * 일반게시판 - 저장처리
	 */
	/* 
	 * 구문 설명 : return (String)insert("boardDAO.insertNBoard", vo);
	 * (String) : 형변환
	 * insert : 상위 클래스 메소드 사용(EgovAbstractDAO)
	 * "boardDAO.insertNBoard" : SQL과 맵핑된 id 값
	 * vo : vo객체
	 */
	public String insertNBoard(BoardVO vo) {
		return (String)insert("boardDAO.insertNBoard", vo);
	}

	/*
	 * 일반게시판 - 목록화면
	 */
	public List<?> selectNBoardList(BoardVO vo) {
		return (List<?>)list("boardDAO.selectNBoardList", vo);
	}
	
	/*
	 * 일반게시판 - 목록화면 - 페이징처리 - Total 갯수 얻기
	 */
	public int selectNBoardTotal(BoardVO vo) {
		return (int)select("boardDAO.selectNBoardTotal", vo);
	}

	
}
