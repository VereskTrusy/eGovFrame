package main.service;

/*
 * 일반게시판 - 게시판항목의 값이 담길 VO(Value Object)
 */
public class BoardVO {
	
	/* 접근지정자 주의 */
	private int unq;		// ??
	private String title;	// 제목
	private String pass;	// 비밀번호
	public String name;		// 작성자
	public String content;	// 내용
	public int hits;		// 조회수
	public String rdate;	// 작성일
	

	/*
	 * get/set 메소드 처리
	 */
	/* unq get/set */
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	
	/* title get/set */
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	/* pass get/set */
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	/* name get/set */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	/* content get/set */
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	/* hits get/set */
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	/* rdate get/set */
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
}
