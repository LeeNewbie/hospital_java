package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.Order;

public interface OrderService {
	boolean add(Order po);
	boolean del(String ids);
	boolean update(Order po);
	Page<Order> queryPage(BaseConditionVO vo);
	Order queryById(String id);
}
