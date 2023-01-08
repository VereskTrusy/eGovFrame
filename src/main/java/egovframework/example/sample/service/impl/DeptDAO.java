package egovframework.example.sample.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO{

	public String InsertDept(DeptVO vo) throws Exception {

		return (String) insert("deptDAO.InsertDept", vo); // 상위 클래스에 있는 메소드 그대로 사용
	}
	
	

}
