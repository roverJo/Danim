package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.message.MessageVO;
import org.kosta.finalproject.model.vo.message.MessageVOAndParamMapVO;

public interface MessageDAO {

	public abstract List<MessageVO> messageList(MessageVOAndParamMapVO vo);
	public abstract MessageVO messageContent(MessageVO mvo);
	public abstract void readAcc(int message_no);
	public abstract void selectRecvDel(int no);
	public abstract void deleteMessage(int no);
	public abstract void sendMessage(MessageVO messageVO);
	public abstract List<MessageVO> sendMessageList(MessageVOAndParamMapVO vo);
	public abstract void selectSendDel(int no);
	public abstract MessageVO messageSendContent(MessageVO mvo);
	public abstract int countNoRead(String recvId);
	public abstract int recvMessageTotal(MessageVO vo);
	public int sendMessageTotal(MessageVO vo);
}