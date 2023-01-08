package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;






@Controller // @ Annotation : 시스템주석, 서버가 참고하는 주석, 해당 주석 없으면 서버 안돌아감
public class DeptController { // class명은 상관무, 주석이 중요

	@Resource(name="deptService")
	private DeptService deptService;
	
	@RequestMapping(value = "/deptWrite.do") // 웹에서 찾는 주소를 여기에 작성, 프레임워크 기본 확장자는 .do임
	public String deptWrite() { // 메소드 이름은 jsp 파일명과 같게, 왠만하면
		
		return "dept/deptWrite"; // src/main/webapp 부터의 jsp파일 경로
		// dispatcher-servlet.xml에서 "/" 처리 해놨기 때문에 "/" 안써도됨
	}
	
	
	// SQL과 관련 있는 것들은 SQL이름을 앞세운다
	@RequestMapping(value = "/deptWriteSave.do") // deptWrite.jsp 파일에서 action 시 해당 주소 화면으로 넘어감
	public String InsertDept(DeptVO vo) throws Exception { //얘가 실행되는순간 변수 다 채워짐
		
		// 콘솔에 받은 데이터 뿌리기
		System.out.println(vo.getDeptno());
		System.out.println(vo.getDname());
		System.out.println(vo.getLoc());
		
		String result = deptService.InsertDept(vo);
		if( result == null ) { // ok
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		
		return ""; // 일단 리턴 x 
	}
}
