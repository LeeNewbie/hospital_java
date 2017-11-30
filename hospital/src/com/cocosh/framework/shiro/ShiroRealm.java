package com.cocosh.framework.shiro;

import java.util.Collection;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cocosh.sys.model.User;
import com.cocosh.sys.service.RolePermService;
import com.cocosh.sys.service.UserService;

/**
 * 自定义relam
 * 
 * @author jerry
 */
public class ShiroRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Autowired
	private RolePermService rPermService;
	@Autowired
	private SessionDAO sessionDAO;

	/**
	 * 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// String username = (String) principals.getPrimaryPrincipal();
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getSession().getAttribute("user");
		if (user != null) {
			// 获取当前用户的资源集合
			SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
			List<String> perms = rPermService.queryAvailable(user.getId());
			if (!perms.isEmpty()) {
				auth.addStringPermissions(perms);
			}
//			auth.addStringPermission("*:*");
			return auth;
		}
		return null;
	}

	/**
	 * 获取身份验证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		String username = (String) token.getUsername();
		String password = String.valueOf(token.getPassword());
		User user = userService.queryLogin(username, password);
		if (user != null) {
			Subject subject = SecurityUtils.getSubject();
			subject.getSession().setAttribute("user", user);
			if (user.getIs_locked() == 1) {
				throw new LockedAccountException();// 账号被锁定
			}
			//**(控制一个用户只能在一个地方登陆)
			Collection<Session> sessions = sessionDAO.getActiveSessions();//获取当前已登录的用户session列表
	        for(Session session:sessions){
	            //清除该用户以前登录时保存的session
	            if(username.equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)))) {
	                sessionDAO.delete(session);
	            }
	        }
			return new SimpleAuthenticationInfo(username, user.getPassword(), getName());
		}
		return null;
	}

}
