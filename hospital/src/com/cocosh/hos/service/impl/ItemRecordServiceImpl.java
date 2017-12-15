package com.cocosh.hos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocosh.framework.annotation.LogClass;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.ItemRecordMapper;
import com.cocosh.hos.model.ItemRecord;
import com.cocosh.hos.service.ItemRecordService;

@Transactional
@Service
public class ItemRecordServiceImpl implements ItemRecordService {
	@Autowired
	private ItemRecordMapper mapper;

	@LogClass(module = "事件记录管理", method = "添加")
	@Override
	public boolean add(ItemRecord po) {
		po.setId(StringUtil.getUuid());
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "事件记录管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "事件记录管理", method = "修改")
	@Override
	public boolean update(ItemRecord po) {
		return mapper.update(po) > 0;
	}


	@Override
	public List<ItemRecord> queryByItemId(String item_id) {
		return mapper.queryByItemId(item_id);
	}
	
}
