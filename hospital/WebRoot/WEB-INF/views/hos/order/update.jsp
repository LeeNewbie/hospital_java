<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>信乾</title>
    <meta name="keywords" content="后台bootstrap框架,后台HTML,响应式后台">
    <meta name="description" content="基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> 
    
    <link href="${ctx}/statics/manage/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/css/bootstrapValidator.css" rel="stylesheet">
    <style type="text/css">
     .invoice-table input{width: 80px;height: 30px}
     .myinput{height: 30px;border: none;margin-left: 20px;margin-right: 5px}
   </style>
</head>

<body>
    <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form action="" method="post" class="form-horizontal">
                         <div class="gray-bg" id="order_div" style="padding: 20px 0px;margin-bottom: 20px">
                           <h2>临床资料</h2>
                           <div class="form-group">
                                <label class="col-sm-1 control-label">病历号</label>
                                   
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="sn" value="${order.sn}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">姓名</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="name" value="${order.name }" >
                                </div>
                                <label class="col-sm-1 control-label">联系方式</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="mobile" value="${order.mobile }" >
                                </div>
                                <label class="col-sm-1 control-label">性别</label>
                                 <div class="col-sm-2">
                                <select class="form-control" name="gender">
                                           <option value="0">男</option>
                                           <option value="1">女</option>
                                    </select>
                                    </div>
                                <label class="col-sm-1 control-label">年龄</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="age" value="${order.age }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">家庭住址</label>
                                   
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="address" value="${order.address }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">术前诊断(可多选)</label>
                                <div class="col-sm-9">
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="病窦" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'病窦')>-1}">checked</c:if> >病窦</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="房颤伴长RR间期" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'房颤伴长RR间期')>-1}">checked</c:if>>房颤伴长RR间期</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="扩张型心肌病" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'扩张型心肌病')>-1}">checked</c:if>>扩张型心肌病</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="晕厥" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'晕厥')>-1}">checked</c:if>>晕厥</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="肥厚新型心肌病" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'肥厚新型心肌病')>-1}">checked</c:if>>肥厚新型心肌病</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="缺血型心肌病" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'缺血型心肌病')>-1}">checked</c:if>>缺血型心肌病</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="心脏骤停" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'心脏骤停')>-1}">checked</c:if>>心脏骤停</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="遗传性心律失常" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'遗传性心律失常')>-1}">checked</c:if>>遗传性心律失常</label>
                                  <label class="checkbox-inline i-checks"><input type="checkbox" value="房室传导阻滞" name="diagnose" <c:if test="${fn:indexOf(order.diagnose,'房室传导阻滞')>-1}">checked</c:if>>房室传导阻滞</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">其他</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="diagnose_other" value="${order.diagnose_other }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">植入时间</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="plant_date" value="<fmt:formatDate value='${order.plant_date }' pattern='yyyy-MM-dd'/>" > 
                                </div>
                                <label class="col-sm-1 control-label">手术耗时</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="operation_time" value="${order.operation_time }">
                                </div>
                                <label class="col-sm-1 control-label">首次访问日期</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="first_date" value="<fmt:formatDate value='${order.first_date }' pattern='yyyy-MM-dd'/>">
                                </div>
                            </div>
                           <div class="form-group">
                             <label class="col-sm-1 control-label">手术类型</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="operation_type" value="${order.operation_type }">
                                </div>
                                 <label class="col-sm-1 control-label">是否更换</label>
                                <div class="col-sm-2">
                                	是&nbsp;<input type="checkbox" class="js-switch" name="is_change" <c:if test="${order.is_change==1 }">checked</c:if> />&nbsp;否
                                </div>
                                 <label class="col-sm-1 control-label">自身心率</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="hreat_rate" value="${order.hreat_rate }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            
                          <div class="form-group">
                             <label class="col-sm-1 control-label">A组</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="agroup" value="${order.agroup}">
                                </div>
                                 <label class="col-sm-1 control-label">导管室</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="daoroom" value="${order.daoroom }">
                                </div>
                                 <label class="col-sm-1 control-label">三维</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="sanwei" value="${order.sanwei }">
                                </div>
                                 <label class="col-sm-1 control-label">多导</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="duodao" value="${order.duodao }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <div id="operater_div">
                                  <c:if test="${empty order.operater}">
                                    <div class="col-sm-3 operater" tag="1">
		                               <label class="col-sm-4 control-label">术者1</label>
		                                <div class="col-sm-8">
		                                    <input type="text" class="form-control" name="operater" >
		                                </div>
	                                </div>
                                  </c:if>
                                  <c:if test="${not empty order.operater}">
                                      <c:forEach items="${fn:split(order.operater, ',')}" var="operater" varStatus="status">
	                                        <div class="col-sm-3 operater" tag="1">
				                               <label class="col-sm-4 control-label">术者${status.index+1}</label>
				                                <div class="col-sm-5">
				                                    <input type="text" class="form-control" name="operater" value="${operater }" >
				                                </div>
				                                 <c:if test="${status.index>=1 }">
				                                <div class="col-sm-2"><button class="btn btn-warning" type="button" onclick="$(this).parents('.operater').remove()">删除</button></div>
			                                    </c:if>
			                                </div>
								        </c:forEach>
                                  </c:if>
                                </div>
                                <div class="col-sm-2">
                                   <button class="btn btn-info" type="button" onclick="add_operater()">添加</button>
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                             <label class="col-sm-1 control-label">并发症</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="complication" value="${order.complication }" >
                                </div>
                                <label class="col-sm-2 control-label">术中有无发现其他植入物</label>
                                <div class="col-sm-2">
                                	是&nbsp;<input type="checkbox" class="js-switch" name="have_other" <c:if test="${order.have_other==1 }">checked</c:if>/>&nbsp;否
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                               <label class="col-sm-1 control-label">特殊情况备注</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="remark" >${order.remark }</textarea>
                                </div>
                             </div>
                         </div>
                         <!-- 产品信息 -->
                         <div class="gray-bg" id="product_div" style="padding: 20px 0px;margin-bottom: 20px">
                            <h2>产品信息</h2>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">厂家</label>
                                <div class="col-sm-2">
                                    <select class="chosen-select" name="product_pid" onchange="selectProduct('')">
                                       <c:forEach items="${plist}" var="p">
                                          <option value="${p.name}">${p.name}</option>
                                       </c:forEach>
                                    </select>
                                </div>
                                <label class="col-sm-1 control-label">机器型号</label>
                                <div class="col-sm-2">
                                    <select class="chosen-select" name="product_id">
                                    </select>
                                </div>
                                 <div class="col-sm-1">
                                <select class="form-control" name="psingle">
                                           <option value="1">单腔</option>
                                           <option value="2">双腔</option>
                                           <option value="3">三腔</option>
                                    </select>
                                 </div>
                                <div class="col-sm-1">
                                   <select class="form-control" name="brady">
                                           <option value="1">Brady VVI</option>
                                           <option value="2">Brady DDD</option>
                                           <option value="3">ICD VVI</option>
                                           <option value="4">ICD DDD</option>
                                           <option value="5">CRTR</option>
                                           <option value="6">CRTD</option>
                                    </select>
                                </div>
                                <label class="col-sm-1 control-label">兼容MRI</label>
                                <div class="col-sm-1">
                                                                                                              有&nbsp;<input type="checkbox" class="js-switch" name="compatible" <c:if test="${order.compatible==1 }">checked</c:if>/>&nbsp;无            
                                </div>
                                 <label class="col-sm-1 control-label">机器序列号</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control" name="machine_sn" value="${order.machine_sn }">
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                             <div class="table-responsive m-t well" style="margin-left: 5%;width: 50%" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr>
				                                	<th></th>
				                                	<th>电极型号</th>
				                                	<th>电极序列号</th>
				                                	<th>电极植入部位</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td>心房</td>
				                                 <td><input type="text" name="hreart_type" value="${order.hreart_type }"></td>
				                                 <td><input type="text" name="hreat_sn" value="${order.hreat_sn }"></td>
				                                 <td>
				                                    <select class="form-control" name="hreat_location">
					                                         <option value="1">右心耳</option>
					                                         <option value="2">房间隔</option>
					                                         <option value="3">HIS</option>
					                                  </select>
				                                 </td>
				                               </tr>
				                               <tr>
				                                 <td>右心室</td>
				                                 <td><input type="text" name="right_type" value="${order.right_type }"></td>
				                                 <td><input type="text" name="right_sn" value="${order.right_sn }"></td>
				                                 <td>
				                                    <select class="form-control" name="right_location">
					                                         <option value="1">室尖隔</option>
					                                         <option value="2">心尖</option>
					                                  </select>
				                                 </td>
				                               </tr>
				                               <tr>
				                                 <td>左室</td>
				                                 <td><input type="text" name="left_type" value="${order.left_type }"></td>
				                                 <td><input type="text" name="left_sn" value="${order.left_sn }"></td>
				                                 <td>
				                                    <select class="form-control" name="left_location">
					                                         <option value="1">前侧壁</option>
					                                         <option value="2">侧壁</option>
					                                         <option value="3">后侧壁</option>
					                                  </select>
				                                 </td>
				                               </tr>
				                            </tbody>
				                        </table>
				                        </div>
                         </div>
                         
                         
                           <!-- 标签信息 -->
                         <div class="gray-bg" style="padding: 20px 0px;margin-bottom: 20px">
                            <h2>标签信息
                                 <button class="btn btn-info" type="button" onclick="add_hlable_one()">添加一级标签</button>
                                 <button class="btn btn-info" type="button" onclick="add_hlable_two()">添加二级标签</button>
                            </h2>
                           
                             <div class="form-group" id="hlabel_div">
                                <c:forEach items="${orderhlabels }" var="oh">
                                  <c:if test="${empty oh.hlabel_id}">
	                              <div class="col-sm-4 hlabel"> 
	                                   <div class="col-sm-5">
	                                      <select class="chosen-select" name="hlabel_pid">
	                                         <c:forEach items="${parent_hlabels}" var="ph">
	                                          <option value="${ph.id}" <c:if test="${ph.id==oh.hlabel_pid }">selected</c:if> >${ph.name}</option>
	                                         </c:forEach>
	                                     </select></div>
	                                   <div class="col-sm-2"><button class="btn btn-warning" type="button" onclick="javascript:$(this).parents('.hlabel').remove()">删除</button></div>
	                              </div>
	                              </c:if>
	                              
	                              <c:if test="${not empty oh.hlabel_id}">
	                              <div class="col-sm-4 hlabel"> 
	                                   <div class="col-sm-5">
	                                      <select class="chosen-select" name="hlabel_pid" onchange="change_hlabel_pid(this)">
	                                         <c:forEach items="${parent_hlabels}" var="ph">
	                                          <option value="${ph.id}" <c:if test="${ph.id==oh.hlabel_pid }">selected</c:if> >${ph.name}</option>
	                                         </c:forEach>
	                                     </select>
	                                  </div>
	                                  <div class="col-sm-5">
	                                      <select class="chosen-select" name="hlabel_id">
	                                         <c:forEach items="${oh.hlabes}" var="h">
	                                          <option value="${h.id}" <c:if test="${h.id==oh.hlabel_id }">selected</c:if> >${h.name}</option>
	                                         </c:forEach>
	                                     </select>
	                                  </div>
	                                   <div class="col-sm-2"><button class="btn btn-warning" type="button" onclick="javascript:$(this).parents('.hlabel').remove()">删除</button></div>
	                              </div>
	                              </c:if>
	                            </c:forEach>
	                         </div>
                         </div>
                         
                          <!-- 术中测试 -->
                         <div class="gray-bg" id="test_div" style="padding: 20px 0px;margin-bottom: 20px">
                            <h2>术中测试</h2>
                             <div class="table-responsive m-t well" style="margin-left: 5%;" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr>
				                                	<th></th>
				                                	<th>阈值</th>
				                                	<th>脉宽</th>
				                                	<th>感知</th>
				                                	<th>阻抗</th>
				                                	<th>远场感知</th>
				                                	<th>膈肌刺激</th>
				                                	<th>高压阻抗</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td>心房</td>
				                                 <td><input type="text" name="hreat_yuzhi" value="${ordertest.hreat_yuzhi }">v</td>
				                                 <td><input type="text" name="hreat_width" value="${ordertest.hreat_width }">ms</td>
				                                 <td><input type="text" name="hreat_feel" value="${ordertest.hreat_feel }">mv</td>
				                                 <td><input type="text" name="hreat_forbid" value="${ordertest.hreat_forbid }"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="hreat_isfeel" <c:if test="${ordertest.hreat_isfeel==1 }">checked</c:if>/>&nbsp;否</td>
				                               	 <td><input type="text" name="hreat_active" value="${ordertest.hreat_active }"></td>
				                               </tr>
				                                <tr>
				                                 <td>右室</td>
				                                 <td><input type="text" name="right_yuzhi" value="${ordertest.right_yuzhi }">v</td>
				                                 <td><input type="text" name="right_width" value="${ordertest.right_width }">ms</td>
				                                 <td><input type="text" name="right_feel" value="${ordertest.right_feel }">mv</td>
				                                 <td><input type="text" name="right_forbid" value="${ordertest.right_forbid }"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="right_isfeel" <c:if test="${ordertest.right_isfeel==1 }">checked</c:if>/>&nbsp;否</td>
				                               	 <td><input type="text" name="right_active" value="${ordertest.right_active }"></td>
				                               	 <td><input type="text" name="right_high" value="${ordertest.right_high }"></td>
				                               </tr>
				                                <tr>
				                                 <td>左室</td>
				                                 <td><input type="text" name="left_yuzhi" value="${ordertest.left_yuzhi }">v</td>
				                                 <td><input type="text" name="left_width" value="${ordertest.left_width }">ms</td>
				                                 <td><input type="text" name="left_feel" value="${ordertest.left_feel }">mv</td>
				                                 <td><input type="text" name="left_forbid" value="${ordertest.left_forbid }"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="left_isfeel" <c:if test="${ordertest.left_isfeel==1 }">checked</c:if>/>&nbsp;否</td>
				                               	 <td><input type="text" name="left_active" value="${ordertest.left_active }"></td>
				                               </tr>
				                            </tbody>
				                        </table>
				                        </div>
                         </div>
                         
                           <!-- HIS测试 -->
                         <div class="gray-bg"  style="padding: 20px 0px;margin-bottom: 20px">
                            <h2>HIS测试</h2>
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                               <label class="col-sm-2 control-label">HBP接口位置</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="hbp_location" value="${order.hbp_location }">
                                </div>
                              </div>
                              <div class="hr-line-dashed"></div>
                             <div class="form-group">
                               <label class="col-sm-2 control-label">术前QRS宽度（ms）</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="qrs_width" value="${order.qrs_width }">
                                </div>
                                <label class="col-sm-1 control-label">LBBB</label>
                                <div class="col-sm-2">
                                                                                                           是&nbsp;<input type="checkbox" class="js-switch" name="lbbb" <c:if test="${order.lbbb==1 }">checked</c:if>/>&nbsp;否                 
                                </div>
                             </div>
                             <button class="btn btn-info" type="button" onclick="addhistest()" style="margin-left: 50px">添加</button>
                             <div class="form-group" id="histest_div">
	                             <c:forEach items="${histests}" var="h">
	                             <div class="col-sm-6 histest" >
	                                   <div class="table-responsive m-t well" style="margin-left: 5%;" >
					                        <table class="table invoice-table">
					                            <thead>
					                                <tr>
					                                    <th></th>
					                                	<th><select class="form-control"  name="histest_type" >
						                                         <option value="1" <c:if test="${h.type==1}">selected</c:if> >单极</option>
						                                         <option value="2" <c:if test="${h.type==2}">selected</c:if>  >双极</option>
						                                  </select></th>
					                                	<th><button class="btn btn-warning" type="button" onclick="javascript:$(this).parents('.histest').remove()">删除</button></th>
					                                </tr>
					                            </thead>
					                            <tbody>
					                               <tr>
					                                 <td>脉宽</td>
					                                 <td><input  type="text" name="yuzhi_width" value="${h.yuzhi_width }">&nbsp;&nbsp;ms</td>
					                               <tr>
					                               <tr>
					                                 <td>Select阈值</td>
					                                 <td><input  type="text" name="yuzhi" value="${h.yuzhi }" >&nbsp;&nbsp;v</td>
					                               </tr>
					                               <tr>
					                                 <td>Non-Selected阈值</td>
					                                 <td><input  type="text" name="noyuzhi" value="${h.noyuzhi }">&nbsp;&nbsp;v</td>
					                               </tr>
					                               <tr>
					                                 <td>H-V间期</td>
					                                 <td><input  type="text" name="hv_interval" value="${h.hv_interval }"></td>
					                               </tr>
					                               <tr>
					                                 <td>HBP QRS宽度</td>
					                                 <td><input  type="text" name="hpb_width" value="${h.hpb_width }"></td>
					                               </tr>
					                               <tr>
					                                 <td>损伤电流是否</td>
					                                 <td>是&nbsp;<input type="checkbox" class="js-switch" <c:if test='${h.is_damage==1 }'>checked</c:if> name="is_damage"/>&nbsp;否</td>
					                               </tr>
					                            </tbody>
					                        </table>
					                        </div>
	                             </div>
	                             </c:forEach>
                             </div>
                             <div class="form-group">
                               <label class="col-sm-2 control-label">HBP</label>
                                    <input type="text" class="myinput" name="hbp1" value="${order.hbp1 }">bpm
                                    <input type="text" class="myinput" name="hbp2" value="${order.hbp2 }">  v
                                    <input type="text" class="myinput" name="hbp3" value="${order.hbp3 }">ms
                                
                             </div>
                              
                              
                         </div>
                         
                         
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4" style="text-align: center;">
                                    <button class="btn btn-primary" type="button" onclick="update()">保存内容</button>
                                    <button class="btn btn-white" type="button" onclick="layer_close()">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <script src="${ctx}/statics/manage/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/statics/manage/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/statics/manage/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/statics/manage/js/plugins/switchery/switchery.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx}/statics/manage/plugins/layer/layer.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js"></script>
    <script src="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/js/bootstrapValidator.js"></script>
    
    <script>
    $(document).ready(function() {
        $('form').bootstrapValidator();
    });
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
        $('.chosen-select').chosen();
        $("[name='gender']").val("${order.gender}");
        $("[name='product_pid']").val("${product.name}");
        $("[name='psingle']").val("${order.psingle}");
        $("[name='brady']").val("${order.brady}");
        $("[name='hreat_location']").val("${order.hreat_location}");
        $("[name='left_location']").val("${order.left_location}");
        $("[name='right_location']").val("${order.right_location}");
        
        $(".chosen-select").trigger("chosen:updated");
        $("[name='plant_date'],[name='first_date']").datepicker({
        	format: "yyyy-mm-dd",
        	todayHighlight:true,
       		autoclose: true,
       		todayBtn: true,
        });
        
        //添加his测试
        function addhistest(){
        	$("#histest_div").append(addhistest_html);
        	//序列化标签
            var elems = Array.prototype.slice.call($("#histest_div .histest").last().find('.js-switch'));
            elems.forEach(function(html) {
             var switchery = new Switchery(html);
           });
        }
        function update(){
        	var bootstrapValidator = $("form").data('bootstrapValidator');
	        bootstrapValidator.validate();
	        if(!bootstrapValidator.isValid())return;
        	$(".btn-primary").attr("disabled",true);
        	var hreat_isfeel=0,left_isfeel=0,right_isfeel=0;
        	if($("[name='hreat_isfeel']").is(":checked"))hreat_isfeel=1;
        	if($("[name='left_isfeel']").is(":checked"))left_isfeel=1;
        	if($("[name='right_isfeel']").is(":checked"))right_isfeel=1;
        	var ordertest={"id":"${ordertest.id}","hreat_yuzhi":$("[name='hreat_yuzhi']").val(),"hreat_width":$("[name='hreat_width']").val(),"hreat_feel":$("[name='hreat_feel']").val(),"hreat_forbid":$("[name='hreat_forbid']").val(),"hreat_isfeel":hreat_isfeel,"hreat_active":$("[name='hreat_active']").val(),
        			"right_yuzhi":$("[name='right_yuzhi']").val(),"right_width":$("[name='right_width']").val(),"right_feel":$("[name='right_feel']").val(),"right_forbid":$("[name='right_forbid']").val(),"right_isfeel":right_isfeel,"right_active":$("[name='right_active']").val(),"right_high":$("[name='right_active']").val(),
        			"left_yuzhi":$("[name='left_yuzhi']").val(),"left_width":$("[name='left_width']").val(),"left_feel":$("[name='left_feel']").val(),"left_forbid":$("[name='left_forbid']").val(),"left_isfeel":left_isfeel,"left_active":$("[name='left_active']").val()};
        	var histests=[];
        	 $("#histest_div .histest").each(function(){
        		 var is_damage=0;
        		 if($(this).find("[name='is_damage']").is(":checked"))is_damage=1;
        		 histests.push({"type":$(this).find("[name='histest_type']").val(),"yuzhi":$(this).find("[name='yuzhi']").val(),"yuzhi_width":$(this).find("[name='yuzhi_width']").val(),
        			 "noyuzhi":$(this).find("[name='noyuzhi']").val(), "hv_interval":$(this).find("[name='hv_interval']").val(), 
        			 "hpb_width":$(this).find("[name='hpb_width']").val(), "is_damage":is_damage
        		 })
        	 
        	 })
        	var diagnose=[];
			$("[name='diagnose']:checked").each(function(){
				diagnose.push($(this).attr("value"));
			})
			var operater=[];
			$("[name='operater']").each(function(){
				var operater_name=$(this).val();
				if(operater_name!=null&&operater_name!="")operater.push(operater_name);
			})
			 var orderhlabels=[];
        	 $("#hlabel_div .hlabel").each(function(){
        		 orderhlabels.push({"hlabel_pid":$(this).find("[name='hlabel_pid']").val(),"hlabel_id":$(this).find("[name='hlabel_id']").val()})
        	 });
			var is_change=0,have_other=0,compatible=0,lbbb=0;
			if($("[name='is_change']").is(":checked"))is_change=1;
			if($("[name='have_other']").is(":checked"))have_other=1;
			if($("[name='compatible']").is(":checked"))compatible=1;
			if($("[name='lbbb']").is(":checked"))lbbb=1;
        	var params={"id":"${order.id}","sn":$("[name='sn']").val(),"name":$("[name='name']").val(),"mobile":$("[name='mobile']").val(),"gender":$("[name='gender']").val(),"age":$("[name='age']").val(),
        			    "address":$("[name='address']").val(),"diagnose":diagnose.toString(),"diagnose_other":$("[name='diagnose_other']").val(),"plant_date":$("[name='plant_date']").val(),
        			    "operation_time":$("[name='operation_time']").val(),"first_date":$("[name='first_date']").val(),"operation_type":$("[name='operation_type']").val(),
        			    "is_change":is_change,"hreat_rate":$("[name='hreat_rate']").val(),"agroup":$("[name='agroup']").val(),"daoroom":$("[name='daoroom']").val(),
        			    "sanwei":$("[name='sanwei']").val(),"duodao":$("[name='duodao']").val(),"operater":operater.toString(),"complication":$("[name='complication']").val(),
        			    "have_other":have_other,"remark":$("[name='remark']").val(),
        			    "product_id":$("[name='product_id']").val(),"psingle":$("[name='psingle']").val(),"brady":$("[name='brady']").val(),"compatible":compatible,"machine_sn":$("[name='machine_sn']").val(),
        			    "hreart_type":$("[name='hreart_type']").val(),"hreat_sn":$("[name='hreat_sn']").val(),"hreat_location":$("[name='hreat_location']").val(),
        			    "right_type":$("[name='right_type']").val(),"right_sn":$("[name='right_sn']").val(),"right_location":$("[name='right_location']").val(),
        			    "left_type":$("[name='left_type']").val(),"left_sn":$("[name='left_sn']").val(),"left_location":$("[name='left_location']").val(),
        			    "hbp_location":$("[name='hbp_location']").val(),"qrs_width":$("[name='qrs_width']").val(),"lbbb":lbbb,
        			    "hbp1":$("[name='hbp1']").val(),"hbp2":$("[name='hbp2']").val(),"hbp3":$("[name='hbp3']").val(),
        			    "ordertest":ordertest,"histests":histests,"orderhlabels":orderhlabels}
        	$.ajax({
				url:"${ctx}/manage/order/update",
				type: "POST",
				data: JSON.stringify(params),
				success: function(data){
					if(data.code=="0"){
					   opt_success("修改成功",0);
					}else{
					    $(".btn-primary").attr("disabled",false);
						opt_error(data.msg);
					}
				},
				dataType: "json",
				contentType: "application/json"
			});
        }
        var addhistest_html="";
        $(function(){
        	var html="<div class=\"col-sm-6 histest\" >";
            html+="<div class=\"table-responsive m-t well\" style=\"margin-left: 5%;\" >";
               html+="<table class=\"table invoice-table\">";
                 html+="<thead><tr><th></th>";
                     	html+="<th><select class=\"form-control\" name=\"histest_type\">";
                           html+="<option value=\"1\">单极</option>";
                           html+="<option value=\"2\">双极</option></select></th>";
                 html+="<th><button class=\"btn btn-warning\" type=\"button\" onclick=\"javascript:$(this).parents('.histest').remove()\">删除</button></th>";
                 html+="</tr> </thead>";
                 html+="<tbody><tr><td>脉宽</td><td><input type=\"text\" name=\"yuzhi_width\">&nbsp;&nbsp;ms</td></tr>";
                 html+="<tr><td>Select阈值</td>";
                 html+="<td><input  type=\"text\" name=\"yuzhi\">&nbsp;&nbsp;v</td></tr>";
                 html+="<tr><td>Non-Selected阈值</td>";
                 html+="<td><input  type=\"text\" name=\"noyuzhi\">&nbsp;&nbsp;v</td></tr>";
                 html+="<tr><td>H-V间期</td><td><input  type=\"text\" name=\"hv_interval\"></td></tr>";
                 html+="<tr><td>HBP QRS宽度</td><td><input  type=\"text\" name=\"hbp_width\"></td></tr>";
                 html+="<tr><td>损伤电流是否</td><td>是&nbsp;<input type=\"checkbox\" class=\"js-switch\" name=\"is_damage\"/>&nbsp;否</td></tr>";
          html+="</tbody></table></div></div>";
          addhistest_html=html;
          selectProduct("${order.product_id}");//加载产品并选中
        })
        
        function selectProduct(product_id){
        	var product_name=$("[name='product_pid']").val();
        	$.getJSON("${ctx}/manage/product/queryByName/"+product_name,function(data){
        		var option_html="";
        		if(data.length>0){
        			for(var i=0;i<data.length;i++){
        				option_html+="<option value="+data[i].id+">"+data[i].number+"</option>";
        			}
        		}
        		$("[name='product_id']").html(option_html);
        		if(product_id!="")$("[name='product_id']").val(product_id);
        		$('.chosen-select').chosen();
                $(".chosen-select").trigger("chosen:updated");
        	})
        }
        

        function add_hlable_one(){
        	var hlable_parent_html="<div class=\"col-sm-4 hlabel\" > <div class=\"col-sm-5\" >";
        	hlable_parent_html+="<select class=\"chosen-select\" name=\"hlabel_pid\">";
        	var phlabels=eval('${phlabels}');
        	for(var i=0;i<phlabels.length;i++){
        		hlable_parent_html+="<option value="+phlabels[i].id+">"+phlabels[i].name+"</option>";
        	}
        	hlable_parent_html+="</select></div>"
        	hlable_parent_html+="<div class=\"col-sm-2\" ><button class=\"btn btn-warning\" type=\"button\" onclick=\"javascript:$(this).parents('.hlabel').remove()\" >删除</button>";
        	hlable_parent_html+="</div> </div>";
        	$("#hlabel_div").append(hlable_parent_html);
        	$('.chosen-select').chosen();
            $(".chosen-select").trigger("chosen:updated");
        }
        function add_hlable_two(){
        	var hlable_parent_html="<div class=\"col-sm-4 hlabel\" > <div class=\"col-sm-5\" >";
        	hlable_parent_html+="<select class=\"chosen-select\" name=\"hlabel_pid\" onchange=\"change_hlabel_pid(this)\">";
        	var phlabels=eval('${phlabels}');
        	for(var i=0;i<phlabels.length;i++){
        		hlable_parent_html+="<option value="+phlabels[i].id+">"+phlabels[i].name+"</option>";
        	}
        	hlable_parent_html+="</select></div>";
        	hlable_parent_html+="<div class=\"col-sm-5\" ><select class=\"chosen-select\" name=\"hlabel_id\">";
            var hlabels=eval('${hlabels}');
        	for(var i=0;i<hlabels.length;i++){
        		hlable_parent_html+="<option value="+hlabels[i].id+">"+hlabels[i].name+"</option>";
        	}
        	hlable_parent_html+="</select></div>"
        	hlable_parent_html+="<div class=\"col-sm-2\" ><button class=\"btn btn-warning\" type=\"button\" onclick=\"javascript:$(this).parents('.hlabel').remove()\"  >删除</button>";
        	hlable_parent_html+="</div> </div>";
        	$("#hlabel_div").append(hlable_parent_html);
        	$('.chosen-select').chosen();
            $(".chosen-select").trigger("chosen:updated");
        }
        
        function change_hlabel_pid(obj){
        	var pid=$(obj).val();
        	$.getJSON("${ctx}/manage/hlabel/queryByPid/"+pid,function(data){
        		var option_html="";
        		if(data.length>0){
        			for(var i=0;i<data.length;i++){
        				option_html+="<option value="+data[i].id+">"+data[i].name+"</option>";
        			}
        		}
        		$(obj).parents(".hlabel").find("[name='hlabel_id']").html(option_html);
        		$('.chosen-select').chosen();
                $(".chosen-select").trigger("chosen:updated");
        	})
        }
        
        function add_operater(){
        	var tag=parseInt($("#operater_div").find(".operater").last().attr("tag"))+1;
        	var operator_html="<div class=\"col-sm-3 operater\" tag="+tag+">";
        	operator_html+="<label class=\"col-sm-4 control-label\">术者"+tag+"</label>";
        	operator_html+="<div class=\"col-sm-5\">";
        	operator_html+="<input type=\"text\" class=\"form-control\" name=\"operater\" >";
        	operator_html+="</div>";
        	operator_html+="<div class=\"col-sm-2\"><button class=\"btn btn-warning\" type=\"button\" onclick=\"$(this).parents('.operater').remove()\">删除</button></div> </div>";
        	$("#operater_div").append(operator_html);
        }
    </script>
</body>

</html>