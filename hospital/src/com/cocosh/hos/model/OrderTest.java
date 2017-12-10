package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
/**
 * 术中测试  hos_order_test
 * @author bobo
 *
 */
@Data
public class OrderTest implements Serializable {
 	private String id;
 	private String order_id;
 	private String hreat_fazhi;
 	private String hreat_width;
 	private String hreat_feel;
 	private String hreat_forbid;
 	private Integer hreat_isfeel;
 	private String hreat_active;
 	private String right_fazhi;
 	private String right_width;
 	private String right_feel;
 	private String right_forbid;
 	private Integer right_isfeel;
 	private String right_active;
 	private String right_high;
 	private String left_fazhi;
 	private String left_width;
 	private String left_feel;
 	private String left_forbid;
 	private Integer left_isfeel;
 	private String left_active;
 	
}