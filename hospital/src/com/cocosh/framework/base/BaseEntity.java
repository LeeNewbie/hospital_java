package com.cocosh.framework.base;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;

/**
 * 基类
 * 
 * @author jerry
 */
@Data
public class BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;// 主键
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date create_date;// 创建时间
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date modify_date;// 修改时间
	private Integer del;// 删除标记 0：正常 1：无效

}
