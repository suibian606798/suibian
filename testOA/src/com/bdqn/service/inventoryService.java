package com.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.po.Inventory;

/**
 * 库存表service层
 * @author dell
 *
 */
public interface inventoryService {
	//查询库存表
	public List<Inventory> queryInventory(Inventory inventory);
	//添加库存表
	public int addInventory(Inventory inventory);
	//根据id查询商品
	public Inventory queryInventoryByid(Inventory inventory);
	//修改商品
	public int updateInventoryByid(Inventory inventory);
	//删除商品
	public int delInventoryByid(Inventory inventory);
	//验证商品是否存在
	public Inventory queryInventoryByExists(Inventory inventory);
	//实现修改库存
	public int updateInventoryCountByid(Inventory inventory);
	//查询当前库存
	public int queryInventoryCountByid();
}
