package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemBrady;

public interface ItemBradyMapper {
	Integer add(ItemBrady po);
	Integer del(String[] ids);
	Integer update(ItemBrady po);
	ItemBrady queryByItemId(String item_id);
}
