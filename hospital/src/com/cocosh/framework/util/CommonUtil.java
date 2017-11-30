package com.cocosh.framework.util;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;

import com.cocosh.framework.json.DateJsonValueProcessor;

import net.sf.json.JsonConfig;

public class CommonUtil {
	/**
	 * 常量说明：
	 * 此处定义的常量需要持久化，可以保存在数据库中，在需要的地方读取。
	 * 在多企业号中，最好以每个应用来定义。
	 */
	public static Properties property = new Properties();
	public static String SERVERDOMAIN;
	public static String RESDOMAIN;
	public static int PAGESIZE ;
	public static int PAGESHOWNUM;
	
	//API接口SECRET_KEY
	public static final String SECRET_KEY = "zxj_app2016_en";
	//调度员角色ID
	public static final String ROLE_DISPATCH="94d80755922e4a7793315e3a5abffb9f";
	//销售角色ID
	public static final String ROLE_SALE="5db1459fae064eceadf6a4d060a338fb";
	//施工项目经理
	public static final String ROLE_BUILD="b37e938ab8ff40d585ac8d3eebbf174d";
	//协调项目经理
	public static final String ROLE_CONNECT="94d80755922e4a7793315e3a5abffb9f";
	//预算
	public static final String ROLE_BUDGET="fd222a714e9b4b1b9b1069ad05519cea";
	//财务应收应付
	public static final String ROLE_FINANCE_RECEIVE_PAY="cf628e66e68741488243394f2d8898e6";
	//经理
	public static final String ROLE_MANAGER="e43030ed5c89489a8d98eadefc860c98";
	//订单
	public static final String ROLE_ORDER="8c11dc06ed2b4982b588f215a01de848";
	//财务核算
	public static final String ROLE_FINANCE_COUNT="b0b8f893dbca400b8266848a3c7ba100";
	//样板管理员
	public static final String ROLE_BOARD="5526513b61f842c19d3ace1bb10ab3de";
	
	//上班时间  
	public static final String AM_IN_TIME=" 08:00:00";
	public static final String AM_OUT_TIME=" 12:00:00";
	public static final String PM_IN_TIME=" 13:00:00";
	public static final String PM_OUT_TIME=" 17:00:00";
	//打卡范围
	public static final String AM_IN_TIME_S=" 07:30:00";
	public static final String AM_IN_TIME_E=" 08:30:00";
	public static final String AM_OUT_TIME_S=" 11:30:00";
	public static final String AM_OUT_TIME_E=" 12:30:00";
	public static final String PM_IN_TIME_S=" 12:30:00";
	public static final String PM_IN_TIME_E=" 13:30:00";
	public static final String PM_OUT_TIME_S=" 16:30:00";
	public static final String PM_OUT_TIME_E=" 17:30:00";
	
	/*********Evcard***********/
	/**
	//同步Evcard接口地址
	public static final String SYNC_EVCARD_MEM="http://58.32.252.60:8085/EvcardRest/members";
	//解绑Evcard接口地址
	public static final String UNBIND_EVCARD_MEM="http://58.32.252.60:8085/EvcardRest/members/unbindMembers";
	//冻结会员卡接口地址
	public static final String FREEZE_MEMBERS="http://58.32.252.60:8085/EvcardRest/members/freezeMembers";
	//解冻会员卡接口地址
	public static final String UNFREEZE_MEMBERS="http://58.32.252.60:8085/EvcardRest/members/unfreezeMembers";
	//换卡接口地址
	public static final String CHANGE_MEM_CARD="http://58.32.252.60:8085/EvcardRest/members/modifyMemCard";
	//违章查询接口地址
	public static final String ILLEGALINFO="http://58.32.252.60:8085/EvcardRest/illegalInfo";
	**/
	
	
	/**2017-01-17测试**/
//	//同步Evcard接口地址
//	public static final String SYNC_EVCARD_MEM="http://139.196.229.140:8083/evcard-rest/members";
//	//解绑Evcard接口地址
//	public static final String UNBIND_EVCARD_MEM="http://139.196.229.140:8083/evcard-rest/members/unbindMembers";
//	//冻结会员卡接口地址
//	public static final String FREEZE_MEMBERS="http://139.196.229.140:8083/evcard-rest/members/freezeMembers";
//	//解冻会员卡接口地址
//	public static final String UNFREEZE_MEMBERS="http://139.196.229.140:8083/evcard-rest/members/unfreezeMembers";
//	//换卡接口地址
//	public static final String CHANGE_MEM_CARD="http://139.196.229.140:8083/evcard-rest/members/modifyMemCard";
//	//违章查询接口地址
//	public static final String ILLEGALINFO="http://139.196.229.140:8083/evcard-rest/illegalInfo";
   
