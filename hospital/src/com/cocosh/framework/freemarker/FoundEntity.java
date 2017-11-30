package com.cocosh.framework.freemarker;

import java.util.HashMap;
import java.util.Map;

/**
 * 创建MyBatis相关文件(包含controller,Service,Mapper,Model)
 * @author Eric.lan
 *
 */
public class FoundEntity {
 	
 	public static void main(String[] args) throws Exception{

// 		FreemarkerUtils.PROJECT_DIR = "E:\\MyEclipse 10\\xinqian\\";//项目路径
// 	 	FreemarkerUtils.BASE_PACKAGE = "com.cocosh";//BASE包名
//
// 	 	FreemarkerUtils.TARGET_PACKAGE = "com.cocosh.xq";//目标包名（为model上一次）
// 	 	FreemarkerUtils.MODULE= "历史进行中付款";//日志说明（需要日志）
//
//// 	 	FreemarkerUtils.MODULE= null;//无需日志
// 	 	FreemarkerUtils.create("Hinreceive", "xq_history_hinreceive");//PO对象名称和表名
 		Map<String,String> map=new HashMap<String, String>();
 		map.put("1", "a");
 		map.put("4", "b");
 		map.put("3", "c");
// 		map.put("1", "c");
 		for(String s:map.keySet()){
 			System.out.println(s+"---"+map.get(s));
 		}
 		System.out.println("1".compareTo("2"));

	}
 }
 