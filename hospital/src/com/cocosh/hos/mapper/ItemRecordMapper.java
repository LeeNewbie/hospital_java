package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemRecord;

public interface ItemRecordMapper {
	Integer add(ItemRecord po);
	Integer del(String[] ids);
	Integer update(ItemRecord po);
	ItemRecord queryByItemId(String item_id);
}
