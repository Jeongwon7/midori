package com.midori.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException accessException) throws IOException, ServletException {
		log.error("Access Denied Handler");
		log.error("Redirect....");
		String error = null;
		if (accessException instanceof AuthenticationServiceException) {
			request.setAttribute("error", "존재하지 않는 사용자입니다.");
		
		} else if(accessException instanceof BadCredentialsException) {
			error = "아이디 또는 비밀번호가 틀립니다.";
			request.setAttribute("error", "아이디 또는 비밀번호가 틀립니다.");
			
		} else if(accessException instanceof LockedException) {
			request.setAttribute("error", "잠긴 계정입니다..");
			
		} else if(accessException instanceof DisabledException) {
			request.setAttribute("error", "비활성화된 계정입니다..");
			
		} else if(accessException instanceof AccountExpiredException) {
			request.setAttribute("error", "만료된 계정입니다..");
			
		} else if(accessException instanceof CredentialsExpiredException) {
			request.setAttribute("error", "비밀번호가 만료되었습니다.");
		}
		
		log.error(error);
		// 로그인 페이지로 다시 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		dispatcher.forward(request, response);

	}

}
