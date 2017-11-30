package com.cocosh.framework.util;

import net.sf.json.JSONObject;

import com.cocosh.framework.payment.wxap.HttpsUtil;
import com.cocosh.framework.payment.wxap.WXConfig;
//微信企业号发送消息
public class WXSendMsg {
   //"touser" : "UserID1|UserID2|UserID3",给多个用户发送
	public static boolean sendmsg(String UserId, String content){
		JSONObject list = new JSONObject();
		list.put("msgtype", "text");
		list.put("agentid", WXConfig.AgentId);
		list.put("touser", UserId);
		JSONObject jscontent = new JSONObject();
		jscontent.put("content", content);
		list.put("text", jscontent);
		JSONObject getJson = HttpsUtil.gainToken(WXConfig.COMPANY_ACCESS_TOKEN_URL+"corpid="+WXConfig.CorpID+"&corpsecret="+WXConfig.Secret);
		if(getJson!=null){
			String access_token=getJson.getString("access_token");
	       JSONObject postJson = HttpsUtil.callInterface(WXConfig.SEND_MSG+access_token,list.toString());
	       System.out.println(postJson);
		}
		return true;
	}
	public static void main(String[] args) {
		sendmsg("ZhuJianBo||ZhuJianBo|","快来啦");
	}
}
