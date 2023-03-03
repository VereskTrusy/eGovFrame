package main.service;

/*
 * 일반게시판 - 게시판항목의 값이 담길 VO(Value Object)
 */
public class BoardVO {
	
	/* 접근지정자 주의 */
	private int unq;		/* 유니크 넘버 */
	private String title;	/* 제목 */
	private String pass;	/* 비밀번호 */
	public String name;		/* 작성자 */
	public String content;	/* 내용 */
	public int hits;		/* 조회수 */
	public String rdate;	/* 작성일 */

	private int viewPage = 1;	/*사용자가 보고 있는 화면페이지 */
	private int startIndex = 1;	/*목록화면 페이지 시작번호 */
	private int endIndex = 10;	/*목록화면 페이지 끝번호 */
	
	private String searchGubun;	/*목록화면-검색기능 콤보박스 옵션 */
	private String searchText;	/*목록화면-검색기능 검색내용 */
	
	
	/*
	 * get/set 메소드 처리
	 */
	/* searchGubun get/set */
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	
	/* searchText get/set */
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	/* startIndex get/set */
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
	/* endIndex get/set */
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	/* viewPage get/set */
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	
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
