package com.bdqn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.bdqn.po.Colour;
import com.bdqn.po.Inventory;
import com.bdqn.service.colourService;
import com.bdqn.service.inventoryService;
/**
 * 库存表控制层
 * @author dell
 *
 */
@Controller
@RequestMapping("/inventory")
public class inventoryController {
	//创建service对象
	@Resource(name="inventoryService")
	inventoryService inventoryServiceImpl;
	@Resource(name="colourService")
	colourService colourServiceImpl;

	/**
	 * 	跳转添加页面
	 */
	@RequestMapping("goAdd")
	public String goAdd(Model mod) {
		return "inventory-add";
	}

	/**
	 *	 跳转修改页面
	 */
	@RequestMapping("goUpdate")
	public String goUpdate(Inventory inventory,Model mod) {
		List<Colour> colourList = colourServiceImpl.queryColour();
		inventory=inventoryServiceImpl.queryInventoryByid(inventory);
		mod.addAttribute("inventory",inventory);
		mod.addAttribute("colourList",colourList);
		return "inventory-update";
	}

	/**
	 * 	查询库存表
	 */
	@RequestMapping(value="/doList",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doList(Inventory inventory,Model mod) {
		//调用查询方法
		List<Inventory> inventoryList=inventoryServiceImpl.queryInventory(inventory);
		String inventoryJson = JSON.toJSONString(inventoryList);
		return inventoryJson;
	}

	/**
	 * 	添加库存
	 */
	@RequestMapping(value="/doAdd",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doAdd(Inventory inventory) {
		Inventory inventoryByExists = inventoryServiceImpl.queryInventoryByExists(inventory);
		String inventoryJson=null;
		if(inventoryByExists==null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			Date now=new Date();
			inventory.setTory_date(now);
			//调用添加
			int falg=inventoryServiceImpl.addInventory(inventory);
			inventoryJson = JSON.toJSONString(falg);
		}else {
			int Tory_count=inventory.getTory_count();
			inventoryByExists.setTory_count(inventoryByExists.getTory_count()+Tory_count);
			inventoryJson="-1";
			//调用修改库存数
			inventoryServiceImpl.updateInventoryCountByid(inventoryByExists);
		}
		return inventoryJson;
	}

	/**
	 * 	修改库存信息
	 */
	@RequestMapping(value="/doUpdate",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doUpdate(Inventory inventory) {
		//调用修改
		int falg=inventoryServiceImpl.updateInventoryByid(inventory);
		String inventoryJson = JSON.toJSONString(falg);
		return inventoryJson;
	}

	/**
	 * 	删除库存
	 */
	@RequestMapping(value="/doDel",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doDel(Inventory inventory) {
		//调用删除
		int falg=inventoryServiceImpl.delInventoryByid(inventory);
		String inventoryJson = JSON.toJSONString(falg);
		return inventoryJson;
	}
	
	/**
	 * 	查询当前全部库存
	 */
	@RequestMapping(value="/doQueryCount",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doQueryCount(Model mod) {
		//调用查询库存
		int inventoryCount=inventoryServiceImpl.queryInventoryCountByid();
		String inventoryJson = JSON.toJSONString(inventoryCount);
		return inventoryJson;
	}
	
	/**
	 * 	修改库存数量
	 */
	@RequestMapping(value="/doUpdataCount",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doUpdataCount(Inventory inventory) {
		Inventory inventoryByid=inventoryServiceImpl.queryInventoryByid(inventory);
		int count=inventoryByid.getTory_count();
		inventory.setTory_count(count+inventory.getTory_count());
		//调用修改库存
		int falg=inventoryServiceImpl.updateInventoryCountByid(inventory);
		String inventoryJson = JSON.toJSONString(falg);
		return inventoryJson;
	}
}
