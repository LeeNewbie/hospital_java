package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemDiagnose;

public interface ItemDiagnoseMapper {
	Integer add(ItemDiagnose po);
	Integer del(String[] ids);
	Integer update(ItemDiagnose po);
	ItemDiagnose queryByItemId(String item_id);
}
