package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.message.MessageVO;
import org.kosta.finalproject.model.vo.message.MessageVOAndParamMapVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<MessageVO> messageList(MessageVOAndParamMapVO vo){
		return template.selectList("message.messageList",vo);
	}
	@Override
	public MessageVO messageContent(MessageVO mvo) {
		return template.selectOne("message.messageContent", mvo);
	}
	@Override
	public void readAcc(int message_no) {
		template.update("message.readAcc",message_no);
	}
	@Override
	public void selectRecvDel(int no){
		template.update("message.selectRecvDel",no);
	}
	@Override
	public void deleteMessage(int no){
		template.delete("message.deleteMessage",no);
	}
	@Override
	public void sendMessage(MessageVO messageVO){
		template.insert("message.sendMessage",messageVO);
	}
	@Override
	public List<MessageVO> sendMessageList(MessageVOAndParamMapVO vo){
		return template.selectList("message.sendMessageList",vo);
	}
	@Override
	public void selectSendDel(int no) {
		template.update("message.selectSendDel",no);		
	}
	@Override
	public MessageVO messageSendContent(MessageVO mvo) {
		return template.selectOne("message.messageSendContent", mvo);
	}
	@Override
	public int countNoRead(String recvId){
		return template.selectOne("message.countNoRead",recvId);
	}
	@Override
	public int recvMessageTotal(MessageVO vo){
		return template.selectOne("message.recvMessageTotal",vo);
	}
	@Override
	public int sendMessageTotal(MessageVO vo){
		return template.selectOne("message.sendMessageTotal",vo);
	}
}
