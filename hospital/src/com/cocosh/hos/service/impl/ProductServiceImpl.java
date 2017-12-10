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
import com.cocosh.hos.mapper.ProductMapper;
import com.cocosh.hos.model.Product;
import com.cocosh.hos.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

	@LogClass(module = "产品管理", method = "添加")
	@Override
	public boolean add(Product po) {
		po.setId(StringUtil.getUuid());
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "产品管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "产品管理", method = "修改")
	@Override
	public boolean update(Product po) {
		return mapper.update(po) > 0;
	}

	@Override
	public Page<Product> queryPage(BaseConditionVO vo) {
		PaginationInterceptor.startPage(vo.getPageNo(),vo.getPageSize());
		mapper.queryPage(vo);
		Page<Product> page=PaginationInterceptor.endPage();
		return page;
	}

	@Override
	public Product queryById(String id) {
		return mapper.queryById(id);
	}

	@Override
	public List<Product> query(Product po) {
		return mapper.query(po);
	}

	@Override
	public List<Product> queryGroupName() {
		return mapper.queryGroupName();
	}

	@Override
	public List<Product> queryByName(String name) {
		Product p=new Product();
		p.setName(name);
		return mapper.query(p);
	}
	
}
