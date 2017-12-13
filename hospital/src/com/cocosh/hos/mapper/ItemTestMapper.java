package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemTest;

public interface ItemTestMapper {
	Integer add(ItemTest po);
	Integer del(String[] ids);
	Integer update(ItemTest po);
	ItemTest queryByItemId(String item_id);
}
