package com.cocosh.hos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.HlabelMapper;
import com.cocosh.hos.mapper.OrderHlabelMapper;
import com.cocosh.hos.model.OrderHlabel;
import com.cocosh.hos.service.OrderHlabelService;

@Transactional
@Service
public class OrderHlabelServiceImpl implements OrderHlabelService {
	@Autowired
	private OrderHlabelMapper mapper;
	@Autowired
	private HlabelMapper  hlabelMapper;

	@Override
	public boolean add(OrderHlabel po) {
		return mapper.add(po) > 0;
	}
	
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@Override
	public List<OrderHlabel> queryByOrderId(String order_id) {
		List<OrderHlabel> list=mapper.queryByOrderId(order_id);
		for(OrderHlabel oh:list){
			if(!StringUtil.isEmpty(oh.getHlabel_id())){
				oh.setHlabes(hlabelMapper.queryByPid(oh.getHlabel_pid()));
			}
		}
		return list;
	}
}
