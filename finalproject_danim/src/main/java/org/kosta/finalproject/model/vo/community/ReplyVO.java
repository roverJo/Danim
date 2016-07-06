package org.kosta.finalproject.model.vo.community;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class ReplyVO {
	private int reply_no;
	private CommentVO commentVO;
	private MemberVO memberVO;
	private String timePosted;
	private String content;
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(int reply_no, CommentVO commentVO, MemberVO memberVO,
			String timePosted, String content) {
		super();
		this.reply_no = reply_no;
		this.commentVO = commentVO;
		this.memberVO = memberVO;
		this.timePosted = timePosted;
		this.content = content;
	}

	public ReplyVO(CommentVO commentVO, MemberVO memberVO, String content) {
		super();
		this.commentVO = commentVO;
		this.memberVO = memberVO;
		this.content = content;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public CommentVO getCommentVO() {
		return commentVO;
	}
	public void setCommentVO(CommentVO commentVO) {
		this.commentVO = commentVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", commentVO=" + commentVO
				+ ", memberVO=" + memberVO + ", timePosted=" + timePosted
				+ ", content=" + content + "]";
	}
}
