package com.bdqn.controller;

import javax.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.bdqn.po.Colour;
import com.bdqn.po.Inventory;
import com.bdqn.service.colourService;
import com.bdqn.service.inventoryService;

/**
 * 	颜色表控制层
 * @author dell
 *
 */
@Controller
@RequestMapping("/colour")
public class colourController {
	//创建service对象
	@Resource(name="colourService")
	colourService colourServiceImpl;
	
	/**
	 * 	添加颜色
	 */
	@RequestMapping(value="/doAdd",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doAdd(Colour colour) {
		//调用添加
		int falg=colourServiceImpl.addColour(colour);
		String colourJson = JSON.toJSONString(falg);
		return colourJson;
	}
	
	/**
	 * 	查询颜色
	 */
	@RequestMapping(value="/List",produces="application/json;charset=utf-8")
	@ResponseBody
	public String List(Colour colour) {
		//调用添加
		List<Colour> colourList = colourServiceImpl.queryColour();
//		System.out.println(colourList.size());
		String colourJson = JSON.toJSONString(colourList);
		return colourJson;
	}
}
