package com.bdqn.service;

import java.util.List;


import com.bdqn.po.Colour;

public interface colourService {
	//查询颜色表
	public List<Colour> queryColour();
	//添加颜色
	public int addColour(Colour colour);
}
