package com.doglife.db.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@SuppressWarnings("deprecation")
@Log
public class SessionInterceptor extends HandlerInterceptorAdapter {
	/*
	//컨트롤러로 요청(request)가 전달되기 전에 처리하는 메소드
	//로그인 전 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle()");
		
		HttpSession session = request.getSession();
		//세션에 로그인 정보(memb)가 없으면 첫페이지로 강제 이동
		if(session.getAttribute("memb")==null) {
			log.info("Intercepted");
			
			response.sendRedirect("./");
			return false;
		}
		return true;
	}

	//브라우저로 응답(response)가 보내지기 전에 처리하는 메소드
	//로그아웃 후 처리
	//브라우저에게 캐쉬(저장)된 페이지를 제거하도록 명령
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle()");
		
		//현재 웹 프로토콜(http) 버전은 1.0과 1.1이 혼용되고 있음
		if(request.getProtocol().equals("HTTP/1.1")) {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		}
		else {//1.0 버전
			response.setHeader("Pragma", "no-cache");
		}
		response.setDateHeader("Expires", 0);
		
	}
	*/

}
