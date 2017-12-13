package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemTest;

public interface ItemTestService {
	boolean add(ItemTest po);
	boolean del(String ids);
	boolean update(ItemTest po);
	ItemTest queryByItemId(String id);
}
