package egovframework.example.sample.service;

public class DeptVO {
	
	private String deptno;
	private String dname;
	private String loc;
	
	
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) { // deptWrite.jsp 에 작성된 name 값을 읽기 때문에 name값 겹침, 오타 주의 할것
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
}
