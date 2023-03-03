package main.service;

/*
 * 회원가입 - VO(Value Object)
 */
public class MemberVO {

	private String userid;		/* 유저 아이디 */
	private String pass;		/* 비밀번호 */
	private String name;		/* 이름 */
	private String birth;		/* 생년월일 */
	private String phone;		/* 연락처 */
	private String gender;		/* 성별 */
	private String zipcode;		/* 우편번호 */
	private String address;		/* 주소 */
	private String reg;			/* 등록일 */
	
	/*
	 * get/set 메소드 처리
	 */
	/* userid get/set */
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	/* birth get/set */
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/* phone get/set */
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/* gender get/set */
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	/* zipcode get/set */
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	/* address get/set */
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	/* reg get/set */
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	
}
