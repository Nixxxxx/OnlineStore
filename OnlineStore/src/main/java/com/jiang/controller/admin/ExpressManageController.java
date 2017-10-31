package com.jiang.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Express;
import com.jiang.service.ExpressService;

@Controller
@RequestMapping("/admin/express")
public class ExpressManageController {

	@Autowired
	private ExpressService expressService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		List<Express> express = expressService.findAll();
		return new ModelAndView("manage/index");
	}
}
