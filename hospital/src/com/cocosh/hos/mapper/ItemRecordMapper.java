package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemRecord;

public interface ItemRecordMapper {
	Integer add(ItemRecord po);
	Integer del(String[] ids);
	Integer delByItemId(String item_id);
	Integer update(ItemRecord po);
	List<ItemRecord> queryByItemId(String item_id);
}
