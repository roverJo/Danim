package org.kosta.finalproject.model.vo.community;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class CommunityVO {
	private int comm_no;
	private String timePosted;
	private String content;
	private int likePosted;
	private MemberVO memberVO;
	private int userLike; //사용자 like 상태
	public CommunityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommunityVO(int comm_no) {
		super();
		this.comm_no = comm_no;
	}
	public CommunityVO(int comm_no, String timePosted, String content,
			int likePosted, MemberVO memberVO) {
		super();
		this.comm_no = comm_no;
		this.timePosted = timePosted;
		this.content = content;
		this.likePosted = likePosted;
		this.memberVO = memberVO;
	}
	
	public CommunityVO(int comm_no, MemberVO memberVO) {
		super();
		this.comm_no = comm_no;
		this.memberVO = memberVO;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public int getUserLike() {
		return userLike;
	}
	public void setUserLike(int userLike) {
		this.userLike = userLike;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikePosted() {
		return likePosted;
	}
	public void setLikePosted(int likePosted) {
		this.likePosted = likePosted;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "CommunityVO [comm_no=" + comm_no + ", timePosted=" + timePosted
				+ ", content=" + content + ", likePosted=" + likePosted
				+ ", memberVO=" + memberVO + ", userLike=" + userLike + "]";
	}
	
}
