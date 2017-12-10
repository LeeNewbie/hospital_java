package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.OrderTest;

public interface OrderTestMapper {
	Integer add(OrderTest po);
	Integer del(String[] ids);
	Integer update(OrderTest po);
	List<OrderTest> queryPage(BaseConditionVO vo);
	OrderTest queryById(String id);
	OrderTest queryByOrderId(String order_id);
}
