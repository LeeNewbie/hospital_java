package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.OrderTest;

public interface OrderTestService {
	boolean add(OrderTest po);
	boolean del(String ids);
	boolean update(OrderTest po);
	Page<OrderTest> queryPage(BaseConditionVO vo);
	OrderTest queryById(String id);
	OrderTest queryByOrderId(String order_id);
}
