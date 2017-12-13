package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemDiagnose;

public interface ItemDiagnoseService {
	boolean add(ItemDiagnose po);
	boolean del(String ids);
	boolean update(ItemDiagnose po);
	ItemDiagnose queryByItemId(String item_id);
}
