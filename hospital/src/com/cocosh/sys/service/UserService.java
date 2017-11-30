package com.cocosh.sys.service;

import java.util.List;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.sys.model.User;

public interface UserService {
	boolean add(User user);
	boolean del(Integer flg,String ids);
	boolean update(User user);
	boolean updateIp(String ip,String id);
	Page<User> queryPage(BaseConditionVO vo);
	User queryById(String id);//查询用户和权限
	User queryUserById(String id);
	User queryLogin(String username,String password);
	User queryByMobile(String mobile);
	User queryByUsername(String username);
	boolean modifyUser(User user);
	List<User> queryByRole(String role_id);
	boolean validExist(String depart_id);
	User queryByUserId(String UserId);//微信企业号id 
}
