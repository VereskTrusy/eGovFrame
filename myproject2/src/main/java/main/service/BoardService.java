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
	
	/*
	 * 일반게시판 - 목록화면 - 페이징처리 - Total 갯수 얻기
	 */
	public int selectNBoardTotal(BoardVO vo) throws Exception;
	/*
	 * 일반게시판 - 목록화면 - 상세보기
	 */
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 조회수 증가
	 */
	public int updateNBoardHits(int unq) throws Exception;
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 수정처리
	 */
	public int updateNBoard(BoardVO vo) throws Exception;
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제 - 암호확인화면
	 */
	public int selectNBoardPass(BoardVO vo) throws Exception;
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제처리
	 */
	public int deleteNBoard(BoardVO vo) throws Exception;


}
