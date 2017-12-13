package com.cocosh.hos.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
@Data
public class ItemDrug implements Serializable {
 	private String id;
 	private String item_id;
 	private String name;
 	private String num;
 	private Integer unit;
 	private Integer usage;
 	private Integer rate;
 	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 	private Date start_date;
 	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 	private Date end_date;
}