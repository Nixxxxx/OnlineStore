package com.jiang.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Admin;
import com.jiang.service.AdminService;
import com.jiang.util.CryptographyUtil;
import com.jiang.util.PageUtil;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/manage/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("manage/index");
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");
	}
	
	@RequestMapping("/insert")
	public void insert(Admin admin, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(!adminService.checkUserName(admin.getUserName(), 0)){
			msg = "该用户名已存在";
		}else {
			admin.setPassword(CryptographyUtil.md5(admin.getPassword(), "jiang"));
			if(adminService.add(admin)){
				result = true;
				msg = "注册成功";
			}else msg = "注册失败";
		}
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public void update(Admin admin, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if (!adminService.checkUserName(admin.getUserName(), admin.getId())) {
			msg = "该邮箱已存在";
		}else {
			admin.setPassword(CryptographyUtil.md5(admin.getPassword(), "jiang"));
			if(adminService.update(admin)){
				result = true;
				msg ="更新成功";
			}
			else msg = "更新失败";
		}
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public void delete(Integer id, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(adminService.delete(id)){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<Admin> adminList = adminService.findByPage(map);
		int total = adminService.findAll().size();
		String pageCode = PageUtil.genPagination("manage/admin/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("manage/index");
		mav.addObject("pagePath", "./admin/list.jsp");
		if(!adminList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("adminList", adminList);
		}
		return mav;
	}
	
}
