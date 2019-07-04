package com.bdqn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdqn.po.Colour;

public interface ColourMapper {
	//查询颜色表
	public List<Colour> queryColour();
	//添加颜色
	public int addColour(@Param("colour")Colour colour);
}
