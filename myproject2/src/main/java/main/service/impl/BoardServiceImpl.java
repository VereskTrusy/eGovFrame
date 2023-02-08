package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

/*
 * 일반게시판 - Service 명세한 메소드 구현
 * 컨트롤러와 연결되는 설정으로 컨트롤러에서 리소스로 사용하는 이름과 
 * "boardService"이름은 동일해야한다.
 */
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	/*
	 * DAO를 리소스로 사용하기 위한 객체를 선언
	 */
	@Resource(name="boardDAO")
	public BoardDAO boardDAO;
	
	
	/*
	 * 일반게시판 - 저장처리
	 */
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		return boardDAO.insertNBoard(vo);
	}

	
	/*
	 * 일반게시판 - 목록화면
	 */
	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardList(vo);
	}
	
	/*
	 * 일반게시판 - 목록화면 - 페이징처리 - Total 갯수 얻기
	 */
	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardTotal(vo);
	}
	
	
}