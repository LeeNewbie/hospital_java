package com.cocosh.hos.service;
 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cocosh.framework.base.AjaxResult;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.Item;

public interface ItemService {
	boolean add(Item po);
	boolean del(String ids);
	boolean update(Item po);
	Page<Map<String,Object>> queryPage(BaseConditionVO vo);
	Item queryById(String id);
	AjaxResult itemImport(String suffix,HttpServletRequest req);
}
