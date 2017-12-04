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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiang.entity.Express;
import com.jiang.entity.Product;
import com.jiang.service.ExpressService;
import com.jiang.service.ProductService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ExpressService expressService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("front/login");
	}
	
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("front/index");
		mav.addObject("pagePath","/front/about.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		return new ModelAndView("front/register");
	}

	@RequestMapping(value = "/product")
	public ModelAndView product(String page) {
		if (page == null) {
			page = "1";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*18);
		map.put("quantity", 18);
		List<Product> productList = productService.findByPage(map);
		ModelAndView mav = new ModelAndView("front/index");
		if(!productList.isEmpty()){
			mav.addObject("productList", productList);
		}
		mav.addObject("pagePath", "/front/productList.jsp");
		mav.addObject("page", Integer.parseInt(page));
		mav.addObject("total", productService.findAll().size()/18 + 1);
		return mav;
	}
	
	@RequestMapping(value = "/express")
	public ModelAndView express(String page) {
		if (page == null) {
			page = "1";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (Integer.parseInt(page)-1)*10);
		map.put("quantity", 10);
		List<Express> expressList = expressService.findVerifyByPage(map);
		ModelAndView mav = new ModelAndView("front/index");
		if(!expressList.isEmpty()){
			mav.addObject("expressList", expressList);
		}
		mav.addObject("pagePath", "/front/express.jsp");
		mav.addObject("page", Integer.parseInt(page));
		mav.addObject("total", expressService.countVerify()/10 + 1);
		return mav;
	}
	
	@RequestMapping(value = "/product/{id}")
	public ModelAndView productDetail(@PathVariable Integer id) {
		ModelAndView mav = new ModelAndView("front/index");
		mav.addObject("pagePath", "/front/productDetail.jsp");
		mav.addObject("product", productService.findById(id));
		return mav;
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String imgUpload(@RequestParam("upload") MultipartFile upload,
			HttpServletRequest request, HttpServletResponse response) throws IOException {  
        response.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();  
        // CKEditor提交的很重要的一个参数
        String callback = request.getParameter("CKEditorFuncNum");
		String fileName = UUID.randomUUID().toString().replace("-", "") 
				+ "."+upload.getOriginalFilename().split("\\.")[1];
		String imagePath = "/root/IMANGO/image/other/";
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
