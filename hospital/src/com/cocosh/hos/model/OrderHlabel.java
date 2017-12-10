package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
/**
 * 订单标签
 * @author bobo
 *
 */
@Data
public class OrderHlabel implements Serializable {
 	private String order_id;
 	private String hlabel_pid;
 	private String hlable_id;
}