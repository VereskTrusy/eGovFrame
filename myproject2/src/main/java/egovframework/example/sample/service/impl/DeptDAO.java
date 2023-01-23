package egovframework.example.sample.service.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String InsertDept(DeptVO vo) {
		return (String) insert("deptDAO.InsertDept", vo);
	}

	public List<?> SelectDeptList(DeptVO vo) {
		return (List<?>) list("deptDAO.SelectDeptList", vo);
	}

	public DeptVO selectDeptDetail(int deptno) {
		return (DeptVO) select("deptDAO.selectDeptDetail", deptno);
	}

	public int deleteDept(int deptno) {
		return (int) delete("deptDAO.deleteDept", deptno);
	}

	public int updateDept(DeptVO vo) {
		return (int) update("deptDAO.updateDept", vo);
	}
}
