package main.service;

import java.util.List;

/*
 * 일반게시판 - Service interface 항목 명세
 * 컨트롤러에서는 인터페이스만 지목함
 */
public interface BoardService {
	
	/*
	 * 일반게시판 - 저장 처리
	 */
	public String insertNBoard(BoardVO vo) throws Exception;
	
	/*
	 * 일반게시판 - 화면목록
	 */
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	
}
