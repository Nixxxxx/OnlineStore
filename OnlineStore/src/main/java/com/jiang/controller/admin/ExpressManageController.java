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

import com.jiang.entity.Express;
import com.jiang.service.ExpressService;
import com.jiang.util.PageUtil;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/manage/express")
public class ExpressManageController {

	@Autowired
	private ExpressService expressService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<Express> expressList = expressService.findByPage(map);
		int total = expressService.findAll().size();
		String pageCode = PageUtil.genPagination("manage/express/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("manage/index");
		mav.addObject("pagePath", "./express/list.jsp");
		if(!expressList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("expressList", expressList);
		}
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(Express express, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(expressService.update(express)){
			result = true;
			msg ="更新成功";
		}
		else msg = "更新失败";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(int id, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(expressService.delete(id)){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
}
