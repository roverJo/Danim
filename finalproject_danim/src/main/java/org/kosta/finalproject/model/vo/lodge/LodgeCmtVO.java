package org.kosta.finalproject.model.vo.lodge;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class LodgeCmtVO {
	private int lodgecmt_no;
	private LodgeVO lodgeVO;
	private MemberVO memberVO;
	private String content;
	public LodgeCmtVO() {
		super();
	}
	public LodgeCmtVO(int lodgecmt_no, LodgeVO lodgeVO, MemberVO memberVO,
			String content) {
		super();
		this.lodgecmt_no = lodgecmt_no;
		this.lodgeVO = lodgeVO;
		this.memberVO = memberVO;
		this.content = content;
	}
	public int getLodgecmt_no() {
		return lodgecmt_no;
	}
	public void setLodgecmt_no(int lodgecmt_no) {
		this.lodgecmt_no = lodgecmt_no;
	}
	public LodgeVO getLodgeVO() {
		return lodgeVO;
	}
	public void setLodgeVO(LodgeVO lodgeVO) {
		this.lodgeVO = lodgeVO;
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
	@Override
	public String toString() {
		return "LodgeCmtVO [lodgecmt_no=" + lodgecmt_no + ", lodgeVO="
				+ lodgeVO + ", memberVO=" + memberVO + ", content=" + content
				+ "]";
	}		
}
