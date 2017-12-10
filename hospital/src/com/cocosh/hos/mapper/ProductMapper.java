package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.Product;

public interface ProductMapper {
	Integer add(Product po);
	Integer del(String[] ids);
	Integer update(Product po);
	List<Product> queryPage(BaseConditionVO vo);
	Product queryById(String id);
	List<Product> query(Product po);
	List<Product> queryGroupName();
}
