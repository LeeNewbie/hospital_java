package com.cocosh.hos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocosh.framework.annotation.LogClass;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.OrderHistestMapper;
import com.cocosh.hos.mapper.OrderHlabelMapper;
import com.cocosh.hos.mapper.OrderMapper;
import com.cocosh.hos.mapper.OrderTestMapper;
import com.cocosh.hos.model.Order;
import com.cocosh.hos.model.OrderHistest;
import com.cocosh.hos.model.OrderHlabel;
import com.cocosh.hos.model.OrderTest;
import com.cocosh.hos.service.OrderService;

@Transactional
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper mapper;
	@Autowired
	private OrderTestMapper testMapper;
	@Autowired
	private OrderHistestMapper histestMapper;
	@Autowired
	private OrderHlabelMapper orderlabelMapper;

	@LogClass(module = "基线表单管理", method = "添加")
	@Override
	public boolean add(Order po) {
		po.setId(StringUtil.getUuid());
		boolean flag= mapper.add(po) > 0;
		if(flag){
			OrderTest test=po.getOrdertest();//术中测试
			if(test!=null){
				test.setOrder_id(po.getId());
				test.setId(StringUtil.getUuid());
				testMapper.add(test);
			}
			List<OrderHistest> histests=po.getHistests();//his测试
			if(histests.size()>0){
				for(OrderHistest histest:histests){
					histest.setId(StringUtil.getUuid());
					histest.setOrder_id(po.getId());
					histestMapper.add(histest);
				}
			}
			List<OrderHlabel> orderhlabels=po.getOrderhlabels();
			if(orderhlabels.size()>0){
				for(OrderHlabel ohlabel:orderhlabels){
					ohlabel.setOrder_id(po.getId());
					orderlabelMapper.add(ohlabel);
				}
			}
		}
		return flag;
	}
	
    @LogClass(module = "基线表单管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "基线表单管理", method = "修改")
	@Override
	public boolean update(Order po) {
		boolean flag= mapper.update(po) > 0;
		if(flag){
			testMapper.update(po.getOrdertest());
			histestMapper.delByOrderId(po.getId());//删除his测试
			List<OrderHistest> histests=po.getHistests();//添加his测试
			if(histests.size()>0){
				for(OrderHistest histest:histests){
					histest.setId(StringUtil.getUuid());
					histest.setOrder_id(po.getId());
					histestMapper.add(histest);
				}
			}
			orderlabelMapper.delByOrderId(po.getId());//删除orderlabel
			List<OrderHlabel> orderhlabels=po.getOrderhlabels();
			if(orderhlabels.size()>0){
				for(OrderHlabel ohlabel:orderhlabels){
					ohlabel.setOrder_id(po.getId());
					orderlabelMapper.add(ohlabel);
				}
			}
			
		}
		return flag;
	}

	@Override
	public Page<Order> queryPage(BaseConditionVO vo) {
		PaginationInterceptor.startPage(vo.getPageNo(),vo.getPageSize());
		mapper.queryPage(vo);
		Page<Order> page=PaginationInterceptor.endPage();
		return page;
	}

	@Override
	public Order queryById(String id) {
		return mapper.queryById(id);
	}
	
}
