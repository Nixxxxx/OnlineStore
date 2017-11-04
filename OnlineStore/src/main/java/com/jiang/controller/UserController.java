package com.jiang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Express;
import com.jiang.entity.Message;
import com.jiang.entity.User;
import com.jiang.service.ExpressService;
import com.jiang.service.MessageService;
import com.jiang.service.UserService;
import com.jiang.util.MD5Util;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private ExpressService expressService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(User user, String captcha, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(1111);
		String sRand = (String) request.getSession().getAttribute("sRand"); //获取图片验证码实际值
		boolean result = false;
		String msg = "验证码错误";
		if (captcha.equalsIgnoreCase(sRand)) {
			msg = "用户名或密码错误";
			user = userService.login(user);
			if(user != null) {
				result = true;
				request.getSession().setAttribute("user", user);
			}
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void register(User user, @RequestParam String captcha,@SessionAttribute String sRand,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		boolean result = false;
		if(captcha.equalsIgnoreCase(sRand)){
			if(!userService.checkUserName(user.getUserName(), 0)){
				msg = "该用户名已存在";
			}else {
				user.setPassword(MD5Util.getMD5Code(request.getParameter("password")));
				if(userService.add(user)){
					result = true;
					msg = "注册成功";
				}else msg = "注册失败";
			}
		}else msg = "验证码错误";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	

	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return null;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(User user, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String msg = "";
		boolean result = false;
		if (!userService.checkEmail(user.getEmail(), user.getId())) {
			msg = "该邮箱已存在";
		} else if(!userService.checkUserName(user.getUserName(), user.getId())){
			msg = "该用户名已存在";
		} else {
			if(userService.update(user)){
				result = true;
				msg = "更新成功";
				request.getSession().setAttribute("user", userService.findById(user.getId()));
			}else msg = "更新失败";
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@RequestMapping(value = "/express", method = RequestMethod.GET)
	public ModelAndView express(String page, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		map.put("userId", user.getId());
		List<Express> expressList = expressService.findByUserId(map);
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "front/user/express");
		if(!expressList.isEmpty())
			mav.addObject("expressList", expressList);
		mav.addObject("page", Integer.parseInt(page));
		return mav;
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public ModelAndView message(String page, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null)
			return new ModelAndView("front/login");
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		map.put("userId", user.getId());
		List<Message> messageList = messageService.findByUserId(map);
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "front/user/message");
		if(!messageList.isEmpty())
			mav.addObject("messageList", messageList);
		return mav;
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView info() {
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "front/user/info");
		return mav;
	}
}
