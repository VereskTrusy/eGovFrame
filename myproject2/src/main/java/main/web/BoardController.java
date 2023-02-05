package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	/*
	 * 컨트롤러의 @Resource(name="boardService") 이름과 
	 * impl의 @Service("boardService") 이름이동일 해야한다.
	 */
	@Resource(name="boardService")
	private BoardService boardService;
	
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	/*
	 * 일반게시판 - 저장처리
	 */
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		
		/*
		 * 구문설명 : result = null; result값은 정상 실행시 null이다
		 */
		String result = boardService.insertNBoard(vo);
		
		/*
		 * ajax에게 결과를 전달 해주어야함, 설정필요
		 */
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}
	
	/*
	 * 일반게시판 - 목록화면
	 */
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list);
		
		model.addAttribute("resultList", list); // 받아온 list를 model에 태워서 jsp로 전송,("resultList", list) jsp에서 사용할 name, 본데이터 
		
		return "board/boardList";
	}
}
/*
 * ajax - 비동기전송방식으로 저장까지 완료한 프로젝트는 
 * 샘플로 잘 가지고 있다가 현업에서 견본격으로 사용해라 
 * 현업에서 해당 프로젝트가 잘 안돌아 갈때도 있다
 * 중요
 */