   /**2017-01-17正式**/
	//同步Evcard接口地址
	public static final String SYNC_EVCARD_MEM="http://139.196.248.167:8083/evcard-rest/members";
	//解绑Evcard接口地址
	public static final String UNBIND_EVCARD_MEM="http://139.196.248.167:8083/evcard-rest/members/unbindMembers";
	//冻结会员卡接口地址
	public static final String FREEZE_MEMBERS="http://139.196.248.167:8083/evcard-rest/members/freezeMembers";
	//解冻会员卡接口地址
	public static final String UNFREEZE_MEMBERS="http://139.196.248.167:8083/evcard-rest/members/unfreezeMembers";
	//换卡接口地址
	public static final String CHANGE_MEM_CARD="http://139.196.248.167:8083/evcard-rest/members/modifyMemCard";
	//违章查询接口地址
	public static final String ILLEGALINFO="http://139.196.248.167:8083/evcard-rest/illegalInfo";
	
	
	/*********特来电***********/
	public static final String cKey="5gkXiDZKMB6oT6LP";//签名key,用于Hmacmd5;
	public static final String OperatorID="MA1K370P7";
//	public static final String OperatorSecret="1234567890abcdef";//(测试)
//	public static final String IvParameterSpec="1234567890abcdef";
	public static final String OperatorSecret="lddntwYTNN4qwkIy";
	public static final String IvParameterSpec="Kv1xYAA3m1w1JQ4G";//AES加密密钥;
	public static final String StartAESSpec="BX4S6MrqDzChs1av";//AES初始向量;
	//获取token
		public static final String query_token="http://hlht.teld.cn:9201/evcs/v20161110/query_token";
		//查询充电站信息
		public static final String query_stations_info="http://hlht.teld.cn:9201/evcs/v20161110/query_stations_info";
		//获取电站状态
		public static final String query_station_status="http://hlht.teld.cn:9201/evcs/v20161110/query_station_status";
		//查询统计信息
		public static final String query_station_stats="http://hlht.teld.cn:9201/evcs/v20161110/query_station_stats";
		//开始充电
		public static final String query_start_charge="http://hlht.teld.cn:9201/evcs/v20161110/query_start_charge";
		//结束充电
		public static final String query_stop_charge="http://hlht.teld.cn:9201/evcs/v20161110/query_stop_charge";
		//请求设备认证
		public static final String query_equip_auth="http://hlht.teld.cn:9201/evcs/v20161110/query_equip_auth";
		//查询业务策略信息
		public static final String query_equip_business_policy="http://hlht.teld.cn:9201/evcs/v20161110/query_equip_business_policy";
		//查询充电状态
		public static final String query_equip_charge_status="http://hlht.teld.cn:9201/evcs/v20161110/query_equip_charge_status";
/**
		//获取token(测试)
	public static final String query_token="http://api.wyqcd.cn:9101/evcs/v20161110/query_token";
	//查询充电站信息
	public static final String query_stations_info="http://api.wyqcd.cn:9101/evcs/v20161110/query_stations_info";
	//获取电站状态
	public static final String query_station_status="http://api.wyqcd.cn:9101/evcs/v20161110/query_station_status";
	//查询统计信息
	public static final String query_station_stats="http://api.wyqcd.cn:9101/evcs/v20161110/query_station_stats";
	//开始充电
	public static final String query_start_charge="http://api.wyqcd.cn:9101/evcs/v20161110/query_start_charge";
	//结束充电
	public static final String query_stop_charge="http://api.wyqcd.cn:9101/evcs/v20161110/query_stop_charge";
	//请求设备认证
	public static final String query_equip_auth="http://api.wyqcd.cn:9101/evcs/v20161110/query_equip_auth";
	//查询业务策略信息
	public static final String query_equip_business_policy="http://api.wyqcd.cn:9101/evcs/v20161110/query_equip_business_policy";
	//查询充电状态
	public static final String query_equip_charge_status="http://api.wyqcd.cn:9101/evcs/v20161110/query_equip_charge_status";
	**/
	//API接口返回值定义
	public final static String SUCCESS_CODE = "0";
	public final static String ERROR_CODE = "1";
	public final static String ERROR_CREDENTIAL = "-1";
	public final static String CREDENTIAL_INVALID = "签名失效，请重新登录";
	public final static String SUCCESS_MSG = "";
	public final static String ERROR_PARAMS = "接口参数出错";
	static{
		try {
			property.load(CommonUtil.class.getResourceAsStream("/common.properties"));
			SERVERDOMAIN = property.getProperty("server.domain");
			RESDOMAIN=property.getProperty("res.domain");
			PAGESIZE=Integer.parseInt(property.getProperty("page.size"));
			PAGESHOWNUM=Integer.parseInt(property.getProperty("page.show"));
		} catch (IOException e) {
			System.out.println("not found properties");
		}
    }
	
	@SuppressWarnings("rawtypes")
	public static String reflectMethod(Object obj, String fileds []) {//通过属性名，获取属性值
		StringBuffer security = new StringBuffer();
		Class clazz = obj.getClass();
		try {
			for (int i = 0; i < fileds.length; i++) {
				PropertyDescriptor pd = new PropertyDescriptor(fileds[i], clazz);
				Method getMethod = pd.getReadMethod();//获得get方法
				if (pd != null) {
					Object o = getMethod.invoke(obj);//执行get方法返回一个Object
					if(o == null){
						security.append("");
					}else{
						security.append(o);
					}
				}
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		return security.toString();
	}
	
	public static boolean dataValidate(String summary, String summaryMD5) {//验证加密数据
		return !StringUtils.isEmpty(summary) && !StringUtils.isEmpty(summaryMD5) && summary.equals(summaryMD5);
	}
	
	public static JsonConfig createExcludes(String [] excludes){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor());
		jsonConfig.setExcludes(excludes);
		return jsonConfig;
	}
	
}
