package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.MessageService;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.message.MessageListVO;
import org.kosta.finalproject.model.vo.message.MessageVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
	@Resource
	private MessageService messageService;
	
	@RequestMapping("login_message_index.do")
	public ModelAndView messageList(HttpServletRequest request,String pageNo){
		HttpSession session = request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		if(vo==null){
			return new ModelAndView("home");
		}else{
			MessageVO mvo=new MessageVO(0, null, null, vo, null, null, 0, null, null);
			MessageListVO lvo=messageService.recvMessageListPaging(mvo,pageNo);
			if(lvo.getMessageList().size()!=0){
				return new ModelAndView("message_message_index","lvo",lvo);
			}else{
				return new ModelAndView("message_message_index");
			}
		}		
	}
	@RequestMapping("login_message_content.do")
	public ModelAndView messageContent(HttpServletRequest request,int message_no){
		HttpSession session = request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		MessageVO mvo=new MessageVO(message_no, null, null, vo, null, null, 0, null, null);

		if(vo==null){
			return new ModelAndView("home");
		}else{
			mvo=messageService.messageContent(mvo);

			return new ModelAndView("message_message_content","mvo",mvo);
		}
	}
	@RequestMapping(value="login_message_selectDelete.do",method = RequestMethod.POST)
	@ResponseBody
	public String selectDelete(String no[]){
		String check="N";
		if(no.length!=0){
			for(int i =0; i < no.length; i++){
			messageService.selectRecvDel(Integer.parseInt(no[i]));
			}
			check="Y";
		}
		return check;
	}
	@RequestMapping("login_message_send.do")
	public String MessageSendPage(){
		return "message/message_send";
	}
	@RequestMapping("login_sendMessage.do")
	public ModelAndView sendMessage(HttpServletRequest request,MessageVO messageVO,String recv_id){
		HttpSession session=request.getSession(false);
		MemberVO mvo=new MemberVO(recv_id, null, null, null, null, 0);
		messageVO.setRecvVO(mvo);
		mvo=(MemberVO) session.getAttribute("mvo");
		messageVO.setSendVO(mvo);
		messageService.sendMessage(messageVO);
		return new ModelAndView("message_message_result");
	}
	@RequestMapping("login_message_sendIndex.do")
	public ModelAndView sendMessageList(HttpServletRequest request,String pageNo){
		HttpSession session = request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		if(vo==null){
			return new ModelAndView("home");
		}else{
			MessageVO mvo=new MessageVO(0, null, null, null, vo, null, 0, null, null);
			MessageListVO lvo=messageService.sendMessageListPaging(mvo, pageNo);
			if(lvo.getMessageList().size()!=0){
				return new ModelAndView("message_message_send_index","lvo",lvo);
			}else{
				return new ModelAndView("message_message_send_index");
			}
		}		
	}
	@RequestMapping(value="login_message_selectSendDelete.do",method = RequestMethod.POST)
	@ResponseBody
	public String selectSendDelete(String no[]){
		String check="N";
		if(no.length!=0){
			for(int i =0; i < no.length; i++){
			messageService.selectSendDel(Integer.parseInt(no[i]));
			}
			check="Y";
		}
		return check;
	}
	@RequestMapping("login_message_sendContent.do")
	public ModelAndView messageSendContent(HttpServletRequest request,int message_no){
		HttpSession session = request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		MessageVO mvo=new MessageVO(message_no, null, null, null, vo, null, 0, null, null);
		if(vo==null){
			return new ModelAndView("home");
		}else{
			mvo=messageService.messageSendContent(mvo);
			return new ModelAndView("message_message_send_content","mvo",mvo);
		}
	}
	@RequestMapping("login_message_contentRecvDel.do")
	public String contentRecvDel(String no){
		messageService.selectRecvDel(Integer.parseInt(no));
		return "redirect:login_message_index.do";
	}
	@RequestMapping("login_message_contentSendDel.do")
	public String contentSendDel(String no){
		messageService.selectSendDel(Integer.parseInt(no));
		return "redirect:login_message_sendIndex.do";
	}
	@RequestMapping("login_message_replyReady.do")
	public ModelAndView replyReady(String sendId){
		return new ModelAndView("message/message_reply","recvId",sendId);
	}
	@RequestMapping("login_sendReplyMessage.do")
	public ModelAndView sendReplyMessage(HttpServletRequest request,MessageVO messageVO,String recv_id){
		HttpSession session=request.getSession(false);
		MemberVO mvo=new MemberVO(recv_id, null, null, null, null, 0);
		messageVO.setRecvVO(mvo);
		mvo=(MemberVO) session.getAttribute("mvo");
		messageVO.setSendVO(mvo);
		messageService.sendMessage(messageVO);
		return new ModelAndView("message_message_result");
	}
	
	/* 커뮤니티 게시판 - 쪽지 보내기 */
	@RequestMapping("login_message_comm_send.do")
	public ModelAndView commMessage(String sendId){
		return new ModelAndView("message/comm_message_send","recvId",sendId);
	}
	@RequestMapping("login_comm_sendMessage.do")
	public ModelAndView commSendMessage(HttpServletRequest request,MessageVO messageVO,String recv_id){
		HttpSession session=request.getSession(false);
		MemberVO mvo=new MemberVO(recv_id, null, null, null, null, 0);
		messageVO.setRecvVO(mvo);
		mvo=(MemberVO) session.getAttribute("mvo");
		messageVO.setSendVO(mvo);
		messageService.sendMessage(messageVO);
		return new ModelAndView("message_comm_message_result");
	}
	
	@RequestMapping(value="login_message_selectRead.do",method = RequestMethod.POST)
	@ResponseBody
	public String selectRead(String no[]){
		String check="N";
		if(no.length!=0){
			for(int i =0; i < no.length; i++){
			messageService.readAcc(Integer.parseInt(no[i]));
			}
			check="Y";
		}
		return check;
	}
}
