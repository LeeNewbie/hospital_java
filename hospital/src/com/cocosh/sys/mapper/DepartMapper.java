package com.cocosh.sys.mapper;

import java.util.List;
import java.util.Map;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.tree.TreeNode;
import com.cocosh.sys.model.Depart;
import com.cocosh.sys.model.Regions;

public interface DepartMapper {
	Integer add(Depart po);
	Integer del(Map<String, Object> map);
	Integer del_true(String[] ids);
	Integer update(Depart po);
	List<Depart> queryPage(BaseConditionVO vo);
	Depart queryById(String id);
	Depart queryParent();
	List<Depart> queryChild(String parnet_id);
	List<TreeNode> queryTreeChild(String parent_id);
	Depart queryByName(String name);
}
