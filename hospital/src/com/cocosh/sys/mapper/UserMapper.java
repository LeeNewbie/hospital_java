package com.cocosh.sys.mapper;

import java.util.List;
import java.util.Map;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.sys.model.User;

public interface UserMapper {
	Integer add(User user);
	Integer del(Map<String,Object> map);
	Integer update(User user);
	List<User> queryPage(BaseConditionVO vo);
	User queryLogin(User user);
	User queryById(String id);
	List<User> queryByIds(String[] ids);
	List<User> queryByRole(String role_id);
	List<User> queryByRoles(String[] role_ids);
	
	User queryByMobile(String mobile);
	User queryByUsername(String username);
	//无用方法
	Integer queryCountByDepartId(String depart_id);
	User queryByUserId(String UserId);

}
