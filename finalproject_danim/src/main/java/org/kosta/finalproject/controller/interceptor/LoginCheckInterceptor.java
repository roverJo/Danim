package org.kosta.finalproject.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false); 
		if(session == null || session.getAttribute("mvo") == null) {//로그인 상태가 아니면 
			System.out.println("Handler Interceptor 로그인 상태 아님");
			response.sendRedirect("loginCheck.do");
			return false;
		}
		return true;
	}
	
}