package org.kosta.finalproject.aop;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Aspect
public class LoggingAspect 
{
	private Log log = LogFactory.getLog(getClass());
	
	/*@Around("execution(public * org.kosta.finalproject.model.service..*Service.*Login(..))")*/
	
	/*@Around("execution(public * org.kosta.finalproject.model.service..*Service.*Login(..))")*/
	public Object asdasdas(ProceedingJoinPoint point) throws Throwable
	{
		HttpServletRequest request = 
				((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("mvo") == null)
        {
			throw new LoginException("로그인 상태 아님");
        }

		Object retValue = null;
		
		retValue = point.proceed();
		
		System.out.println(retValue);
		
		return retValue;
	}
}
