package com.jiang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String URI = request.getRequestURI();
		
		// 管理员登陆验证请求，放行。
		if (URI.indexOf("/manage/login") > 0 || URI.indexOf("/manage/admin/login") > 0)
			return true;
		
		// 管理员登陆验证请求，放行。
		if (URI.indexOf("/user/login") > 0)
			return true;
		
		// 登陆验证请求，放行。
		if (URI.indexOf("user") > 0 && URI.indexOf("manage") == 0 && request.getSession().getAttribute("user") == null) {
			response.sendRedirect("/OnlineStore/login");
		}

		// 登陆验证请求，放行。
		if (URI.indexOf("manage") > 0 && request.getSession().getAttribute("admin") == null) {
			response.sendRedirect("/OnlineStore/manage/login");
		}
		
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
