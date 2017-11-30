package com.cocosh.framework.util;

import com.cocosh.framework.freemarker.FreemarkerUtils;

/**
 * 创建MyBatis相关文件(包含controller,Service,Mapper,Model)
 * @author Eric.lan
 *
 */
public class FoundEntity {
 	
 	public static void main(String[] args) throws Exception{

// 		FreemarkerUtils.PROJECT_DIR = "E:\\MyEclipse 10\\quick4j\\";//项目路径
// 	 	FreemarkerUtils.BASE_PACKAGE = "com.cocosh";//BASE包名
//
// 	 	FreemarkerUtils.TARGET_PACKAGE = "com.cocosh.car";//目标包名（为model上一次）
// 	 	FreemarkerUtils.MODULE= "品牌类型";//日志说明（需要日志）//
//
//// 	 	FreemarkerUtils.MODULE= null;//无需日志
// 	 	FreemarkerUtils.create("BrandType", "zxj_brand_type");//PO对象名称和表名
// 		String s="201701-11.11";
// 		Integer num=s.indexOf("-")+1;
// 		Integer nun2=s.indexOf(".")+1;
// 		String a=s.substring(nun2,s.length());
// 		System.out.println(a);
// 		System.out.println(s.substring(0,nun2));
 		String newnumber="";
 		String number="HT201707001-0.1";
 		String maxid="HT201707001-0.4";
		if(maxid.length()>11){//有其他的增补合同
			Integer start=maxid.indexOf("-")+1;
	 		Integer end=maxid.indexOf(".");
			Integer num=Integer.parseInt(maxid.substring(start,end))+1;
			System.out.println(start+"0000"+end);
			newnumber=number.substring(0,start-1)+"-"+num+".0";
			System.out.println(num);
		}
//		System.out.println(newnumber);
// 		FreemarkerUtils.PROJECT_DIR = "D:\\temp\\";//项目路径
// 	 	FreemarkerUtils.BASE_PACKAGE = "com.cocosh";//BASE包名
//
// 	 	FreemarkerUtils.TARGET_PACKAGE = "com.cocosh.xq";//目标包名（为model上一次）
// 	 	FreemarkerUtils.MODULE= "品牌类型";//日志说明（需要日志）//
//
//// 	 	FreemarkerUtils.MODULE= null;//无需日志
// 	 	FreemarkerUtils.create("InBudget", "xq_inbudget");//PO对象名称和表名
		
 		FreemarkerUtils.PROJECT_DIR = "D:\\eclipse-workspace\\quick4j\\";//项目路径
 	 	FreemarkerUtils.BASE_PACKAGE = "com.cocosh";//BASE包名

 	 	FreemarkerUtils.TARGET_PACKAGE = "com.cocosh.xq";//目标包名（为model上一次）
 	 	FreemarkerUtils.MODULE= "打卡记录";//日志说明（需要日志）//

// 	 	FreemarkerUtils.MODULE= null;//无需日志
 	 	FreemarkerUtils.create("StaffSign", "xq_staffsign");//PO对象名称和表名
	}
 }
 