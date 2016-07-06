package org.kosta.finalproject.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.MessageDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.message.MessageListVO;
import org.kosta.finalproject.model.vo.message.MessageVO;
import org.kosta.finalproject.model.vo.message.MessageVOAndParamMapVO;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	@Resource
	private MessageDAO messageDAO;
	@Resource(name="pagingConfigMessage")
	private Map<String,Integer> pagingConfigMessage;

	/*@Override
	public List<MessageVO> messageList(String recvId) {
		return messageDAO.messageList(recvId);
	}*/
	public MessageListVO recvMessageListPaging(MessageVO vo,String pageNo){			
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);		
		return recvMessageListPaging(vo,pno);
	}
	public MessageListVO recvMessageListPaging(MessageVO vo,int pageNo){
		List<MessageVO> list = messageDAO.messageList(new MessageVOAndParamMapVO(vo,pageNo,pagingConfigMessage.get("numberOfContent")));
		int total=messageDAO.recvMessageTotal(vo);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigMessage);
		MessageListVO lvo=new MessageListVO(list,paging);
		return lvo;
	}
	
	@Override
	public MessageVO messageContent(MessageVO mvo) {
		messageDAO.readAcc(mvo.getMessage_no());
		MessageVO vo = messageDAO.messageContent(mvo);
		return vo;
	}
	@Override
	public void selectRecvDel(int no) {
		//받은 사람이 삭제버튼을 눌렀을 경우 받은사람 삭제값을 Y로 변경
		messageDAO.selectRecvDel(no);
		//받은 사람, 보낸 사람이 모두 삭제를 했을 경우 db에서 delete
		messageDAO.deleteMessage(no);
	}

	@Override
	public void sendMessage(MessageVO messageVO) {
		messageDAO.sendMessage(messageVO);		
	}

	public MessageListVO sendMessageListPaging(MessageVO vo,String pageNo){			
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);	
		return sendMessageListPaging(vo,pno);
	}
	public MessageListVO sendMessageListPaging(MessageVO vo,int pageNo){
		List<MessageVO> list = messageDAO.sendMessageList(new MessageVOAndParamMapVO(vo,pageNo,pagingConfigMessage.get("numberOfContent")));
		int total=messageDAO.sendMessageTotal(vo);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigMessage);
		MessageListVO lvo=new MessageListVO(list,paging);
		return lvo;
	}
	

	@Override
	public void selectSendDel(int no) {
		messageDAO.selectSendDel(no);
		messageDAO.deleteMessage(no);
	}

	@Override
	public MessageVO messageSendContent(MessageVO mvo) {
		return messageDAO.messageSendContent(mvo);
	}

	@Override
	public int countNoRead(String recvId) {
		return messageDAO.countNoRead(recvId);
	}
	
	@Override
	public void readAcc(int no) {
		messageDAO.readAcc(no);		
	}
}
