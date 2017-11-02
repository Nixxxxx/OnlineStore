package com.jiang.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value = "/product/{id}")
	public ModelAndView productDetail(@PathVariable Integer id) {
		ModelAndView mav = new ModelAndView("front/productDetail");
		mav.addObject("product", productService.findById(id));
		return mav;
	}
	
	
	@RequestMapping("/upload")
	public String imgUpload(@RequestParam("upload") MultipartFile upload,
			HttpServletRequest request, HttpServletResponse response) throws IOException {  
        response.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();  
        // CKEditor提交的很重要的一个参数  
        String callback = request.getParameter("CKEditorFuncNum");
		String fileName = UUID.randomUUID().toString().replace("-", "") 
				+ "."+upload.getOriginalFilename().split("\\.")[1];
		String imagePath = "C:/image/other/";
        if(!upload.isEmpty()){
			try {
				File file = new File(imagePath + fileName);
				if (!file.exists()) { // 如果路径不存在，创建  
					file.mkdirs();  
				} 
				upload.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 返回"图像"选项卡并显示图片  request.getContextPath()为web项目名   
        out.println("<script type=\"text/javascript\">");  
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback  
                + ",'" + "/OnlineStore/image/other/" + fileName + "','')");  
        out.println("</script>");  
        return null;  
    }
}
