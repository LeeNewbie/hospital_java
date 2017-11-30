package com.cocosh.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cocosh.framework.annotation.LogClass;

import com.cocosh.framework.util.StringUtil;
import com.cocosh.sys.mapper.DictMapper;
import com.cocosh.sys.model.Dict;
import com.cocosh.sys.service.DictService;

@Transactional
@Service
public class DictServiceImpl implements DictService {
	@Autowired
	private DictMapper mapper;

	@LogClass(module = "数据字典管理", method = "添加")
	@Override
	public boolean add(Dict po) {
		po.setId(StringUtil.getUuid());
		return mapper.add(po) > 0;
	}
	
    @LogClass(module = "数据字典管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "数据字典管理", method = "修改")
	@Override
	public boolean update(Dict po) {
		return mapper.update(po)>0;
	}

	@Override
	public String queryByCode(String code) {
		return mapper.queryByCode(code);
	}

	@Override
	public List<Dict> queryAll() {
		return mapper.queryAll();
	}

	@Override
	public List<Dict> queryCAll(String code) {
		return mapper.queryCAll(code);
	}

	@Override
	public Double deposit2F(String firm_id) {
		double df=mapper.queryD2F(firm_id);
		double tf=0.00;
		double cf=0.00;
		int tfNum=mapper.queryT2F(firm_id);
		if (tfNum>0) {
			tf=tfNum*Double.parseDouble(mapper.queryByCode("TIMERENT_DEPOSIT"));
		}
		int cfNum=mapper.queryC2F(firm_id);
		if (cfNum>0) {
			cf=cfNum*Double.parseDouble(mapper.queryByCode("CHARGERENT_DEPOSIT"));
		}
		return df+tf+cf;
	}

	@Override
	public Double deposit2M(String mem_id) {
		double dm=mapper.queryD2M(mem_id);
		double tm=0.00;
		double cm=0.00;
		int tmNum=mapper.queryT2M(mem_id);
		if (tmNum>0) {
			tm=tmNum*Double.parseDouble(mapper.queryByCode("TIMERENT_DEPOSIT"));
		}
		int cmNum=mapper.queryC2M(mem_id);
		if (cmNum>0) {
			cm=cmNum*Double.parseDouble(mapper.queryByCode("CHARGERENT_DEPOSIT"));
		}
		return dm+tm+cm;
	}
	
}
