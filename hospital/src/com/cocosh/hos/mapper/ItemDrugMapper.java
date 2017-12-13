package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemDrug;

public interface ItemDrugMapper {
	Integer add(ItemDrug po);
	Integer del(String[] ids);
	Integer update(ItemDrug po);
	ItemDrug queryByItemId(String item_id);
}
