package com.jiang.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.User;
import com.jiang.service.UserService;
import com.jiang.util.MD5Util;
import com.jiang.util.PageUtil;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/manage/user")
public class UserManageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<User> userList = userService.findByPage(map);
		int total = userService.findAll().size();
		String pageCode = PageUtil.genPagination("manage/user/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("manage/index");
		mav.addObject("pagePath", "./user/list.jsp");
		if(!userList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("userList", userList);
		}
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(User user, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if (!StringUtil.isEmpty(user.getUserName())) {
			if (!userService.checkUserName(user.getUserName(), user.getId()))
				msg = "该用户名已存在";
		}else {
			if(!StringUtil.isEmpty(user.getPassword()))
				user.setPassword(MD5Util.getMD5Code(user.getPassword()));
			if(userService.update(user)){
				result = true;
				msg ="更新成功";
			}
			else msg = "更新失败";
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(int id, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(userService.delete(id)){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
}
