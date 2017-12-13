package com.cocosh.hos.model;


import java.io.Serializable;

import lombok.Data;
@Data
public class ItemBrady implements Serializable {
 	private String item_id;
 	private String work_mode;
 	private String basic_rate;
 	private String up_rate;
 	private String rest_rate;
 	private String late_rate;
 	private String qibo_av;
 	private String feel_av;
 	private String av_period;
 	private String hreat_out;
 	private String hreat_width;
 	private Integer hreat_yuzhi;
 	private String hreat_sensive;
 	private Integer hreat_feel;
 	private Integer hreat_forbid;
 	private String right_out;
 	private String right_width;
 	private Integer right_yuzhi;
 	private String right_sensive;
 	private Integer right_feel;
 	private Integer right_forbid;
 	private String left_out;
 	private String left_width;
 	private Integer left_yuzhi;
 	private String left_sensive;
 	private Integer left_feel;
 	private Integer left_forbid;
}