package com.bdqn.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 库存表实体类
 * @author 孙兴康
 *
 */
public class Inventory {
	private Integer tory_no;
	private String tory_name;
	private String tory_size;
	private double tory_price;
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date tory_date;
	private Integer tory_count;
	private String tory_remark;
	//封装颜色实体类
	private Colour colour;

	/*
	 * get set
	 */
	public Integer getTory_no() {
		return tory_no;
	}
	public void setTory_no(Integer tory_no) {
		this.tory_no = tory_no;
	}
	public String getTory_name() {
		return tory_name;
	}
	public void setTory_name(String tory_name) {
		this.tory_name = tory_name;
	}
	public String getTory_size() {
		return tory_size;
	}
	public void setTory_size(String tory_size) {
		this.tory_size = tory_size;
	}
	public double getTory_price() {
		return tory_price;
	}
	public void setTory_price(double tory_price) {
		this.tory_price = tory_price;
	}
	public Date getTory_date() {
		return tory_date;
	}
	public void setTory_date(Date tory_date) {
		this.tory_date = tory_date;
	}
	public Integer getTory_count() {
		return tory_count;
	}
	public void setTory_count(Integer tory_count) {
		this.tory_count = tory_count;
	}
	public String getTory_remark() {
		return tory_remark;
	}
	public void setTory_remark(String tory_remark) {
		this.tory_remark = tory_remark;
	}
	public Colour getColour() {
		return colour;
	}
	public void setColour(Colour colour) {
		this.colour = colour;
	}
}
