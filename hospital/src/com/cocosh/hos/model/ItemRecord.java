package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class ItemRecord implements Serializable {
 	private String id;
 	private String item_id;
 	private String content;
 	private String method;
 	private String result;
}