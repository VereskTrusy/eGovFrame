package main.service;

import java.util.List;

public interface DeptService {
	public String InsertDept(DeptVO vo) throws Exception;
	public List<?> SelectDeptList(DeptVO vo) throws Exception;
	public DeptVO selectDeptDetail(int deptno) throws Exception;
	// 중요 : 리턴타입 
	// List<?> 목록 형태의 집합이 넘어옴
	// DeptVO 변수 3개 가지고 있는 vo를 넘겨받음
	// int deptno SQL로 넘겨서 조건 걸어 찾을거임
	public int deleteDept(int deptno) throws Exception;
	// returnType : SQL에서 insert, update, delete
	// 처리가 되는 것들은 결과를 컨트롤러에 리턴해준다(몇개를 삭제했는지)
	// 하나의 데이터가 삭제되면 1이라는 숫자를 컨트롤러에 반환
	public int updateDept(DeptVO vo) throws Exception;
	// 업데이트한 갯수 리턴
}
