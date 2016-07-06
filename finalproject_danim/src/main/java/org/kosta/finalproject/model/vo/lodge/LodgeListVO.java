package org.kosta.finalproject.model.vo.lodge;

import java.util.List;

import org.kosta.finalproject.model.vo.PagingBean;

public class LodgeListVO 
{
	private List<LodgeVO> lodgeList;
	private PagingBean pagingBean;
	public LodgeListVO(List<LodgeVO> lodgeList, PagingBean pagingBean) {
		super();
		this.lodgeList = lodgeList;
		this.pagingBean = pagingBean;
	}
	public List<LodgeVO> getLodgeList() {
		return lodgeList;
	}
	public void setLodgeList(List<LodgeVO> lodgeList) {
		this.lodgeList = lodgeList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "LodgeListVO [lodgeList=" + lodgeList + ", pagingBean="
				+ pagingBean + "]";
	}
	
	
}
