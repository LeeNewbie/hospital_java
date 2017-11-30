package com.cocosh.sys.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocosh.framework.annotation.LogClass;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.payment.wxap.HttpsUtil;
import com.cocosh.framework.payment.wxap.WXConfig;
import com.cocosh.framework.util.SecurityUtil;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.sys.mapper.RoleMapper;
import com.cocosh.sys.mapper.UserMapper;
import com.cocosh.sys.mapper.UserRoleMapper;
import com.cocosh.sys.model.Role;
import com.cocosh.sys.model.User;
import com.cocosh.sys.model.UserRole;
import com.cocosh.sys.service.UserService;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RoleMapper roleMapper;

	@LogClass(module = "用户管理", method = "添加")
	@Override
	public boolean add(User user) {
		user.setId(StringUtil.getUuid());
		user.setPassword(SecurityUtil.md5("123456"));
		user.setType("0");
		userMapper.add(user);
		//添加user_role关联
		String[] role_ids=user.getRoles().split(",");
		for (int i = 0; i < role_ids.length; i++) {
			UserRole ur=new UserRole();
			ur.setUserId(user.getId());
			ur.setRoleId(role_ids[i]);
			userRoleMapper.add(ur);
		}
		return true;
	}

	@LogClass(module = "用户管理", method = "删除")
	@Override
	public boolean del(Integer flg,String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("del_flg", flg);
		map.put("del_ids", ids.split(","));
		return userMapper.del(map) > 0;
	}

	@LogClass(module = "用户管理", method = "修改")
	@Override
	public boolean update(User user) {
		if (user.getIs_reset()==1) {
			user.setPassword(SecurityUtil.md5("123456"));
		}
		userMapper.update(user);
		//删除user_role关联
		UserRole ur=new UserRole();
		ur.setUserId(user.getId());
		userRoleMapper.del(ur);
		//添加user_role关联
		String[] role_ids=user.getRoles().split(",");
		for (int i = 0; i < role_ids.length; i++) {
			ur=new UserRole();
			ur.setUserId(user.getId());
			ur.setRoleId(role_ids[i]);
			userRoleMapper.add(ur);
		}
		return true;
	}

	@Override
	public Page<User> queryPage(BaseConditionVO vo) {
		PaginationInterceptor.startPage(vo.getPageNo(),vo.getPageSize());
		userMapper.queryPage(vo);
		Page<User> page=PaginationInterceptor.endPage();
		List<String> names=null;
		for (User u : page.getResult()) {
			List<Role> roles=roleMapper.queryNameByUserId(u.getId());
			names=new ArrayList<String>();
			for (int i = 0; i < roles.size(); i++) {
				names.add(roles.get(i).getName());
			}
			u.setRole_names(names);
		}
		return page;
	}

	@Override
	public User queryById(String id) {
		User user = userMapper.queryById(id);
		if (user!=null) {
			user.setRoles(userRoleMapper.queryRolesByUser(id));
		}
		return user;
	}
	

	@Override
	public User queryUserById(String id) {
		return userMapper.queryById(id);
	}

	@Override
	public User queryLogin(String username, String password) {
		User u=new User();
		u.setUsername(username);
		u.setPassword(password);
		return userMapper.queryLogin(u);
	}

	@Override
	public boolean updateIp(String ip, String id) {
		User u=new User();
		u.setLogin_ip(ip);
		u.setId(id);
		return userMapper.update(u)>0;
	}


	@Override
	public boolean modifyUser(User user) {
		return userMapper.update(user)>0;
	}

	@Override
	public List<User> queryByRole(String role_id) {
		return userMapper.queryByRole(role_id);
	}

	@Override
	public User queryByMobile(String mobile) {
		return userMapper.queryByMobile(mobile);
	}

	@Override
	public User queryByUsername(String username) {
		return userMapper.queryByUsername(username);
	}
	@Override
	public boolean validExist(String depart_id) {
		Integer count=userMapper.queryCountByDepartId(depart_id);
		return count>0;
	}
	@Override
	public User queryByUserId(String UserId) {
		if(!StringUtil.isEmpty(UserId)){
			return userMapper.queryByUserId(UserId);
		}
		return null;
	}
}
