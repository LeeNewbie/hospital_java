package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class ItemIcd implements Serializable {
 	private String item_id;
 	private String vt1_name;
 	private Integer vt1_ison;
 	private String vt1_rate;
 	private String vt1_period;
 	private String vt1_identify;
 	private String vt1_scheme;
 	private String vt2_name;
 	private Integer vt2_ison;
 	private String vt2_rate;
 	private String vt2_period;
 	private String vt2_identify;
 	private String vt2_scheme;
 	private String vf_name;
 	private Integer vf_ison;
 	private String vf_rate;
 	private String vf_period;
 	private String vf_identify;
 	private String vf_scheme;
 	private Integer crt_ischange;
 	private String crt_left;
 	private String crt_sav;
 	private String crt_period;
 	private String crt_width;
 	
}