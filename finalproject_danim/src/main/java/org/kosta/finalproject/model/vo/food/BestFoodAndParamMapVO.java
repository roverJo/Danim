package org.kosta.finalproject.model.vo.food;



public class BestFoodAndParamMapVO
{
	private BestFoodVO bestFoodVO;
	private int pageNo;
	private int numberOfContent;
	public BestFoodAndParamMapVO() {
		super();
	}
	public BestFoodAndParamMapVO(BestFoodVO bestFoodVO, int pageNo,
			int numberOfContent) {
		super();
		this.bestFoodVO = bestFoodVO;
		this.pageNo = pageNo;
		this.numberOfContent = numberOfContent;
	}
	public BestFoodVO getBestFoodVO() {
		return bestFoodVO;
	}
	public void setBestFoodVO(BestFoodVO bestFoodVO) {
		this.bestFoodVO = bestFoodVO;
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
		return "BestFoodAndParamMapVO [bestFoodVO=" + bestFoodVO + ", pageNo="
				+ pageNo + ", numberOfContent=" + numberOfContent + "]";
	}
	
	
}
