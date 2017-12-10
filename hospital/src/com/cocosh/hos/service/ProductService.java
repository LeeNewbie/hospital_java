package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.Product;

public interface ProductService {
	boolean add(Product po);
	boolean del(String ids);
	boolean update(Product po);
	Page<Product> queryPage(BaseConditionVO vo);
	Product queryById(String id);
	List<Product> query(Product po);
	List<Product> queryGroupName();
	List<Product> queryByName(String name);
}
