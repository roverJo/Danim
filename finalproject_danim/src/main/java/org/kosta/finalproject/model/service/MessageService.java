package org.kosta.finalproject.model.service;

import org.kosta.finalproject.model.vo.message.MessageListVO;
import org.kosta.finalproject.model.vo.message.MessageVO;

public interface MessageService {

	public abstract MessageListVO recvMessageListPaging(MessageVO vo,String pageNo);
	public abstract MessageListVO recvMessageListPaging(MessageVO vo,int pageNo);
	public abstract MessageVO messageContent(MessageVO mvo);
	public abstract void selectRecvDel(int no);
	public abstract void sendMessage(MessageVO messageVO);
	public abstract MessageListVO sendMessageListPaging(MessageVO vo,String pageNo);
	public abstract MessageListVO sendMessageListPaging(MessageVO vo,int pageNo);
	public abstract void selectSendDel(int no);
	public abstract MessageVO messageSendContent(MessageVO mvo);
	public abstract int countNoRead(String recvId);
	public abstract void readAcc(int no);
}
