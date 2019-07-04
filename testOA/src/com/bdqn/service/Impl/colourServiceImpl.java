package com.bdqn.service.Impl;
/**
 * 颜色接口实现类
 */
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.mapper.ColourMapper;
import com.bdqn.mapper.InventoryMapper;
import com.bdqn.po.Colour;
import com.bdqn.service.colourService;

@Transactional
@Service("colourService")
public class colourServiceImpl implements colourService{
	@Resource
	ColourMapper colourMapper;
	
	//实现查询颜色类
	public List<Colour> queryColour() {
		return colourMapper.queryColour();
	}
	
	//实现添加颜色
	public int addColour(Colour colour) {
		return colourMapper.addColour(colour);
	}
}
