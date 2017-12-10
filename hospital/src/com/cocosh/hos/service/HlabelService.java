package com.cocosh.hos.service;
 
import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.Hlabel;

public interface HlabelService {
	boolean add(Hlabel po);
	boolean del(String ids);
	boolean update(Hlabel po);
	Page<Hlabel> queryPage(BaseConditionVO vo);
	Hlabel queryById(String id);
	List<Hlabel> queryByPid(String pid);
	Hlabel queryByPidAndName(String pid,String name);
}
