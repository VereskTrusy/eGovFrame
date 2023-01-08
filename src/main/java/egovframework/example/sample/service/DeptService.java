package egovframework.example.sample.service;

public interface DeptService {
	// DataBase 연동관계에 있는건 모두 여기에 작성, interface 파일이라 메모리에 적제되지 않음
	public String InsertDept(DeptVO vo) throws Exception;
	
}
