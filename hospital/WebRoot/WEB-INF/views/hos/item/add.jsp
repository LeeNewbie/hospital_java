<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="${ctx}/statics/manage/plugins/uploadify/uploadify.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
   <link href="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/css/bootstrapValidator.css" rel="stylesheet">
    <style type="text/css">
      .invoice-table input{width: 80px;height: 30px}
     .myinput{height: 30px;width:80px;margin-right: 5px}
     .imagesdiv img{width:50px;height: 50px;margin-right: 5px;}
   </style>
</head>

<body>
    <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                     <form action="" method="post" class="form-horizontal">
                     <div class="gray-bg" id="order_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>随访产信息</h2>
                         <div class="form-group">
                                <label class="col-sm-2 control-label">病历号</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" value="${order.sn }" readonly="readonly">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="${order.name}" readonly="readonly">
                                </div>
                                <label class="col-sm-2 control-label">联系方式</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="${order.mobile}" readonly="readonly">
                                </div>
                                <label class="col-sm-2 control-label">植入日期</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="<fmt:formatDate value='${order.plant_date }' pattern='yyyy-MM-dd'/>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">植入品牌</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="${order.product_name}" readonly="readonly">
                                </div>
                                <label class="col-sm-2 control-label">植入型号</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="${order.product_number}" readonly="readonly">
                                </div>
                                <label class="col-sm-2 control-label">序列号</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  value="${order.machine_sn }" readonly="readonly">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">随访日期</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="visit_date">
                                </div>
                                <label class="col-sm-2 control-label">下次随访日期</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="next_date">
                                </div>
                            </div>
                      </div>
                      <!-- 检查 -->
                      <div class="gray-bg" id="item_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>检查</h2>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">囊袋情况</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="situation">
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="situation_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">心超</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="hreat_chao"/>&nbsp;否 
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="hreat_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">胸片</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="rabat"/>&nbsp;否 
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="rabat_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">心电图</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="elect"/>&nbsp;否 
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="elect_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">血检</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="blood"/>&nbsp;否 
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="blood_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">其他</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="have_other"/>&nbsp;否 
                                </div>
                                 <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="other">
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="other_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-4 imagesdiv"></div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">磁共振检查</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="magnet"/>&nbsp;否 
                                </div>
                                <div class="col-sm-2">
                                    <input class="fileInput" id="magnet_img" type="file" name="file" multiple="multiple" accept="image/*"/>
                                </div>
                                 <div class="col-sm-6 imagesdiv"></div>
                        </div>
                        
                        <div class="form-group">
                                <label class="col-sm-2 control-label">检查部位</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="check_location">
                                </div>
                                <div class="col-sm-2">
                                    <select class="form-control" name="check_unit">
                                           <option value="1">1.5T</option>
                                           <option value="2">3.0T</option>
                                    </select>
                                </div>
                        </div>
                        <div class="table-responsive m-t well" style="margin-left: 5%;width: 60%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr><th colspan="3"></th>
				                                	<th>心房</th>
				                                	<th>心室</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td>MRI模式</td>
				                                 <td><input type="text" name="mri_mode"></td>
				                                 <td>MRI脉冲振幅</td>
				                                 <td><input type="text"  name="mri_house">v</td>
				                                 <td><input type="text"  name="mri_room">v</td>
				                               </tr>
				                                <tr>
				                                 <td>MRI基本频率</td>
				                                 <td><input type="text"  name="mri_rate"></td>
				                                 <td>MRI脉宽</td>
				                                 <td><input type="text"  name="mri_width_house">ms</td>
				                                 <td><input type="text"  name="mri_width_room">ms</td>
				                               </tr>
				                               <tr>
				                                 <td>MRI起搏的AV期间</td>
				                                 <td><input type="text"  name="mri_period"></td>
				                                 <td>MRI脉冲装置</td>
				                                 <td><input type="text"  name="mri_set_house"></td>
				                                 <td><input type="text"  name="mri_set_room"></td>
				                               </tr>
				                            </tbody>
				                        </table>
				        </div>
				         <div class="form-group">
                                <label class="col-sm-2 control-label">距离植入时间大于6周</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="is_moresix"/>&nbsp;否 
                                </div>
                        </div>
                         <div class="form-group">
                                <label class="col-sm-2 control-label">无其他心脏硬件（适配器，扩展器，废弃电极导线）</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="is_hard"/>&nbsp;否 
                                </div>
                        </div>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">磁共振检查中心电监测</label>
                                <div class="col-sm-2">
                                                                                                      是&nbsp;<input type="checkbox" class="js-switch" name="is_check"/>&nbsp;否 
                                </div>
                        </div>
                         <div class="form-group">
                                <label class="col-sm-2 control-label">SAR值</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="sar">
                                </div>
                         </div>
                        <div class="table-responsive m-t well" style="margin-left: 5%;width: 60%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr><th colspan="2">磁共振检查前</th>
				                                	<th>阈值</th>
				                                	<th>感知</th>
				                                	<th>阻抗</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td></td>
				                                 <td>心房</td>
				                                 <td><input type="text"  name="before_house_yuzhi">v</td>
				                                 <td><input type="text"  name="before_house_feel">mv</td>
				                                 <td><input type="text"  name="before_house_forbid">Ω</td>
				                               </tr>
				                               <tr>
				                                 <td></td>
				                                 <td>心室</td>
				                                 <td><input type="text"  name="before_room_yuzhi">v</td>
				                                 <td><input type="text"  name="before_room_feel">mv</td>
				                                 <td><input type="text"  name="before_room_forbid">Ω</td>
				                               </tr>
				                                <tr><th colspan="2">磁共振检查后</th>
				                                	<th>阈值</th>
				                                	<th>感知</th>
				                                	<th>阻抗</th>
				                                </tr>
				                                 <tr>
				                                 <td></td>
				                                 <td>心房</td>
				                                 <td><input type="text"  name="after_house_yuzhi">v</td>
				                                 <td><input type="text"  name="after_house_feel">mv</td>
				                                 <td><input type="text" name="after_house_forbid">Ω</td>
				                               </tr>
				                               <tr>
				                                 <td></td>
				                                 <td>心室</td>
				                                 <td><input type="text"  name="after_room_yuzhi">v</td>
				                                 <td><input type="text"  name="after_room_feel">mv</td>
				                                 <td><input type="text" name="after_room_forbid">Ω</td>
				                               </tr>
				                            </tbody>
				                        </table>
				         </div>
				        <div class="hr-line-dashed"></div>
                             <div class="form-group">
                               <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="remark" ></textarea>
                                </div>
                             </div>
                      </div>
                      <!--brady设置  -->
                      <div class="gray-bg" id="brady_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>Brady设置</h2>
                         <div class="form-group">
                                <label class="col-sm-1 control-label">工作模式</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="work_mode">
                                </div>
                                <label class="col-sm-1 control-label">基本频率（bpm）</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="basic_rate">
                                </div>
                                <label class="col-sm-1">上线频率（bpm）</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="up_rate">
                                </div>
                                <label class="col-sm-1 control-label">休息/睡眠频率（bpm）</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="rest_rate">
                                </div>
                                <label class="col-sm-1 control-label">滞后频率（bpm）</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="late_rate">
                                </div>
                         </div>
                         <div class="form-group">
                                <label class="col-sm-2 control-label">起搏的AV</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="qibo_av">
                                </div>
                                <label class="col-sm-1 control-label">感知的AV</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="feel_av">
                                </div>
                                <label class="col-sm-1">A-V期间管理</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control"  name="av_period">
                                </div>
                         </div>
                         <div class="table-responsive m-t well" style="margin-left: 5%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr><th></th>
				                                    <th>输出</th>
				                                	<th>脉宽</th>
				                                	<th>阈值管理</th>
				                                	<th>感知灵敏度</th>
				                                	<th>感知保障</th>
				                                	<th>阻抗监测的极性识别</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td></td>
				                                 <td>心房</td>
				                                 <td><input type="text"  name="hreat_out"></td>
				                                 <td><input type="text"  name="hreat_width"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="hreat_yuzhi"/>&nbsp;否 </td>
				                                 <td><input type="text"  name="hreat_sensive"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="hreat_feel"/>&nbsp;否 </td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="hreat_forbid"/>&nbsp;否 </td>
				                               </tr>
				                                <tr>
				                                 <td></td>
				                                 <td>心房</td>
				                                 <td><input type="text"  name="right_out"></td>
				                                 <td><input type="text"  name="right_width"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="right_yuzhi"/>&nbsp;否 </td>
				                                 <td><input type="text"  name="right_sensive"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="right_feel"/>&nbsp;否 </td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="right_forbid"/>&nbsp;否 </td>
				                               </tr>
				                                <tr>
				                                 <td></td>
				                                 <td>心房</td>
				                                 <td><input type="text" name="left_out"></td>
				                                 <td><input type="text"  name="left_width"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="left_yuzhi"/>&nbsp;否 </td>
				                                 <td><input type="text"  name="left_sensive"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="left_feel"/>&nbsp;否 </td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="left_forbid"/>&nbsp;否 </td>
				                               </tr>
				                            </tbody>
				                        </table>
				         </div>
                      </div>
                      <!-- ICD设置 -->
                        <!--icd设置  -->
                      <div class="gray-bg" id="icd_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>ICD设置</h2>
                        <div class="table-responsive m-t well" style="margin-left: 5%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr><th colspan="3"></th>
				                                    <th>频率</th>
				                                	<th>识别区间</th>
				                                	<th>鉴别诊断</th>
				                                	<th>治疗方案</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td>VT-1</td>
				                                 <td><input type="text"  name="vt1_name"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="vt1_ison"/>&nbsp;否</td>
				                                 <td><input type="text" name="vt1_rate"></td>
				                                 <td><input type="text"  name="vt1_period"></td>
				                                 <td><input type="text"  name="vt1_identify"></td>
				                                 <td><input type="text"  name="vt1_scheme"></td>
				                               </tr>
				                                <tr>
				                                <td>VT-2</td>
				                                 <td><input type="text"  name="vt2_name"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="vt2_ison"/>&nbsp;否</td>
				                                 <td><input type="text"  name="vt2_rate"></td>
				                                 <td><input type="text"  name="vt2_period"></td>
				                                 <td><input type="text"  name="vt2_identify"></td>
				                                 <td><input type="text"  name="vt2_scheme"></td>
				                               </tr>
				                                <tr>
				                                <td>VF</td>
				                                 <td><input type="text"  name="vf_name"></td>
				                                 <td>是&nbsp;<input type="checkbox" class="js-switch" name="vf_ison"/>&nbsp;否</td>
				                                 <td><input type="text" name="vf_rate"></td>
				                                 <td><input type="text"  name="vf_period"></td>
				                                 <td><input type="text" name="vf_identify"></td>
				                                 <td><input type="text" name="vf_scheme"></td>
				                               </tr>
				                            </tbody>
				                        </table>
				         </div>
                      </div>
                         <!--CRT设置  -->
                      <div class="gray-bg" id="crt_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>CRT设置</h2>
                        <div class="form-group">
                                <label class="col-sm-2 control-label">CRT左室向量是否改变</label>
                                <div class="col-sm-2">
                                                                                                       是&nbsp;<input type="checkbox" class="js-switch" name="crt_ischange"/>&nbsp;否
                                </div>
                                <label class="col-sm-1 control-label">左室向量</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="crt_left">
                                </div>
                                 <label class="col-sm-1 control-label">SAV/PAV</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="crt_sav">
                                </div>
                                 <label class="col-sm-1 control-label">VV期间</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="crt_period">
                                </div>
                                <label class="col-sm-1 control-label">QRS宽度</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="crt_width">
                                </div>
                         </div>
                     </div>
                     
                         <!--诊断图表  -->
                      <div class="gray-bg" id="diagnose_div" style="padding: 20px 0px;margin-bottom: 20px">
                        <h2>诊断图表</h2>
                        <div class="table-responsive m-t well" style="margin-left: 5%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr><th>AP</th>
				                                    <th>VP</th>
				                                	<th>BP</th>
				                                	<th>AS-VP</th>
				                                	<th>AS-VS</th>
				                                	<th>AP-VP</th>
				                                	<th>AP-VS</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td><input type="text"  name="ap"></td>
				                                 <td><input type="text"  name="vp"></td>
				                                 <td><input type="text"  name="bp"></td>
				                                 <td><input type="text"  name="asvp"></td>
				                                 <td><input type="text"  name="asvs"></td>
				                                 <td><input type="text"  name="apvp"></td>
				                                 <td><input type="text"  name="apvs"></td>
				                               </tr>
				                               <tr>
				                                <td>pvc</td>
				                               </tr>
				                               <tr>
				                                <td><input type="text"  name="pvc"></td>
				                               </tr>
				                                <tr>
				                                  <td>AMS事件</td>
				                                  <td>模式转换</td>
				                                  <td>AT/AF 负荷</td>
				                               </tr>
				                                <tr>
				                                <td><input type="text"  name="ams"></td>
				                                 <td><input type="text"  name="exchange"></td>
				                                 <td><input type="text" name="ataf"></td>
				                               </tr>
				                               <tr>
				                                <td>vsr</td>
				                               </tr>
				                               <tr>
				                                <td><input type="text" name="vsr"></td>
				                               </tr>
				                            </tbody>
				                        </table>
				         </div>
                    </div>
                    
                     <!--参数测试  -->
                    <div class="gray-bg" id="test_div" style="padding: 20px 0px;margin-bottom: 20px">
                      <h2>参数测试</h2>
                      <div class="form-group">
                                <label class="col-sm-1 control-label">预估寿命</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="predict_life">
                                </div>
                                <label class="col-sm-1 control-label">电池电压</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="elect_press">
                                </div>
                                <label class="col-sm-1 control-label">电池内阻</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="elect_forbid">
                                </div>
                                <label class="col-sm-1 control-label">充电时间</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="elect_time">
                                </div>
                                <label class="col-sm-1 control-label">自身心率</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="self_rate">
                                </div>
                                <label class="col-sm-1 control-label">磁铁频率</label>
                                <div class="col-sm-1">
                                    <input type="text" class="form-control"  name="magnet_rate">
                                </div>
                           </div>
                       <div class="table-responsive m-t well" style="margin-left: 5%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr>
				                                	<th></th>
				                                	<th>阈值</th>
				                                	<th>脉宽</th>
				                                	<th>感知</th>
				                                	<th>远场感知</th>
				                                	<th>阻抗</th>
				                                	<th>高压阻抗</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                               <tr>
				                                 <td>心房</td>
				                                 <td><input type="text"  name="hreat_test_yuzhi"></td>
				                                 <td><input type="text"  name="hreat_test_width"></td>
				                                 <td><input type="text"  name="hreat_test_feel"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="hreat_test_isfar"/>&nbsp;否</td>
				                               	 <td><input type="text"  name="hreat_test_forbid"></td>
				                               </tr>
				                                <tr>
				                                 <td>右室</td>
				                                 <td><input type="text"  name="right_test_yuzhi"></td>
				                                 <td><input type="text"  name="right_test_width"></td>
				                                 <td><input type="text"  name="right_test_feel"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="right_test_isfar"/>&nbsp;否</td>
				                               	 <td><input type="text" name="right_test_forbid"></td>
				                               	 <td><input type="text"  name="right_test_hign"></td>
				                               </tr>
				                                <tr>
				                                 <td>左室</td>
				                                 <td><input type="text"  name="left_test_yuzhi"></td>
				                                 <td><input type="text"  name="left_test_width"></td>
				                                 <td><input type="text"  name="left_test_feel"></td>
				                                 <td>有&nbsp;<input type="checkbox" class="js-switch" name="left_test_isfar"/>&nbsp;否</td>
				                               	 <td><input type="text"  name="left_test_forbid"></td>
				                               </tr>
				                            </tbody>
				                        </table>
				           </div>
                   </div>
                   
                   <!-- HIS测试 -->
                       <div class="gray-bg" style="padding: 20px 0px;margin-bottom: 20px">
                          <h2>HIS测试</h2>
                           <div class="form-group">
                             <label class="col-sm-2 control-label">HBP接口位置</label>
                              <div class="col-sm-2">
                                  <input type="text" class="form-control" name="hbp_location">
                              </div>
                            </div>
                           
                           <button class="btn btn-info" type="button" onclick="addhistest()" style="margin-left: 50px">添加</button>
                           <div class="form-group" id="histest_div">
                            <div class="col-sm-6 histest" >
                                  <div class="table-responsive m-t well" style="margin-left: 5%;" >
			                        <table class="table invoice-table">
			                            <thead>
			                                <tr>
			                                    <th></th>
			                                	<th><select class="form-control"  name="histest_type" >
				                                         <option value="1">单极</option>
				                                         <option value="2">双极</option>
				                                  </select></th>
			                                	<th><button class="btn btn-warning" type="button" onclick="javascript:$(this).parents('.histest').remove()">删除</button></th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                               <tr>
			                                 <td>脉宽</td>
			                                 <td><input  type="text" name="yuzhi_width">&nbsp;&nbsp;ms</td>
			                               <tr>
			                                 <td>Select阈值</td>
			                                 <td><input  type="text" name="yuzhi">&nbsp;&nbsp;v</td>
			                               </tr>
			                               <tr>
			                                 <td>Non-Selected阈值</td>
			                                 <td><input  type="text" name="noyuzhi">&nbsp;&nbsp;v</td>
			                               </tr>
			                               <tr>
			                                 <td>H-V间期</td>
			                                 <td><input  type="text" name="hv_interval"></td>
			                               </tr>
			                               <tr>
			                                 <td>HBP QRS宽度</td>
			                                 <td><input  type="text" name="hpb_width"></td>
			                               </tr>
			                            </tbody>
			                        </table>
			                        </div>
                            </div>
                           </div>
                           <div class="form-group">
                             <label class="col-sm-1 control-label">HBP</label>
                                  <input type="text" class="myinput" name="hbp1">bpm
                                  <input type="text" class="myinput" name="hbp2">  v
                                  <input type="text" class="myinput" name="hbp3">ms
                           </div>
                           <div class="form-group">
                             <label class="col-sm-1 control-label">HP%</label>
                              <div class="col-sm-2">
                                  <input type="text" class="form-control"  name="hp_percent">
                              </div>
                           </div>
                           <div class="form-group">
                             <label class="col-sm-1 control-label">心超</label>
                           </div>
                           <div class="form-group">
                               <label class="col-sm-1 control-label"></label>
                             VLEF <input type="text" class="myinput"  name="lvef">
                             LVESV <input type="text"  class="myinput"   name="lvesv">
                             LVEDD  <input type="text"  class="myinput"   name="lvedd">
                           </div>
                           <div class="form-group">
                               <label class="col-sm-1 control-label"></label>
                             RVD1 <input type="text" class="myinput"  name="rvd1">
                             RVD2 <input type="text"  class="myinput"   name="rvd2">
                             RVD3  <input type="text"  class="myinput"   name="rvd3">
                             RVD area  <input type="text"  class="myinput"   name="rvd_area">
                           </div>
                           <div class="form-group">
                               <label class="col-sm-1 control-label"></label>
                             RVFAC <input type="text" class="myinput"  name="rvfac">
                             TAPSE <input type="text"  class="myinput"   name="tapse">
                             RVS  <input type="text"  class="myinput"   name="rvs">
                             RVIVV  <input type="text"  class="myinput"   name="rvivv">
                             RVIVA  <input type="text"  class="myinput"   name="rviva">
                             mid-RV strain  <input type="text"  class="myinput"   name="mid_rv">
                             mid-RV SR  <input type="text"  class="myinput"   name="mid_rvsr">
                           </div>
                       </div>
                    <!--  -->
                    
                  <!-- 标签信息 -->
                    <div class="gray-bg"  style="padding: 20px 0px;margin-bottom: 20px">
                       <h2>标签信息
                            <button class="btn btn-info" type="button" onclick="add_hlable_one()">添加一级标签</button>
                            <button class="btn btn-info" type="button" onclick="add_hlable_two()">添加二级标签</button>
                       </h2>
                      
                        <div class="form-group" id="hlabel_div">
                          
                     </div>
                    </div>
                    
                     <!-- 参数调整 -->
                    <div class="gray-bg"  style="padding: 20px 0px;margin-bottom: 20px">
                       <h2>参数调整</h2>
                       <div class="form-group">
                               <label class="col-sm-1 control-label">参数调整</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="ajust_remark" ></textarea>
                                </div>
                        </div>
                    </div>
                    
                      <!-- 事件记录 -->
                    <div class="gray-bg"  style="padding: 20px 0px;margin-bottom: 20px">
                       <h2>事件记录   <button class="btn btn-info" type="button" onclick="add_record()">添加</button>
                       </h2>
                       <div class="form-group">
                              <label class="col-sm-2">内容记录</label>
                              <label class="col-sm-2 ">处理方法</label>
                              <label class="col-sm-2">处理结果</label>
                        </div>
                        <div id="records">
                           <!-- recode记录 -->
                        </div>
                    </div>
                    
                      <!-- 药物调增 -->
                    <div class="gray-bg"  style="padding: 20px 0px;margin-bottom: 20px">
                       <h2>药物调增   <button class="btn btn-info" type="button" onclick="add_drug()">添加</button>
                       </h2>
                      
                        <div id="drugs">
                           <div class="table-responsive m-t well" style="margin-left: 5%;border: none" >
				                        <table class="table invoice-table">
				                            <thead>
				                                <tr>
				                                	<th>药名</th>
				                                	<th>剂量</th>
				                                	<th>单位</th>
				                                	<th>用法</th>
				                                	<th>频度</th>
				                                	<th>起始时间</th>
				                                	<th>结束时间</th>
				                                	<th></th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            </tbody>
				                        </table>
				           </div>
                        </div>
                    </div>
                     
                     
                      
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4" style="text-align: center;">
                                    <button class="btn btn-primary" type="button" onclick="add()">保存内容</button>
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
    <script src="${ctx}/statics/manage/plugins/uploadify/jquery.uploadify.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js"></script>
    <script src="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/js/bootstrapValidator.js"></script>
    
    <script>
	    $(document).ready(function() {
	        $('form').bootstrapValidator();
	        imgload();
	    });
        $('.chosen-select').chosen();
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
        $('.chosen-select').chosen();
        $(".chosen-select").trigger("chosen:updated");
        $("[name='visit_date'],[name='next_date'],[name='start_date'],[name='end_date']").datepicker({
        	format: "yyyy-mm-dd",
        	todayHighlight:true,
       		autoclose: true,
       		todayBtn: true,
        });
        function imgload(){
          $(".fileInput").each(function(){
               var imageUploadify_id=$(this).attr("id");
		        $("#"+imageUploadify_id).uploadify({
		        	'buttonImage':'${ctx}/statics/manage/plugins/uploadify/uploadify-button.png',
			        'swf': '${ctx}/statics/manage/plugins/uploadify/uploadify.swf',
			        'uploader':'${ctx}/upload',
			        'onFallback' : function() {//检测FLASH失败调用 
			        	alert("您未安装FLASH控件，无法上传文件！请安装FLASH控件后再试。");  
			        },  
			        'onUploadSuccess':function(file, data, response){
			         var img_name=file.name;
		                var jsonData = jQuery.parseJSON(data);
		                $("#"+imageUploadify_id).parents(".form-group").find(".imagesdiv").append("<img onclick=\"$(this).remove()\" src="+jsonData.msg+">");
		        	}
			    });
          })
        }
        function add(){
        	var bootstrapValidator = $("form").data('bootstrapValidator');
	        bootstrapValidator.validate();
	        if(!bootstrapValidator.isValid())return;
        	$(".btn-primary").attr("disabled",true);
        	var hreat_yuzhi=0,hreat_feel=0,hreat_forbid=0,right_yuzhi=0,right_feel=0,right_forbid=0,left_yuzhi=0,left_feel=0,left_forbid=0;
        	if($("[name='hreat_yuzhi']").is(":checked"))hreat_yuzhi=1;
        	if($("[name='hreat_feel']").is(":checked"))hreat_feel=1;
        	if($("[name='hreat_forbid']").is(":checked"))hreat_forbid=1;
        	if($("[name='right_yuzhi']").is(":checked"))right_yuzhi=1;
        	if($("[name='right_feel']").is(":checked"))right_feel=1;
        	if($("[name='right_forbid']").is(":checked"))right_forbid=1;
        	if($("[name='left_yuzhi']").is(":checked"))left_yuzhi=1;
        	if($("[name='left_feel']").is(":checked"))left_feel=1;
        	if($("[name='left_forbid']").is(":checked"))left_forbid=1;
        	var brady={"work_mode":$("[name='work_mode']").val(),"basic_rate":$("[name='basic_rate']").val(),"up_rate":$("[name='up_rate']").val(),"rest_rate":$("[name='rest_rate']").val(),"late_rate":$("[name='late_rate']").val(),
        			"qibo_av":$("[name='qibo_av']").val(),"feel_av":$("[name='feel_av']").val(),"av_period":$("[name='av_period']").val(),
        			"hreat_out":$("[name='hreat_out']").val(),"hreat_width":$("[name='hreat_width']").val(),"hreat_yuzhi":hreat_yuzhi,"hreat_sensive":$("[name='hreat_sensive']").val(),"hreat_feel":hreat_feel,"hreat_forbid":hreat_forbid,
        			"right_out":$("[name='right_out']").val(),"right_width":$("[name='right_width']").val(),"right_yuzhi":right_yuzhi,"right_sensive":$("[name='right_sensive']").val(),"right_feel":right_feel,"right_forbid":right_forbid,
        			"left_out":$("[name='left_out']").val(),"left_width":$("[name='left_width']").val(),"left_yuzhi":left_yuzhi,"left_sensive":$("[name='left_sensive']").val(),"left_feel":left_feel,"left_forbid":left_forbid,
        	};
        	var vt1_ison=0,vt2_ison=0,vf_ison=0,crt_ischange=0;
        	if($("[name='vt1_ison']").is(":checked"))vt1_ison=1;
        	if($("[name='vt2_ison']").is(":checked"))vt2_ison=1;
        	if($("[name='vf_ison']").is(":checked"))vf_ison=1;
        	if($("[name='crt_ischange']").is(":checked"))crt_ischange=1;
        	var icd={"vt1_name":$("[name='vt1_name']").val(),"vt1_ison":vt1_ison,"vt1_rate":$("[name='vt1_rate']").val(),"vt1_period":$("[name='vt1_period']").val(),"vt1_identify":$("[name='vt1_identify']").val(),"vt1_scheme":$("[name='vt1_scheme']").val(),
        			"vt2_name":$("[name='vt2_name']").val(),"vt2_ison":vt1_ison,"vt2_rate":$("[name='vt2_rate']").val(),"vt2_period":$("[name='vt2_period']").val(),"vt2_identify":$("[name='vt2_identify']").val(),"vt2_scheme":$("[name='vt2_scheme']").val(),
        			"vf_name":$("[name='vf_name']").val(),"vf_ison":vf_ison,"vf_rate":$("[name='vf_rate']").val(),"vf_period":$("[name='vf_period']").val(),"vf_identify":$("[name='vt1_identify']").val(),"vf_scheme":$("[name='vt1_scheme']").val(),
        			"crt_ischange":crt_ischange,"crt_left":$("[name='crt_left']").val(),"crt_sav":$("[name='crt_sav']").val(),"crt_period":$("[name='crt_period']").val(),"crt_width":$("[name='crt_width']").val()
        	};
        	var diagnose={"ap":$("[name='ap']").val(),"vp":$("[name='vp']").val(),"bp":$("[name='bp']").val(),"asvp":$("[name='asvp']").val(),"asvs":$("[name='asvs']").val(),"apvp":$("[name='apvp']").val(),"apvs":$("[name='apvs']").val(),
        			"pvc":$("[name='pvc']").val(),	"ams":$("[name='ams']").val(),"exchange":$("[name='exchange']").val(),	"ataf":$("[name='ataf']").val(),"vsr":$("[name='vsr']").val()	  
        	}
        	var hreat_test_isfar=0,right_test_isfar=0,left_test_isfar=0;
        	if($("[name='hreat_test_isfar']").is(":checked"))hreat_test_isfar=1;
        	if($("[name='right_test_isfar']").is(":checked"))right_test_isfar=1;
        	if($("[name='left_test_isfar']").is(":checked"))left_test_isfar=1;
        	var test={"predict_life":$("[name='predict_life']").val(),"elect_press":$("[name='elect_press']").val(),"elect_forbid":$("[name='elect_forbid']").val(),"elect_time":$("[name='elect_time']").val(),"self_rate":$("[name='self_rate']").val(),"magnet_rate":$("[name='magnet_rate']").val(),
        		"hreat_test_yuzhi":$("[name='hreat_test_yuzhi']").val(),"hreat_test_width":$("[name='hreat_test_width']").val(),"hreat_test_feel":$("[name='hreat_test_feel']").val(),"hreat_test_isfar":hreat_test_isfar,"hreat_test_forbid":$("[name='hreat_test_forbid']").val(),
        		"right_test_yuzhi":$("[name='right_test_yuzhi']").val(),"right_test_width":$("[name='right_test_width']").val(),"right_test_feel":$("[name='right_test_feel']").val(),"right_test_isfar":right_test_isfar,"right_test_forbid":$("[name='right_test_forbid']").val(),"right_test_hign":$("[name='right_test_hign']").val(),
        		"left_test_yuzhi":$("[name='left_test_yuzhi']").val(),"left_test_width":$("[name='left_test_width']").val(),"left_test_feel":$("[name='left_test_feel']").val(),"left_test_isfar":left_test_isfar,"left_test_forbid":$("[name='left_test_forbid']").val(),
        		"hbp_location":$("[name='hbp_location']").val(),"hbp1":$("[name='hbp1']").val(),"hbp2":$("[name='hbp2']").val(),"hbp3":$("[name='hbp3']").val(),"hp_percent":$("[name='hp_percent']").val(),
        		"lvef":$("[name='lvef']").val(),"lvesv":$("[name='lvesv']").val(),"lvedd":$("[name='lvedd']").val(),
        		"rvd1":$("[name='rvd1']").val(),"rvd2":$("[name='rvd2']").val(),"rvd3":$("[name='rvd3']").val(),"rvd_area":$("[name='rvd_area']").val(),
        		"rvfac":$("[name='rvfac']").val(),"tapse":$("[name='tapse']").val(),"rvs":$("[name='rvs']").val(),"rvivv":$("[name='rvivv']").val(),
        		"rviva":$("[name='rviva']").val(),"mid_rv":$("[name='mid_rv']").val(),"mid_rvsr":$("[name='mid_rvsr']").val()
        		
        	}
        	var histests=[];
        	 $("#histest_div .histest").each(function(){
        		 histests.push({"type":$(this).find("[name='histest_type']").val(),"yuzhi":$(this).find("[name='yuzhi']").val(),"yuzhi_width":$(this).find("[name='yuzhi_width']").val(),
        			 "noyuzhi":$(this).find("[name='noyuzhi']").val(), "hv_interval":$(this).find("[name='hv_interval']").val(), 
        			 "hpb_width":$(this).find("[name='hpb_width']").val(), "is_damage":0
        		 })
        	 
        	 })
        	 var orderhlabels=[];
        	 $("#hlabel_div .hlabel").each(function(){
        		 orderhlabels.push({"hlabel_pid":$(this).find("[name='hlabel_pid']").val(),"hlabel_id":$(this).find("[name='hlabel_id']").val()})
        	 });
        	 
        	 var records=[];
        	 $("#records .record").each(function(){
        		 records.push({"content":$(this).find("[name='content']").val(),"method":$(this).find("[name='method']").val(),"result":$(this).find("[name='result']").val()})
        	 });
        	 
        	 var drugs=[];
        	 $("#drugs tbody tr").each(function(){
        		 drugs.push({"name":$(this).find("[name='name']").val(),"num":$(this).find("[name='num']").val(),"unit":$(this).find("[name='unit']").val(),"use_usage":$(this).find("[name='use_usage']").val(),
        			 "rate":$(this).find("[name='rate']").val(),"start_date":$(this).find("[name='start_date']").val(),"end_date":$(this).find("[name='end_date']").val()
        			 })
        	 });
        	
			var hreat_chao=0,rabat=0,elect=0,blood=0,have_other=0,magnet=0,is_moresix=0,is_hard=0,is_check=0;
			if($("[name='hreat_chao']").is(":checked"))hreat_chao=1;
			if($("[name='rabat']").is(":checked"))have_other=1;
			if($("[name='elect']").is(":checked"))elect=1;
			if($("[name='blood']").is(":checked"))blood=1;
			if($("[name='have_other']").is(":checked"))have_other=1;
			if($("[name='magnet']").is(":checked"))magnet=1;
			if($("[name='is_moresix']").is(":checked"))is_moresix=1;
			if($("[name='is_hard']").is(":checked"))is_hard=1;
			if($("[name='is_check']").is(":checked"))is_check=1;
			var situation_img=[];
			$("#situation_img").parents(".form-group").find(".imagesdiv img").each(function(){
			     situation_img.push($(this).attr("src"));
			})
			var hreat_img=[];
			$("#hreat_img").parents(".form-group").find(".imagesdiv img").each(function(){
				hreat_img.push($(this).attr("src"));
			})
			var rabat_img=[];
			$("#rabat_img").parents(".form-group").find(".imagesdiv img").each(function(){
				rabat_img.push($(this).attr("src"));
			})
			var elect_img=[];
			$("#elect_img").parents(".form-group").find(".imagesdiv img").each(function(){
				elect_img.push($(this).attr("src"));
			})
			var blood_img=[];
			$("#blood_img").parents(".form-group").find(".imagesdiv img").each(function(){
				blood_img.push($(this).attr("src"));
			})
			var other_img=[];
			$("#other_img").parents(".form-group").find(".imagesdiv img").each(function(){
				other_img.push($(this).attr("src"));
			})
			var magnet_img=[];
			$("#magnet_img").parents(".form-group").find(".imagesdiv img").each(function(){
				magnet_img.push($(this).attr("src"));
			})
        	var params={"order_id":"${order.id}","visit_date":$("[name='visit_date']").val(),"next_date":$("[name='next_date']").val(),"situation":$("[name='situation']").val(),"situation_img":situation_img.toString(),
        		"hreat_chao":hreat_chao,"hreat_img":hreat_img.toString(),"rabat":rabat,"rabat_img":rabat_img.toString(),"elect":elect,"elect_img":elect_img.toString(),"blood":blood,"blood_img":blood_img.toString(),"have_other":have_other,"other":$("[name='other']").val(),"other_img":other_img.toString(),"magnet":magnet,"magnet_img":magnet_img.toString(),"check_location":$("[name='check_location']").val(),
        		"check_unit":$("[name='check_unit']").val(),"mri_mode":$("[name='mri_mode']").val(),"mri_house":$("[name='mri_house']").val(),"mri_room":$("[name='mri_room']").val(),
        		"mri_rate":$("[name='mri_rate']").val(),"mri_width_house":$("[name='mri_width_house']").val(),"mri_width_room":$("[name='mri_width_room']").val(),	
        		"mri_period":$("[name='mri_period']").val(),"mri_set_house":$("[name='mri_set_house']").val(),"mri_set_room":$("[name='mri_set_room']").val(),
        		"is_moresix":is_moresix,"is_hard":is_hard,"is_check":is_check,"sar":$("[name='sar']").val(),
        		"before_house_yuzhi":$("[name='before_house_yuzhi']").val(),"before_house_feel":$("[name='before_house_feel']").val(),"before_house_forbid":$("[name='before_house_forbid']").val(),
        		"before_room_yuzhi":$("[name='before_room_yuzhi']").val(),"before_room_feel":$("[name='before_room_feel']").val(),"before_room_forbid":$("[name='before_room_forbid']").val(),
        		"after_house_yuzhi":$("[name='after_house_yuzhi']").val(),"after_house_feel":$("[name='after_house_feel']").val(),"after_house_forbid":$("[name='after_house_forbid']").val(),
        		"after_room_yuzhi":$("[name='after_room_yuzhi']").val(),"after_room_feel":$("[name='after_room_feel']").val(),"after_room_forbid":$("[name='after_room_forbid']").val(),
        		"remark":$("[name='remark']").val(),"ajust_remark":$("[name='ajust_remark']").val(),
        		"brady":brady,"icd":icd,"diagnose":diagnose,"test":test,"histests":histests,"orderhlabels":orderhlabels,
        		"records":records,"drugs":drugs
        		}
        	$.ajax({
				url:"${ctx}/manage/item/add",
				type: "POST",
				data: JSON.stringify(params),
				success: function(data){
					if(data.code=="0"){
					   opt_success("添加成功",0);
					}else{
					    $(".btn-primary").attr("disabled",false);
						opt_error(data.msg);
					}
				},
				dataType: "json",
				contentType: "application/json"
			});
        }
        //添加his测试
        function addhistest(){
        	$("#histest_div").append(addhistest_html);
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
          html+="</tbody></table></div></div>";
          addhistest_html=html;
        })
        
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
        
        function add_record(){
        	var record_html="<div class=\"form-group record\">";
        	      record_html+="<div class=\"col-sm-2\">";
        	    	  record_html+="<input type=\"text\" class=\"form-control\"  name=\"content\"></div>";
        	    record_html+="<div class=\"col-sm-2\">";
        	    	  record_html+="<input type=\"text\" class=\"form-control\"  name=\"method\"></div>";
        	     record_html+="<div class=\"col-sm-2\">";
        	    	  record_html+="<input type=\"text\" class=\"form-control\"  name=\"result\"></div>";
        	    record_html+="<div class=\"col-sm-1\"><button class=\"btn btn-warning\" type=\"button\" onclick=\"$(this).parents('.record').remove()\">删除</button></div>";
          record_html+="</div>";
          $("#records").append(record_html);
        }
        function add_drug(){
        	var drug_html="<tr><td><input type=\"text\"  name=\"name\"></td>";
              drug_html+="<td><input type=\"text\"  name=\"num\"></td>";
              drug_html+="<td><select class=\"form-control\" name=\"unit\">";
                drug_html+=" <option value=\"1\">mg</option>";
                drug_html+=" <option value=\"2\">g</option></select></td>";
              drug_html+=" <td><select class=\"form-control\" name=\"use_usage\">";
                 drug_html+=" <option value=\"1\">口服</option>";
                 drug_html+=" <option value=\"2\">日服</option></select></td>";
             drug_html+="<td> <select class=\"form-control\" name=\"rate\">";
                drug_html+="<option value=\"1\">每日一次</option>";
                drug_html+="<option value=\"2\">每日三次</option></select></td>";
             drug_html+="<td><input type=\"text\"  name=\"start_date\"></td>";
             drug_html+="<td><input type=\"text\"  name=\"end_date\"></td>";
             drug_html+="<td><button class=\"btn btn-warning\" type=\"button\" onclick=\"$(this).parents('tr').remove()\">删除</button><td></tr>"
             
         $("#drugs tbody").append(drug_html);
             $("[name='visit_date'],[name='next_date'],[name='start_date'],[name='end_date']").datepicker({
             	format: "yyyy-mm-dd",
             	todayHighlight:true,
            		autoclose: true,
            		todayBtn: true,
             });
        }
    </script>
</body>

</html>