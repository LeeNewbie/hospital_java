package com.cocosh.hos.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cocosh.framework.annotation.LogClass;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.OrderHlabelMapper;
import com.cocosh.hos.model.OrderHlabel;
import com.cocosh.hos.service.OrderHlabelService;

@Transactional
@Service
public class OrderHlabelServiceImpl implements OrderHlabelService {
	@Autowired
	private OrderHlabelMapper mapper;

	@Override
	public boolean add(OrderHlabel po) {
		return mapper.add(po) > 0;
	}
	
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}
}
