package com.cocosh.hos.model;


import java.io.Serializable;
import java.util.List;

import lombok.Data;
/**
 * 订单标签
 * @author bobo
 *
 */
@Data
public class OrderHlabel implements Serializable {
 	private String order_id;//有可能是item_id//通用
 	private String hlabel_pid;
 	private String hlabel_id;
 	//非数据库字段
 	private List<Hlabel> hlabes;
}