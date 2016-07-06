package org.kosta.finalproject.model.vo.lodge;

public class LodgeAndParamMapVO 
{
	private LodgeVO lodgeVO;
	private int pageNo;
	private int numberOfContent;
	public LodgeAndParamMapVO() {
		super();
	}
	public LodgeAndParamMapVO(LodgeVO lodgeVO, int pageNo, int numberOfContent) {
		super();
		this.lodgeVO = lodgeVO;
		this.pageNo = pageNo;
		this.numberOfContent = numberOfContent;
	}
	public LodgeVO getLodgeVO() {
		return lodgeVO;
	}
	public void setLodgeVO(LodgeVO lodgeVO) {
		this.lodgeVO = lodgeVO;
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
		return "LodgeAndParamMapVO [lodgeVO=" + lodgeVO + ", pageNo=" + pageNo
				+ ", numberOfContent=" + numberOfContent + "]";
	}
	
	
}
