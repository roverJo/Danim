package org.kosta.finalproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.NoticeService;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.notice.NoticeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@Resource(name="noticeServiceImpl")
	private NoticeService noticeService;
	
	@RequestMapping(value="notice_write_ready.do",method=RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request, NoticeVO noticeVO) {
		HttpSession session=request.getSession(false);
		if(session!=null){
			MemberVO memberVO=(MemberVO) session.getAttribute("mvo");
			if(memberVO!=null){
				noticeVO.setMemberVO(memberVO);
			}
		}
		noticeService.write(noticeVO);
//		System.out.println(noticeVO);
	return new ModelAndView("redirect:notice_list.do");
	}

	@RequestMapping("notice_list.do")
	public ModelAndView list(String pageNo) {
		return new ModelAndView("notice_list","lvo",noticeService.getNoticeList(pageNo));
	}

	@RequestMapping("notice_content.do")
	public ModelAndView showContent(int no) {
		return new ModelAndView("notice_content","nvo",noticeService.content(no));
	}

	@RequestMapping("notice_delete.do")
	public ModelAndView deleteNotice(int no) {
		
		noticeService.deleteNotice(no);
		return new ModelAndView("notice_list","lvo",noticeService.getNoticeList());
	}

	@RequestMapping("notice_update_view.do")
	public ModelAndView update_view(int no) {
		return new ModelAndView("notice_update","nvo",noticeService.content(no));
	}
	@RequestMapping(value="noticeupdate.do",method=RequestMethod.POST)
	public ModelAndView updateNotice(NoticeVO noticeVO) {
		noticeService.updateNotice(noticeVO);
//		System.out.println(noticeVO);
		return new ModelAndView("notice_content","nvo",noticeService.content(noticeVO.getNoticeno()));
	}
}
