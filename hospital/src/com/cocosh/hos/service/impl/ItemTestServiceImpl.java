﻿package com.cocosh.hos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cocosh.framework.annotation.LogClass;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.ItemTestMapper;
import com.cocosh.hos.model.ItemTest;
import com.cocosh.hos.service.ItemTestService;

@Transactional
@Service
public class ItemTestServiceImpl implements ItemTestService {
	@Autowired
	private ItemTestMapper mapper;

	@LogClass(module = "参数测试管理", method = "添加")
	@Override
	public boolean add(ItemTest po) {
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "参数测试管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "参数测试管理", method = "修改")
	@Override
	public boolean update(ItemTest po) {
		return mapper.update(po) > 0;
	}

	@Override
	public ItemTest queryByItemId(String item_id) {
		return mapper.queryByItemId(item_id);
	}
	
}
