package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class ItemDiagnose implements Serializable {
 	private String item_id;
 	private String ap;
 	private String vp;
 	private String bp;
 	private String asvp;
 	private String asvs;
 	private String apvp;
 	private String apvs;
 	private String pvc;
 	private String ams;
 	private String exchange;
 	private String ataf;
 	private String vsr;
}