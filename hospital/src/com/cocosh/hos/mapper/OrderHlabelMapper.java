package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.hos.model.OrderHlabel;

public interface OrderHlabelMapper {
	Integer add(OrderHlabel po);
	Integer del(String[] ids);
	Integer delByOrderId(String order_id);
	Integer update(OrderHlabel po);
	List<OrderHlabel> queryByOrderId(String order_id);
}
