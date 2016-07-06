package org.kosta.finalproject.model.vo.notice;

import java.util.List;

public class NoticeListVO {
	private List<NoticeVO> list;
	private NoticePagingBean pagingBean;
	
	public NoticeListVO() {
		super();
	}

	public NoticeListVO(List<NoticeVO> list, NoticePagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
	}

	public NoticePagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(NoticePagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "NoticeListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}










