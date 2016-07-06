package org.kosta.finalproject.model.vo.message;

public class MessageVOAndParamMapVO {
	private MessageVO messageVO;
	private int pageNo;
	private int numberOfContent;
	public MessageVOAndParamMapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageVOAndParamMapVO(MessageVO messageVO, int pageNo,
			int numberOfContent) {
		super();
		this.messageVO = messageVO;
		this.pageNo = pageNo;
		this.numberOfContent = numberOfContent;
	}
	public MessageVO getMessageVO() {
		return messageVO;
	}
	public void setMessageVO(MessageVO messageVO) {
		this.messageVO = messageVO;
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
		return "MessageVOAndParamMapVO [messageVO=" + messageVO + ", pageNo="
				+ pageNo + ", numberOfContent=" + numberOfContent + "]";
	}
	
}
