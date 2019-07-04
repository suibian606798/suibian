package com.bdqn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.mapper.InventoryMapper;
import com.bdqn.po.Inventory;
import com.bdqn.service.inventoryService;

/**
 * 库存表service层实现类
 * @author dell
 *
 */
@Transactional
@Service("inventoryService")
public class inventoryServiceImpl implements inventoryService{
	@Resource
	InventoryMapper inventoryMapper;

	//实现查询库存表
	public List<Inventory> queryInventory(Inventory inventory) {
		return inventoryMapper.queryInventory(inventory);
	}

	//实现添加库存表
	public int addInventory(Inventory inventory) {
		return inventoryMapper.addInventory(inventory);
	}

	//实现根据id查询
	public Inventory queryInventoryByid(Inventory inventory) {
		return inventoryMapper.queryInventoryByid(inventory);
	}

	//实现修改
	public int updateInventoryByid(Inventory inventory) {
		return inventoryMapper.updateInventoryByid(inventory);
	}

	//删除商品
	public int delInventoryByid(Inventory inventory) {
		return inventoryMapper.delInventoryByid(inventory);
	}

	//实现验证商品是否存在
	public Inventory queryInventoryByExists(Inventory inventory) {
		return inventoryMapper.queryInventoryByExists(inventory);
	}

	//实现修改库存
	public int updateInventoryCountByid(Inventory inventory) {
		return inventoryMapper.updateInventoryCountByid(inventory);
	}

	//实现查询当前库存
	public int queryInventoryCountByid() {
		return inventoryMapper.queryInventoryCountByid();
	}
}
