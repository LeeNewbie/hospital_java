package com.cocosh.framework.payment.wxap;

public class WXConfig {

	
    public final static	String  APPID   = "wx9be720f20983a5db";
    public final static String  APPSECRET  = "bc3d1f6e28f728e0f9a7b6d4f8e6ab49";
    public final static String PARTNER = "1381486902";
    public final static String PARTENR_KEY = "103b84aa6c104b0d96b25d21226341dc";//网页支付对应商户私钥
    public final static String PARTNER_APP = "1381486902";
    public final static String PARTENR_KEY_APP = "AgzI3YnTnmpUrKfqKjS0pV86SyF46NYx";//移动支付对应商户私钥
//    public final static String REDIRECT_URI   = "http://www.vway.me/payapi/wxpay/topay"; //获取openid 跳转地址 
//    public final static String NOTIFY_URL = "http://www.vway.me/payapi/wxpay/notify"; //微信回调地址
 

    public final static String CorpID = "wwb6902b60e32fbce0";//企业ID;
    //策淘cetao.cn上的
    public final static String AgentId = "1000004";//应用ID
    public final static String Secret = "NdD28uFTsuIoEMubHaMA4w1baE2HVztf2u8Ee66PusI";//应用Secret
    //信澳singall.cn上的
//    public final static String AgentId = "1000003";//应用ID
//    public final static String Secret = "5feWx0JD5cT-o2Gri7kvarHfjl5y1Ok1L7J2jkdE33s";//应用Secret

    //获取企业公众号access_token
    public final static String COMPANY_ACCESS_TOKEN_URL = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?";
    //获取useid
    public final static String USERINFO= "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?";
    //发送消息
    public final static String SEND_MSG="https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=";
    
    public final static String NOTIFY_URL = "http://dior.yeguo.cc/dior/payapi/wxpay/notify"; //微信回调地址
    //userid转openid
	public final static String CONVERT_TO_OPENID="https://qyapi.weixin.qq.com/cgi-bin/user/convert_to_openid?";
	//获取用户详细信息
	public final static String USER_DETAIL="https://qyapi.weixin.qq.com/cgi-bin/user/get?";
	//获取部门
	public final static String DEPARTMENT="https://qyapi.weixin.qq.com/cgi-bin/department/list?";
	
	
}
