package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.OrderHistest;

public interface OrderHistestMapper {
	Integer add(OrderHistest po);
	Integer del(String[] ids);
	Integer delByOrderId(String order_id);
	Integer update(OrderHistest po);
	List<OrderHistest> queryPage(BaseConditionVO vo);
	OrderHistest queryById(String id);
	List<OrderHistest> queryByOrderId(String order_id);
}
