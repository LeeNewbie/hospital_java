package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
/**
 * 标签  hos_hlabel
 * @author bobo
 *
 */
@Data
public class Hlabel implements Serializable {
 	private String id;
 	private String name;
 	private String pid;
 	//非数据字段
 	private String pname;
}