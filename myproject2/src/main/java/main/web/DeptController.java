package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.service.DeptService;
import main.service.DeptVO;


@Controller
public class DeptController {
	
	// 서비스
	@Resource(name = "deptService")
	private DeptService deptService; 
	
	
	
	// 부서입력
	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";
	}
	
	// 부서입력 - 저장
	@RequestMapping(value = "/deptWriteSave.do")
	public String InsertDept(DeptVO vo) throws Exception {
		
		//System.out.println("콘솔 메시지 S");
		System.out.println("부서번호 : " + vo.getDeptno());
		System.out.println("부서이름 : " + vo.getDname());
		System.out.println("부서위치 : " + vo.getLoc());
		//System.out.println("콘솔 메시지 E");
		
		String result = deptService.InsertDept(vo);
		if(result == null) { // ok
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "";
	}

	// 부서목록
	@RequestMapping(value="/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception { // modelmap : 자바의 데이터를 jsp로 전달해주는 역활
		
		List<?> list = deptService.SelectDeptList(vo);
		System.out.println(list);
		
		model.addAttribute("resultList", list); // model에 리스트 태우기, "resultList"이름과 jsp에서 items="${resultList}" 이름과 동일해야한다
		return "dept/deptList";
	}
	
	//부서목록 - 상세화면
	@RequestMapping(value="/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		System.out.println("부서번호 : "+vo.getDeptno());
		
		model.addAttribute("deptVO", vo);
		return "dept/deptDetail";
	}
	
	// 부서목록 - 상세화면 - 삭제
	@RequestMapping(value="/deptDelete.do")
	public String deleteDept(int deptno) throws Exception {
		int result = deptService.deleteDept(deptno);
		if(result == 1) {
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제실패");
		}
		
		return "";
	}
	
	// 부서목록 - 상세화면 - 수정
	@RequestMapping(value="/deptModifyWrite.do")
	public String selectDeptModify(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		model.addAttribute("deptVO", vo);
		
		return "dept/deptModifyWrite";
	}
	
	// 부서목록 - 상세화면 - 수정 - 저장
	@RequestMapping(value="/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception {
		int result = deptService.updateDept(vo);
		if(result == 1) { // 정상
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "";
	}
}
