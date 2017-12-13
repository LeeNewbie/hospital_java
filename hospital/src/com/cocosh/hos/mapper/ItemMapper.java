package com.cocosh.hos.mapper;

import java.util.List;
import java.util.Map;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.Item;

public interface ItemMapper {
	Integer add(Item po);
	Integer del(String[] ids);
	Integer update(Item po);
	List<Map<String ,Object>> queryPage(BaseConditionVO vo);
	Item queryById(String id);
}
