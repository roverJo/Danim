package org.kosta.finalproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	/*
	 * @PathVariable : 요청 url 정보를 변수로 할당 받는다 
	 * 요청 url 과 일치하는 url 매핑 정보가 있으면 
	 * ( 즉 별도의 메서드가 있으면 ) 
	 * 그 메서드가 실행되고 
	 * 없으면 
	 * @PathVariable 적용 메서드가 실행된다 
	 */
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		System.out.println("@PathVariable:"+viewId);
		return viewId;
	}
	
	@RequestMapping("test.do")
	public ModelAndView test(HttpServletRequest request){
		HttpSession dummySession = request.getSession(true);
		dummySession.putValue("userID", "Watcher");
		HttpSessionContext context = dummySession.getSessionContext();


		HttpSession session = request.getSession(false);
		System.out.println(session);
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		list.add((MemberVO)session.getAttribute("mvo"));
		return new ModelAndView("community_test","nickname",list);
	}
}




