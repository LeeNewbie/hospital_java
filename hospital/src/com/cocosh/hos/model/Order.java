package com.cocosh.hos.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.cocosh.framework.base.BaseEntity;
/**
 * 基线表单  hos_order
 * @author bobo
 *
 */
@Data
public class Order extends BaseEntity {
 	private String sn;
 	private String name;
 	private String mobile;
 	private Integer gender;
 	private String age;
 	private String address;
 	private String diagnose;
 	private String diagnose_other;
 	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 	private Date plant_date;
 	private String operation_time;
 	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 	private Date first_date;
 	private Integer is_change;
 	private String operation_type;
 	private String hreat_rate;
 	private String agroup;
 	private String daoroom;
 	private String sanwei;
 	private String duodao;
 	private String operater;
 	private String complication;
 	private Integer have_other;
 	private String remark;
 	private String hbp_location;
 	private String qrs_width;
 	private Integer lbbb;
 	private String hbp1;
 	private String hbp2;
 	private String hbp3;
 	private String product_id;
 	private Integer psingle;//1单腔，2双腔，3三腔
 	private Integer brady;//
 	private Integer compatible;//兼容MRI
 	private String machine_sn;//机器序列号
 	private String hreart_type;
 	private String hreat_sn;
 	private Integer hreat_location;
 	private String left_type;
 	private String left_sn;
 	private Integer left_location;
 	private String right_type;
 	private String right_sn;
 	private Integer right_location;
 	//非数据库字段
 	private OrderTest ordertest;
 	private List<OrderHistest> histests;
 	private List<OrderHlabel> orderhlabels;
 	private String product_name;
 	private String product_number;
 	
}