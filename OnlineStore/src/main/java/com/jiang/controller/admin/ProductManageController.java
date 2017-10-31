package com.jiang.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class ProductManageController {
	
	@Autowired
	private ProductService ProductService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("index").addObject("page", "");
	}
}
