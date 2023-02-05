package main.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

// SQL과의 연결담당, 상위클래스의 메소드 상속
@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertNBoard(BoardVO vo) {
		
		return (String)insert("boardDAO.insertNBoard", vo);
		/*return (String)insert("boardDAO.insertNBoard", vo);
		 * insert : 상위 클래스 메소드
		 * "boardDAO.insertNBoard" : id 값
		 * vo : vo객체
		 * */
	}
	
	
}
