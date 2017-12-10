package com.cocosh.hos.mapper;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.hos.model.Hlabel;

public interface HlabelMapper {
	Integer add(Hlabel po);
	Integer del(String[] ids);
	Integer update(Hlabel po);
	List<Hlabel> queryPage(BaseConditionVO vo);
	Hlabel queryById(String id);
	List<Hlabel> queryByPid(String pid);
	Hlabel queryByPidAndName(Hlabel po);
}
