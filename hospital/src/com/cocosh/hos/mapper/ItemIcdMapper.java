package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemIcd;

public interface ItemIcdMapper {
	Integer add(ItemIcd po);
	Integer del(String[] ids);
	Integer update(ItemIcd po);
	ItemIcd queryByItemId(String item_id);
}
