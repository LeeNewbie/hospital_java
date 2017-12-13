package com.cocosh.hos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cocosh.framework.annotation.LogClass;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.ItemDiagnoseMapper;
import com.cocosh.hos.model.ItemDiagnose;
import com.cocosh.hos.service.ItemDiagnoseService;

@Transactional
@Service
public class ItemDiagnoseServiceImpl implements ItemDiagnoseService {
	@Autowired
	private ItemDiagnoseMapper mapper;

	@LogClass(module = "诊断图表管理", method = "添加")
	@Override
	public boolean add(ItemDiagnose po) {
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "诊断图表管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "诊断图表管理", method = "修改")
	@Override
	public boolean update(ItemDiagnose po) {
		return mapper.update(po) > 0;
	}


	@Override
	public ItemDiagnose queryByItemId(String item_id) {
		return mapper.queryByItemId(item_id);
	}
	
}
