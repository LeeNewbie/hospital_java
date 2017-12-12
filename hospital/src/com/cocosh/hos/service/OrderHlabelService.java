package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.hos.model.OrderHlabel;

public interface OrderHlabelService {
	boolean add(OrderHlabel po);
	boolean del(String ids);
	List<OrderHlabel> queryByOrderId(String order_id);
}
