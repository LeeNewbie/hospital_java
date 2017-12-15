package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.hos.model.ItemRecord;

public interface ItemRecordService {
	boolean add(ItemRecord po);
	boolean del(String ids);
	boolean update(ItemRecord po);
	List<ItemRecord> queryByItemId(String id);
}
