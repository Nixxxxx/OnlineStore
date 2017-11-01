package com.jiang.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Product;
import com.jiang.service.ProductService;
import com.jiang.util.PageUtil;
import com.jiang.util.ResponseUtil;
import com.jiang.util.StringUtil;

@Controller
@RequestMapping("/manage/product")
public class ProductManageController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false)String page) {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<Product> productList = productService.findByPage(map);
		int total = productService.findAll().size();
		String pageCode = PageUtil.genPagination("manage/product/list", total, Integer.parseInt(page),10, null);
		ModelAndView mav = new ModelAndView("manage/index");
		mav.addObject("pagePath", "./product/list.jsp");
		if(!productList.isEmpty()){
			mav.addObject("pageCode", pageCode);
			mav.addObject("productList", productList);
		}
		return mav;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView modify(@PathVariable(required = false) Integer id) {
		ModelAndView mav = new ModelAndView("manage/index");
		if(id != 0)
			mav.addObject("product", productService.findById(id));
		mav.addObject("pagePath", "./product/info.jsp");
		return mav;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(Product product, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(productService.update(product)){
			result = true;
			msg ="更新成功";
		}
		else msg = "更新失败";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public void update(@RequestParam("imageFile") MultipartFile imageFile, Product product, 
//			HttpServletResponse response) throws IOException{
//		boolean result = false;
//		String msg;
//		if(!imageFile.isEmpty()){
//			String fileName = "blogger" + "." + imageFile.getOriginalFilename().split("\\.")[1];
//			String imagePath = "C:/image/avater/";
//			product.setImagePath("/BBlog/image/avater/"+fileName);
//			try {
//				File file = new File(imagePath+fileName);
//				if (!file.exists()) { // 如果路径不存在，创建 
//					file.mkdirs();  
//				} 
//			imageFile.transferTo(file);
//			} catch (Exception e) {
//				e.printStackTrace();
//				msg = "更新异常";
//			}
//		}else {
//			product.setImagePath(productService.findById(1).getImagePath());
//		}
//		if(productService.update(product)){
//			result = true;
//			msg = "更新成功";
//		}else msg = "更新失败";
//		if(result == true){
//			response.sendRedirect("info");
//		}else {
//			ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
//		}
//	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(int id, HttpServletResponse response) throws Exception {
		boolean result = false;
		String msg = "";
		if(productService.delete(id)){
			result = true;
			msg = "删除成功";
		}
		else msg = "更新失败";
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
}
