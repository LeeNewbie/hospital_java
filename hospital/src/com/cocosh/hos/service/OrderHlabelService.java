package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.OrderHlabel;

public interface OrderHlabelService {
	boolean add(OrderHlabel po);
	boolean del(String ids);
}
