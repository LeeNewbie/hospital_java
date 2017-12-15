package com.cocosh.hos.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

import com.alibaba.fastjson.annotation.JSONField;
import com.cocosh.framework.base.BaseEntity;
@Data
public class Item extends BaseEntity{
 	private String order_id;
 	@JSONField(format = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
 	private Date visit_date;
 	@JSONField(format = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
 	private Date next_date;
 	private String situation;
 	private String situation_img;
 	private Integer hreat_chao;
 	private String hreat_img;
 	private Integer rabat;
 	private String rabat_img;
 	private Integer elect;
 	private String elect_img;
 	private Integer blood;
 	private String blood_img;
 	private Integer have_other;
 	private String other;
 	private String other_img;
 	private Integer magnet;
 	private String magnet_img;
 	private String check_location;
 	private Integer check_unit;
 	private String mri_mode;
 	private String mri_house;
 	private String mri_room;
 	private String mri_rate;
 	private String mri_width_house;
 	private String mri_width_room;
 	private String mri_period;
 	private String mri_set_house;
 	private String mri_set_room;
 	private Integer is_moresix;
 	private Integer is_hard;
 	private Integer is_check;
 	private String sar;
 	private String before_house_yuzhi;
 	private String before_house_feel;
 	private String before_house_forbid;
 	private String before_room_yuzhi;
 	private String before_room_feel;
 	private String before_room_forbid;
 	private String after_house_yuzhi;
 	private String after_house_feel;
 	private String after_house_forbid;
 	private String after_room_yuzhi;
 	private String after_room_feel;
 	private String after_room_forbid;
 	private String remark;
 	private String ajust_remark;
 	//非数据字段
 	private ItemBrady brady;
 	private ItemIcd icd;
 	private ItemDiagnose diagnose;
 	private ItemTest test;
 	private List<OrderHistest> histests;
 	private List<OrderHlabel> orderhlabels; 
 	private List<ItemRecord> records;
 	private List<ItemDrug> drugs;
}