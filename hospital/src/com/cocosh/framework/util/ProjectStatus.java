package com.cocosh.framework.util;

/**
 * 项目状态
 * 
 * @author dable
 * 
 */
public abstract class ProjectStatus {

	/**
	 * ------------------------------------------------------------- 项目状态
	 * -------------------------------------------------------------
	退换货表状态：
	0.申请已提交 
	1.已拒绝 
	2.已通过审核    
	3.已收货（并发货）
	4.完成
	 */
	public static final int APPLY_SUB =0;
	public static final int APPLY_REFUSE =1;
	public static final int APPLY_PASSED = 2;
	public static final int GOODS_REC = 3;
	public static final int APPLY_END =4;

	/**
	 * 获取退换货订单状态
	 * 
	 * @param status
	 * @return
	 */
	

	public static String getProjectStatusName(Integer status) {
		if(status==null) return "";
		String status_name = "";
		switch (status) {
		case 0:
			status_name = "项目跟进";
			break;
		case 1:
			status_name = "外部预算 ";
			break;
		case 2:
			status_name = "待进场(合同未签)";
			break;
		case 3:
			status_name = "待进场(合同已签)";
			break;
		case 4:
			status_name = "施工中(合同未签)";
			break;
		case 5:
			status_name = "施工中(合同已签)";
			break;
		case 6:
			status_name = "完工(合同未签)";
			break;
		case 7:
			status_name = "完工(合同已签)";
			break;
		case 8:
			status_name = "待结款";
			break;
		case 9:
			status_name = "待结保证金";
			break;
		case 10:
			status_name = "项目结束";
			break;
		}
		return status_name;
	}
}
