package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemBrady;

public interface ItemBradyService {
	boolean add(ItemBrady po);
	boolean del(String ids);
	boolean update(ItemBrady po);
	ItemBrady queryByItemId(String item_id);
}
