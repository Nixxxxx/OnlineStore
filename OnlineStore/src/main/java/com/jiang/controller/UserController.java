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
import com.jiang.service.ProductService;
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
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(User user, String captcha, HttpServletRequest request, HttpServletResponse response) throws Exception{
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
				user.setVerify(0);
				if(userService.add(user)){
					result = true;
					msg = "注册成功";
				}else msg = "注册失败";
			}
		}else msg = "验证码错误";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	

	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("user");
		ResponseUtil.write(response, new JSONObject().put("result", true));
	}
	
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	public void verify(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer id = ((User) request.getSession().getAttribute("user")).getId();
		user.setId(id);
		String msg = "";
		user.setVerify(1);
		if(userService.update(user)) {
			msg = "认证信息已更新，等待管理员审核";
			request.getSession().setAttribute("user", userService.findById(id));
		}else {
			msg = "认证信息更新失败";
		}
		ResponseUtil.write(response, new JSONObject().put("msg", msg));
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public void changePassword(String password, HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		user = new User(user.getId(), MD5Util.getMD5Code(password));
		boolean result = false;
		if(userService.update(user)) {
			result = true;
		}
		ResponseUtil.write(response, new JSONObject().put("result", result));
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
	
	@RequestMapping(value = "/express")
	public ModelAndView express(String page, HttpServletRequest request) {
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
		List<Express> expressList = expressService.findVerifyByPage(map);
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "/front/user/express.jsp");
		if(!expressList.isEmpty())
			mav.addObject("expressList", expressList);
		mav.addObject("page", Integer.parseInt(page));
		mav.addObject("total", expressService.findAllByUser(map)/10 + 1);
		return mav;
	}
	
	@RequestMapping(value = "/addExpress", method = RequestMethod.POST)
	public void addExpress(String message, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer userId = ((User) request.getSession().getAttribute("user")).getId();
		Express express = new Express(userService.findById(userId), message, 0);
		boolean result = false;
		if(expressService.add(express)) {
			result = true;
		}
		ResponseUtil.write(response, new JSONObject().put("result", result));
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public void order(@RequestParam(required = true) Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		String msg = "";
		boolean result = false;
		if(user == null) {
			msg = "请先登陆";
		}else {
			Express express = expressService.findById(id);
			if(express.getSender() != null) {
				msg = "此单已被接单";
				
			}else if(user.getVerify() != 3){
				msg = "小蜜蜂认证未通过";
			}else if(express.getUser().getId() == user.getId()) {
				msg = "不能接自己发布的订单";
			}else {
				express.setSender(userService.findById(user.getId()));
				if(expressService.update(express)) {
					result = true;
					msg = "接单成功";
				}else msg = "异常";
			}
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@RequestMapping(value = "/message")
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
		List<Message> messageList = messageService.findByPage(map);
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "/front/user/message.jsp");
		if(!messageList.isEmpty())
			mav.addObject("messageList", messageList);
		mav.addObject("page", Integer.parseInt(page));
		mav.addObject("total", messageService.findAllByUser(map)/10 + 1);
		return mav;
	}
	
	@RequestMapping(value = "/addMessage", method = RequestMethod.POST)
	public void addMessage(String msg, Integer userId, Integer productId,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Message message = new Message(userService.findById(userId),productService.findById(productId), msg, 0);
		boolean result = false;
		if(messageService.add(message)) {
			result = true;
		}
		ResponseUtil.write(response, new JSONObject().put("result", result));
	}

	@RequestMapping(value = "/info")
	public ModelAndView info(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null)
			return new ModelAndView("front/login");
		ModelAndView mav = new ModelAndView("front/user/index");
		mav.addObject("pagePath", "/front/user/info.jsp");
		return mav;
	}
}
