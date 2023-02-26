package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
		 * 결과 전송
		 * ajax에게 결과를 전달 해주어야함, 설정필요
		 * try catch문으로 변경필요
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
		
		int unit = 5;
		
		int total = boardService.selectNBoardTotal(vo); // 총 데이터 개수
		System.out.println("total : " + total);
		// 11/10 = 1.1 -> cell(1.1) -> Integer2.0 -> 2
		// 11/10 -> 정수타입결과는 1 -> 실수타입으로 변경해주어야
		// 우리가 원하는 1.1이 나온다 -> (double)11/10 = 1.1
		int totalPage = (int)Math.ceil((double)total/unit);
		System.out.println("totalPage : " + totalPage);
		
		int viewPage = vo.getViewPage(); // 현재 출력하려는 페이지 번호
		// 1페이지 눌렀다 -> 1,10페이지로 SQL변수 startIndex,endIndex가 세팅
		// 2페이지 눌렀다 -> 11,20페이지로 SQL변수 세팅되어져야 함
		// startIndex : (1-1)*10 + 1
		// startIndex : (2-1)*10 + 1
		
		//
		if(viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1) * unit + 1; //
		int endIndex = startIndex + (unit-1); //
		
		//
		int startRowNo =  total - ((viewPage - 1) * unit);
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list);
		
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("resultList", list); // 받아온 list를 model에 태워서 jsp로 전송,("resultList", list) jsp에서 사용할 name, 본데이터 
		
		return "board/boardList";
	}
	
	/*
	 * 일반게시판 - 목록화면 - 상세보기
	 */
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception {
		
		// 조회수 증가
		boardService.updateNBoardHits(vo.getUnq());
		
		// 상세보기
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent(); // \n
		boardVO.setContent( content.replace("\n", "<br>")); // \n -> <br>
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 수정화면
	 */
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}
	
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 수정처리
	 */
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception {
		
		/* 암호 확인 및 업데이트*/
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo); // int count = 1;
		if( count == 1) { // 암호 일치, 업데이트
			result = boardService.updateNBoard(vo); // int result = 1;
		} else { // 암호 불일치
			result = -1;
		}
		
		
		return result+"";
	}
	
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제 - 암호확인화면
	 */
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		model.addAttribute("unq", unq);
		return "board/passWrite";
	}
	
	/*
	 * 일반게시판 - 목록화면 - 상세보기 - 삭제처리
	 */
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteNBoard(BoardVO vo) throws Exception {
		
		int result = 0;
		
		/* 암호 일치 검사, 삭제*/
		int count = boardService.selectNBoardPass(vo);	// count = 1;

		if( count == 1 ) {
			result = boardService.deleteNBoard(vo);	// result = 1; result = 0;
		} else if( count == 0 ) {
			result = -1;
		} 
		

		return result+"";
	}
}
/*
 * ajax - 비동기전송방식으로 저장까지 완료한 프로젝트는 
 * 샘플로 잘 가지고 있다가 현업에서 견본격으로 사용해라 
 * 현업에서 해당 프로젝트가 잘 안돌아 갈때도 있다
 * 중요
 */
