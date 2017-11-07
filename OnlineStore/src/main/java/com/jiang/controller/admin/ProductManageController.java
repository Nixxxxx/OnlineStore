package com.jiang.controller.admin;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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
	public void update(@RequestParam(value = "file", required = false) MultipartFile file, Product product, 
			HttpServletResponse response) throws Exception{
		boolean result = false;
		String msg;
		if(!file.isEmpty()){
			String fileName = System.currentTimeMillis() + ".jpg";
			product.setAvater("/OnlineStore/image/avater/"+fileName);
			try {
				Image img = ImageIO.read(((DiskFileItem)((CommonsMultipartFile)file).getFileItem()).getStoreLocation());
				BufferedImage image = new BufferedImage(350, 350,BufferedImage.TYPE_INT_RGB );   
		        image.getGraphics().drawImage(img, 0, 0, 350, 350, null); // 绘制缩小后的图  
		        File destFile = new File("C:/IMANGO/image/avater/" + fileName); 
				if (!destFile.exists()) { // 如果路径不存在，创建  
					destFile.mkdirs();  
				} 
		        ImageIO.write(image, "jpg", destFile);
			} catch (Exception e) {
				e.printStackTrace();
				msg = "更新异常";
			}
		}
		if(product.getId() != null) {
			if(productService.update(product)) {
				result = true;
				msg = "更新成功";
			}else {
				msg = "更新失败";
			}
		}else {
			if(productService.add(product)) {
				result = true;
				msg = "添加成功";
			}else {
				msg = "添加失败";
			}
		}
		ResponseUtil.write(response, new JSONObject().put("result", result).put("msg", msg));
	}
	
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
