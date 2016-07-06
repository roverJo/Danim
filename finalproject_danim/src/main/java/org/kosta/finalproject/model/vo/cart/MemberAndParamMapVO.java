package org.kosta.finalproject.model.vo.cart;

import java.util.HashMap;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class MemberAndParamMapVO 
{
	private MemberVO memberVO;
	private int pageNo;
	private int numberOfContent;
	public MemberAndParamMapVO() {
		super();
	}
	public MemberAndParamMapVO(MemberVO memberVO, int pageNo,
			int numberOfContent) {
		super();
		this.memberVO = memberVO;
		this.pageNo = pageNo;
		this.numberOfContent = numberOfContent;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getNumberOfContent() {
		return numberOfContent;
	}
	public void setNumberOfContent(int numberOfContent) {
		this.numberOfContent = numberOfContent;
	}
	@Override
	public String toString() {
		return "MemberAndParamMapVO [memberVO=" + memberVO + ", pageNo="
				+ pageNo + ", numberOfContent=" + numberOfContent + "]";
	}
	
	
	
}
