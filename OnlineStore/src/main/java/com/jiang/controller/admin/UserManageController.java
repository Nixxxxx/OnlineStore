package com.jiang.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.User;
import com.jiang.service.UserService;
import com.jiang.util.CryptographyUtil;
import com.jiang.util.PageUtil;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/manage/user")
public class UserManageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page, 
			HttpServletRequest request, HttpServletResponse response) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<User> userList = userService.findByPage(map);
		int total = userService.findAll().size();
		String pageCode = PageUtil.genPagination("admin/user/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("manage/index");
		mav.addObject("pagePath", "./user/list.jsp");
		if(!userList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("userList", userList);
		}
		return mav;
	}
	
	@RequestMapping(value = "/update")
	public void update(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if (!StringUtil.isEmpty(user.getUserName())) {
			if (!userService.checkUserName(user.getUserName(), user.getId()))
				msg = "该用户名已存在";
		}else {
			if(!StringUtil.isEmpty(user.getPassword()))
				user.setPassword(CryptographyUtil.md5(user.getPassword(), "jiang"));
			if(userService.update(user)){
				result = true;
				msg ="更新成功";
			}
			else msg = "更新失败";
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@RequestMapping("/delete")
	public void delete(int id, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
