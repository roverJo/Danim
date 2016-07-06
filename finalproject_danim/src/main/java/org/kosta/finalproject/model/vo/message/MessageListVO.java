package org.kosta.finalproject.model.vo.message;

import java.util.List;

import org.kosta.finalproject.model.vo.PagingBean;

public class MessageListVO {
	private List<MessageVO> messageList;
	private PagingBean pagingBean;
	public MessageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageListVO(List<MessageVO> messageList, PagingBean pagingBean) {
		super();
		this.messageList = messageList;
		this.pagingBean = pagingBean;
	}
	public List<MessageVO> getMessageList() {
		return messageList;
	}
	public void setMessageList(List<MessageVO> messageList) {
		this.messageList = messageList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "MessageListVO [messageList=" + messageList + ", pagingBean="
				+ pagingBean + "]";
	}
	
}
