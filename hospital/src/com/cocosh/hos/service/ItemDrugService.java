package com.cocosh.hos.service;
 
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.ItemDrug;

public interface ItemDrugService {
	boolean add(ItemDrug po);
	boolean del(String ids);
	boolean update(ItemDrug po);
	ItemDrug queryByItemId(String id);
}
