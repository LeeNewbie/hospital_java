package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemRecord;

public interface ItemRecordService {
	boolean add(ItemRecord po);
	boolean del(String ids);
	boolean update(ItemRecord po);
	ItemRecord queryByItemId(String id);
}
