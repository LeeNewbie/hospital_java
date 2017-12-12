package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class OrderHistest implements Serializable {
 	private String id;
 	private String order_id;//有可能是item_id//通用
 	private Integer type;
 	private String yuzhi;
 	private String yuzhi_width;
 	private String noyuzhi;
 	private String hv_interval;
 	private String hpb_width;
 	private Integer is_damage;
}