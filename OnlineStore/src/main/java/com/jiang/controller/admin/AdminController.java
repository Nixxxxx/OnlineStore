package com.jiang.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Admin;
import com.jiang.entity.PageBean;
import com.jiang.service.AdminService;
import com.jiang.util.CryptographyUtil;
import com.jiang.util.PageUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/admin")
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
	public JSONObject insert(Admin admin, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if(!checkUserName(admin.getUserName(), 0)){
			msg = "该邮箱已存在";
		}else {
			admin.setPassword(CryptographyUtil.md5(admin.getPassword(), "jiang"));
			if(adminService.add(admin) == 1){
				result = true;
				msg = "注册成功";
			}else msg = "注册失败";
		}
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public JSONObject update(Admin admin, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if (!checkUserName(admin.getUserName(), admin.getId())) {
			msg = "该邮箱已存在";
		}else {
			admin.setPassword(CryptographyUtil.md5(admin.getPassword(), "jiang"));
			if(adminService.update(admin) == 1){
				result = true;
				msg ="更新成功";
			}
			else msg = "更新失败";
		}
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public JSONObject delete(Integer id, HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String msg = "";
		if(adminService.delete(id) ==1 ){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("msg", msg);
		return resultJson;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(required = false)String page, 
			HttpServletRequest request, HttpServletResponse response) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), 10);
		List<Admin> adminList = adminService.findList(pageBean);
		for(Admin admin:adminList){
			admin.setPassword(CryptographyUtil.md5(admin.getPassword(), "jiang"));
		}
		int total = adminList.size();
		String pageCode = PageUtil.genPagination("admin/list", total, pageBean.getPage(),pageBean.getPageSize(), null);
		ModelAndView mav = new ModelAndView("admin/index");
		mav.addObject("pagePath", "./admin/list.jsp");
		if(!adminList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("adminList", adminList);
		}
		return mav;
	}
	
	public boolean checkUserName(String userName, Integer id){
		List<Admin> admins = adminService.findAll();
		for(Admin admin:admins){
			if(admin.getUserName().equals(userName) && admin.getId() != id)
				return false;
		}
		return true;
	}
}
