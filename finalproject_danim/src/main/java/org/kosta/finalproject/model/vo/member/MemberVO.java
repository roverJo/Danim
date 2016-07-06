package org.kosta.finalproject.model.vo.member;

public class MemberVO {
	private String id;
	private String password;
	private String nickname;
	private String address;
	private String email_add;
	private int admin;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String id, String password, String nickname,
			String address, String email_add, int admin) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.address = address;
		this.email_add = email_add;
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail_add() {
		return email_add;
	}
	public void setEmail_add(String email_add) {
		this.email_add = email_add;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", nickname="
				+ nickname + ", address=" + address + ", email_add="
				+ email_add + ", admin=" + admin + "]";
	}
	
}
