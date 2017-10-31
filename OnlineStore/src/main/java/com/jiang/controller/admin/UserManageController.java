package com.jiang.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.PageBean;
import com.jiang.entity.User;
import com.jiang.service.UserService;
import com.jiang.util.CryptographyUtil;
import com.jiang.util.PageUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/admin/user")
public class UserManageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page, 
			HttpServletRequest request, HttpServletResponse response) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		List<User> userList = userService.findByPage(Integer.parseInt(page), 10);
		int total = userService.findAll().size();
		String pageCode = PageUtil.genPagination("admin/user/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("admin/index");
		mav.addObject("pagePath", "./manage/user/list.jsp");
		if(!userList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("userList", userList);
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public JSONObject insert(User user, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if(!userService.checkEmail(user.getEmail(), 0)){
			msg = "该邮箱已存在";
		}else if(!userService.checkUserName(user.getUserName(), 0)){
			msg = "该用户名已存在";
		}else {
			user.setPassword(CryptographyUtil.md5(user.getPassword(), "jiang"));
			if(userService.add(user)){
				result = true;
				msg = "注册成功";
			}else msg = "注册失败";
		}
		return new JSONObject().put("result", result).put("msg", msg);
	}
	
	@ResponseBody
	@RequestMapping(value = "/update")
	public JSONObject update(User user, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if (!userService.checkEmail(user.getEmail(), user.getId())) {
			msg = "该邮箱已存在";
		}else if (!userService.checkUserName(user.getUserName(), user.getId())) {
			msg = "该用户名已存在";
		}else {
			user.setPassword(CryptographyUtil.md5(user.getPassword(), "jiang"));
			if(userService.update(user)){
				result = true;
				msg ="更新成功";
			}
			else msg = "更新失败";
		}
		return new JSONObject().put("result", result).put("msg", msg);
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public JSONObject delete(int id, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if(userService.delete(id)){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		return new JSONObject().put("result", result).put("msg", msg);
	}
}
