package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemIcd;

public interface ItemIcdService {
	boolean add(ItemIcd po);
	boolean del(String ids);
	boolean update(ItemIcd po);
	ItemIcd queryByItemId(String item_id);
}
