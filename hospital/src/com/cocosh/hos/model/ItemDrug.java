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
 	private Integer use_usage;
 	private Integer rate;
 	@JSONField(format = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
 	private Date start_date;
 	@JSONField(format = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
 	private Date end_date;
}