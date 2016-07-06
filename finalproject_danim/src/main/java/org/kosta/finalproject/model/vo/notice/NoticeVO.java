package org.kosta.finalproject.model.vo.notice;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class NoticeVO {

	private int noticeno;
	private String timePosted;
	private String title;
	private String content;
	private MemberVO memberVO;
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(int noticeno, String timePosted, String title,
			String content, MemberVO memberVO) {
		super();
		this.noticeno = noticeno;
		this.timePosted = timePosted;
		this.title = title;
		this.content = content;
		this.memberVO = memberVO;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimeposted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeno=" + noticeno + ", timePosted=" + timePosted
				+ ", title=" + title + ", content=" + content + ", memberVO="
				+ memberVO + "]";
	}
	
}
