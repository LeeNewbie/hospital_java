package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class OrderHistest implements Serializable {
 	private String id;
 	private String order_id;
 	private Integer type;
 	private String fazhi;
 	private String fazhi_width;
 	private String nofazhi;
 	private String nofazhi_width;
 	private String hv_interval;
 	private String hpb_width;
 	private String is_damage;
}