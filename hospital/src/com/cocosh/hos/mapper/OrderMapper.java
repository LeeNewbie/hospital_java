package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.Order;

public interface OrderMapper {
	Integer add(Order po);
	Integer del(String[] ids);
	Integer update(Order po);
	List<Order> queryPage(BaseConditionVO vo);
	Order queryById(String id);
	Order queryByMachine_sn(String machine_sn);
	Order queryBySn(String sn);
}
