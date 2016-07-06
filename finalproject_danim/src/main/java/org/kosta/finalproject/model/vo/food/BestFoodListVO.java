package org.kosta.finalproject.model.vo.food;

import java.util.List;

import org.kosta.finalproject.model.vo.PagingBean;


public class BestFoodListVO
{
	private List<BestFoodVO> bestFoodList;
	private PagingBean pagingBean;
	public BestFoodListVO() {
		super();
	}
	public BestFoodListVO(List<BestFoodVO> bestFoodList, PagingBean pagingBean) {
		super();
		this.bestFoodList = bestFoodList;
		this.pagingBean = pagingBean;
	}
	public List<BestFoodVO> getBestFoodList() {
		return bestFoodList;
	}
	public void setBestFoodList(List<BestFoodVO> bestFoodList) {
		this.bestFoodList = bestFoodList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "BestFoodListVO [bestFoodList=" + bestFoodList + ", pagingBean="
				+ pagingBean + "]";
	}
	
	
}
