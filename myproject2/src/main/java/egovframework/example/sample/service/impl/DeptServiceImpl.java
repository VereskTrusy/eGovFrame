package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl 
							 implements DeptService{	
		
		@Resource(name="deptDAO")
		private DeptDAO deptDAO;
		
		
		
		@Override
		public String InsertDept(DeptVO vo) throws Exception {
			return deptDAO.InsertDept(vo);
		}

		@Override
		public List<?> SelectDeptList(DeptVO vo) throws Exception {
			return deptDAO.SelectDeptList(vo);
		}

		@Override
		public DeptVO selectDeptDetail(int deptno) throws Exception {
			return deptDAO.selectDeptDetail(deptno);
		}

		@Override
		public int deleteDept(int deptno) throws Exception {
			return deptDAO.deleteDept(deptno);
		}

		@Override
		public int updateDept(DeptVO vo) throws Exception {
			return deptDAO.updateDept(vo);
		}
		
}
