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

	/*
	 * 일반게시판 - 목록화면 - 상세보기
	 */
	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		return boardDAO.selectNBoardDetail(unq);
	}

	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 조회수 증가 시키기
	 */
	@Override
	public int updateNBoardHits(int unq) throws Exception {
		return boardDAO.updateNBoardHits(unq);
	}

	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 수정처리
	 */
	@Override
	public int updateNBoard(BoardVO vo) throws Exception {
		return boardDAO.updateNBoard(vo);
	}

	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제 - 암호확인화면
	 */
	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardPass(vo);
	}

	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제처리
	 */
	@Override
	public int deleteNBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteNBoard(vo);
	}
	
	
	
	
}