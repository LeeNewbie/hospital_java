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
import com.cocosh.hos.mapper.HlabelMapper;
import com.cocosh.hos.model.Hlabel;
import com.cocosh.hos.service.HlabelService;

@Transactional
@Service
public class HlabelServiceImpl implements HlabelService {
	@Autowired
	private HlabelMapper mapper;

	@LogClass(module = "标签管理", method = "添加")
	@Override
	public boolean add(Hlabel po) {
		po.setId(StringUtil.getUuid());
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "标签管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "标签管理", method = "修改")
	@Override
	public boolean update(Hlabel po) {
		return mapper.update(po) > 0;
	}

	@Override
	public Page<Hlabel> queryPage(BaseConditionVO vo) {
		PaginationInterceptor.startPage(vo.getPageNo(),vo.getPageSize());
		mapper.queryPage(vo);
		Page<Hlabel> page=PaginationInterceptor.endPage();
		return page;
	}

	@Override
	public Hlabel queryById(String id) {
		return mapper.queryById(id);
	}

	@Override
	public List<Hlabel> queryByPid(String pid) {
		return mapper.queryByPid(pid);
	}

	@Override
	public Hlabel queryByPidAndName(String pid, String name) {
		Hlabel po=new Hlabel();
		po.setPid(pid);
		po.setName(name);
		return mapper.queryByPidAndName(po);
	}
	
}
