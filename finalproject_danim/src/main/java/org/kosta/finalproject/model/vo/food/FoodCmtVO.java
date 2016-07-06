package org.kosta.finalproject.model.vo.food;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class FoodCmtVO {
	private int foodcmt_no;
	private BestFoodVO bestFoodVO;
	private MemberVO memberVO;
	private String content;
	public FoodCmtVO() {
		super();
	}
	public FoodCmtVO(int foodcmt_no, BestFoodVO bestFoodVO, MemberVO memberVO,
			String content) {
		super();
		this.foodcmt_no = foodcmt_no;
		this.bestFoodVO = bestFoodVO;
		this.memberVO = memberVO;
		this.content = content;
	}
	public int getFoodcmt_no() {
		return foodcmt_no;
	}
	public void setFoodcmt_no(int foodcmt_no) {
		this.foodcmt_no = foodcmt_no;
	}
	public BestFoodVO getBestFoodVO() {
		return bestFoodVO;
	}
	public void setBestFoodVO(BestFoodVO bestFoodVO) {
		this.bestFoodVO = bestFoodVO;
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
		return "FoodCmtVO [foodcmt_no=" + foodcmt_no + ", bestFoodVO="
				+ bestFoodVO + ", memberVO=" + memberVO + ", content="
				+ content + "]";
	}	
}
