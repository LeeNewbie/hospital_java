package com.cocosh.sys.mapper;

import java.util.List;

import com.cocosh.sys.model.Dict;

public interface DictMapper {
	Integer add(Dict po);
	Integer del(String[] ids);
	Integer update(Dict po);
	List<Dict> queryAll();
	List<Dict> queryCAll(String code);
	String queryByCode(String code);
	
	//企业 日租、时租、充电 保证金验证相关的Sql
	Double queryD2F(String firm_id);
	Integer queryT2F(String firm_id);
	Integer queryC2F(String firm_id);
	//个人 日租、时租、充电 保证金验证相关的Sql
	Double queryD2M(String mem_id);
	Integer queryT2M(String mem_id);
	Integer queryC2M(String mem_id);
}
