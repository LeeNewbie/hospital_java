package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.OrderHlabel;

public interface OrderHlabelMapper {
	Integer add(OrderHlabel po);
	Integer del(String[] ids);
	Integer delByOrderId(String order_id);
	Integer update(OrderHlabel po);
	List<OrderHistestMapper> queryByOrderId(String order_id);
}
