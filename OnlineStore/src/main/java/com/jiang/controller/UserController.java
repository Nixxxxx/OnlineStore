package com.jiang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.User;
import com.jiang.service.UserService;
import com.jiang.util.CryptographyUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public JSONObject login(User user, HttpServletRequest request, HttpServletResponse response){
		String msg = "";
		boolean result = false;
		JSONObject resultJson=new JSONObject();
		user = userService.login(user);
		if(user == null) {
			msg = "";
		}else {
			result = true;
			msg = "";
		}
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}
	

	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public JSONObject register(User user, @RequestParam String captcha,@SessionAttribute String sRand,
			HttpServletRequest request, HttpServletResponse response) {
		String msg = "";
		boolean result = false;
		JSONObject resultJson=new JSONObject();
		if(captcha.equalsIgnoreCase(sRand)){
			if(!userService.checkUserName(user.getUserName(), 0)){
				msg = "该用户名已存在";
			}else {
				user.setPassword(CryptographyUtil.md5(request.getParameter("password"), "jiang"));
				if(userService.add(user) == 1){
					result = true;
					msg = "注册成功，去邮箱激活";
				}else msg = "注册失败";
			}
		}else msg = "验证码错误";
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}
	

	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public JSONObject update(User user, HttpServletRequest request, HttpServletResponse response){
		String msg = "";
		boolean result = false;
		if (!userService.checkEmail(user.getEmail(), user.getId())) {
			msg = "该邮箱已存在";
		} else if(!userService.checkUserName(user.getUserName(), user.getId())){
			msg = "该用户名已存在";
		} else {
			if(userService.update(user) == 1){
				result = true;
				msg = "更新成功";
				request.getSession().setAttribute("user", userService.findById(user.getId()));
			}else msg = "更新失败";
		}
		JSONObject resultJson=new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView info() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("pagePath", "./front/user/info.jsp");
		return mav;
	}
}
