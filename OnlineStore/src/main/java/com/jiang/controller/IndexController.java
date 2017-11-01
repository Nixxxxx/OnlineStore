package com.jiang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Product;
import com.jiang.service.ProductService;
import com.jiang.util.PageUtil;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/index/{page}")
	public ModelAndView index(@PathVariable(required = false) Integer page) {
		if (page != null) {
			page = 1;
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (page-1)*12);
		map.put("quantity", 12);
		List<Product> productList = productService.findByPage(map);
		int total = productService.findAll().size();
		String pageCode = PageUtil.genPagination("/index", total, page, 12, null);
		ModelAndView mav = new ModelAndView("front/index");
		if(!productList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("productList", productList);
		}
		return mav;
	}
}
