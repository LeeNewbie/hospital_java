package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.ItemDrug;

public interface ItemDrugMapper {
	Integer add(ItemDrug po);
	Integer del(String[] ids);
	Integer delByItemId(String item_id);
	Integer update(ItemDrug po);
	List<ItemDrug> queryByItemId(String item_id);
}
