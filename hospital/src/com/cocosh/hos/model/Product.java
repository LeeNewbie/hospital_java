package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
/**
 * 产品
 * @author bobo
 *
 */
@Data
public class Product implements Serializable {
 	private String id;
 	private String name;
 	private String number;
}