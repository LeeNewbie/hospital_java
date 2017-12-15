package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.hos.model.ItemDrug;

public interface ItemDrugService {
	boolean add(ItemDrug po);
	boolean del(String ids);
	boolean update(ItemDrug po);
	List<ItemDrug> queryByItemId(String id);
}
