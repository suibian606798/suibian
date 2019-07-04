package com.bdqn.mapper;
/**
 * 库存表dao层
 * @author dell
 *
 */
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.po.Inventory;


public interface InventoryMapper {
	//查询库存表
	public List<Inventory> queryInventory(@Param("inventory")Inventory inventory);
	//添加库存表
	public int addInventory(@Param("inventory")Inventory inventory);
	//根据id查询商品
	public Inventory queryInventoryByid(@Param("inventory")Inventory inventory);
	//修改商品
	public int updateInventoryByid(@Param("inventory")Inventory inventory);
	//删除商品
	public int delInventoryByid(@Param("inventory")Inventory inventory);
	//验证商品是否存在库存表
	public Inventory queryInventoryByExists(@Param("inventory")Inventory inventory);
	//实现修改库存
	public int updateInventoryCountByid(@Param("inventory")Inventory inventory);
	//查询当前库存
	public int queryInventoryCountByid();
}
