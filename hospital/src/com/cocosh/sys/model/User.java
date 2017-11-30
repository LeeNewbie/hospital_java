package com.cocosh.sys.model;

import java.util.List;

import com.cocosh.framework.base.BaseEntity;

/**
 * 用户
 * 
 * @author jerry
 */
public class User extends BaseEntity {
	private String username;// 用户名
	private String password;// 密码
	private String nickname;// 昵称
	private String mobile;//联系电话
	private String head_img;// 头像
	private String login_ip;// 最后登录IP
	private Integer is_locked;// 是否锁定 0正常 1锁定
	private Integer fail_count;// 登录失败次数
	private String org_id;// 组织架构节点
	private String type;// 用户类型 0系统用户 
    private String depart_id;
    private String UserId;//微信企业号的唯一标识
	/** 非数据库字段 **/
	private String roles;// 角色集合(辅助属性)
	private List<String> role_names;// 角色名集合
	private int is_reset;// 重置密码

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getHead_img() {
		return head_img;
	}

	public void setHead_img(String head_img) {
		this.head_img = head_img;
	}

	public String getLogin_ip() {
		return login_ip;
	}

	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}

	public Integer getIs_locked() {
		return is_locked;
	}

	public void setIs_locked(Integer is_locked) {
		this.is_locked = is_locked;
	}

	public Integer getFail_count() {
		return fail_count;
	}

	public void setFail_count(Integer fail_count) {
		this.fail_count = fail_count;
	}

	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public List<String> getRole_names() {
		return role_names;
	}

	public void setRole_names(List<String> role_names) {
		this.role_names = role_names;
	}

	public int getIs_reset() {
		return is_reset;
	}

	public void setIs_reset(int is_reset) {
		this.is_reset = is_reset;
	}
	
	public String getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	
	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

}
