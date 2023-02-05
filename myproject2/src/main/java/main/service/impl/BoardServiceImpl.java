package main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

// 컨트롤러와 연결되는 설정
// 컨트롤러에서 리소스로 사용하는 이름과
// @Service("boardService")이름은 동일해야한다.
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAO")
	public BoardDAO boardDAO;
	
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		
		
		return boardDAO.insertNBoard(vo);
	}
	
	
}
