package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptVO;






@Controller
public class DeptController { // class명은 상관무, 주석이 중요

	@RequestMapping(value = "/deptWrite.do") 
	public String deptWrite() { // 메소드 이름은 jsp 파일명과 같게
		
		return "dept/deptWrite"; // src/main/webapp 부터의 jsp파일 경로
		// dispatcher-servlet.xml에서 "/" 처리 해놨기 때문에 "/" 안써도됨
	}
	
	
	@RequestMapping(value = "/deptWriteSave.do")
	public String InsertDept(DeptVO vo) {
		
		System.out.println(vo.getDeptno());
		System.out.println(vo.getDname());
		System.out.println(vo.getLoc());
		
		return "";
	}
}
