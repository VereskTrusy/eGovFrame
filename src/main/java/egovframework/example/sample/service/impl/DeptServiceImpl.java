package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

// implements : 인터페이스 상속 받는거
@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {

	@Resource(name="deptDAO")
	private DeptDAO deptDAO;
	
	@Override
	public String InsertDept(DeptVO vo) throws Exception { // 자동완성기능 활용 할것
		
		return deptDAO.InsertDept(vo); // DAO랑 연결
	}

}
