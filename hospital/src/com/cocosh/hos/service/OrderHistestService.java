package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.OrderHistest;

public interface OrderHistestService {
	boolean add(OrderHistest po);
	boolean del(String ids);
	boolean update(OrderHistest po);
	Page<OrderHistest> queryPage(BaseConditionVO vo);
	OrderHistest queryById(String id);
	List<OrderHistest> queryByOrderId(String order_id);
}
