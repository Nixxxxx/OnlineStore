package com.jiang.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manage")
public class IndexManageController {
	@RequestMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("manage/login");
	}
}
