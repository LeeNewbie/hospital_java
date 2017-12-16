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
    
    <title>病例</title>
    <meta name="keywords" content="后台bootstrap框架,后台HTML,响应式后台">
    <meta name="description" content="基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico">
	<link href="${ctx}/statics/manage/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/footable/footable.core.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/iCheck/custom.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>业务管理>随访表单</h5>

                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                        	<div class="ibox-tools" style="float:left;">
                        	<shiro:hasPermission name="manage:item:import">
                                <a class="btn btn-success btn-outline" onclick="javascript:$(this).next().find('input').click();"><i class="fa fa-cloud-upload"></i>批量导入</a>
                                <form id="importForm" enctype="multipart/form-data" method="post" style="display: none;">
                                	<input type="file" name="file" onchange="uploadExcel(this)"/>
                                </form>
                                </shiro:hasPermission>
                                <a class="btn btn-success btn-outline" onclick="javascript:location.href='${ctx}/statics/files/import_item.xlsx'"><i class="fa fa-file-excel-o"></i> EXCEL模板</a>
                            </div>
							<form action="${ctx }/manage/item/list" method="post" id="searchForm" class="pull-right" target='_self' style="width: 1050px">
		                        <div class="input-group">
		                            <input type="text" class="form-control input-sm" name="startDate" style="width: 200px" value="<fmt:formatDate value='${vo.startDate}' pattern='yyyy-MM-dd'/>" placeholder="随访开始日期">
		                        	<input type="text" class="form-control input-sm" name="endDate" style="width: 200px" value="<fmt:formatDate value='${vo.endDate}' pattern='yyyy-MM-dd'/>" placeholder="随访结束日期">
		                            <input type="text" class="form-control input-sm" name="startDate2" style="width: 200px" value="<fmt:formatDate value='${vo.startDate2}' pattern='yyyy-MM-dd'/>" placeholder="下周随访开始日期">
		                        	<input type="text" class="form-control input-sm" name="endDate2" style="width: 200px" value="<fmt:formatDate value='${vo.endDate2}' pattern='yyyy-MM-dd'/>" placeholder="下周随访结束日期">
		                            <input type="text" class="form-control input-sm" name="keywords" value="${vo.keywords}" style="width: 200px" placeholder="姓名，病历号，序列号">
		                            <input type="hidden" name="pageNo" value="${vo.pageNo }"/>
				      				<input type="hidden" name="pageSize" value="${vo.pageSize }">
				      				<input type="hidden" name="conn_id" value="${vo.conn_id }">
		                            <div class="input-group-btn">
		                                <button type="button" class="btn btn-sm btn-primary">搜索</button>
		                            </div>
		                        </div>
		                    </form>
                            <table class="footable table table-stripped toggle-arrow-tiny" data-sort="false" data-page-size="${vo.pageSize }">
                                <thead>
                                <tr>
                                	<th width="30"><input type="checkbox" class="i-checks" name="input"></th>
                                    <th>名称</th>
                                    <th>病历号</th>
                                    <th>机器序列号</th>
                                    <th>厂家</th>
                                    <th>型号</th>
                                    <th>术者</th>
                                    <th>随访日期</th>
                                    <th>下次随访日期</th>
                                    <th></th>
                                    <th width="130">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.result }" var="p">
                                <tr>
                                	<td><input type="checkbox" class="i-checks" name="input[]" value="${p.id }"></td>
                                     <td>${p.name }</td>
                                     <td>${p.sn}</td>
                                     <td>${p.machine_sn }</td>
                                     <td>${p.product_name }</td>
                                     <td>${p.product_number }</td>
                                     <td>${p.operater }</td>
                                     <td><fmt:formatDate value="${p.visit_date }" pattern="yyyy-MM-dd"/></td>
                                     <td><fmt:formatDate value="${p.next_date }" pattern="yyyy-MM-dd"/></td>
                                    <td>${p.mobile }</td>
                                    <td>
                                    	<shiro:hasPermission name="manage:item:update">
                                    	<a class="btn btn-xs btn-white" onclick="layer_show('修改','${ctx}/manage/item/update/${p.id }','','','true')"><i class="fa fa-pencil"></i> 修改</a>
                                    	</shiro:hasPermission>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="8" id="pagination"></td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    <script src="${ctx}/statics/manage/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/statics/manage/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx}/statics/manage/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/statics/manage/js/plugins/footable/footable.all.min.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/iCheck/icheck.min.js"></script>
     <script src="${ctx}/statics/manage/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="${ctx}/statics/manage/plugins/layer/layer.js"></script>
     <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js?v=1.0.0"></script>
    <script>
        $(document).ready(function(){$(".footable").footable();$("#pagination").html('${page.pageContent }');$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});pageinit();});
        $("[name='startDate'],[name='endDate'],[name='startDate2'],[name='endDate2']").datepicker({
         	format: "yyyy-mm-dd",
         	todayHighlight:true,
        		autoclose: true,
        		todayBtn: true,
         });
        
        function uploadExcel(o){
        	var fileName=$(o).val();
        	var suffix=fileName.substring(fileName.lastIndexOf(".")+1);
			if(fileName==""||!(suffix=="xls"||suffix=="xlsx")){
				layer.msg('请选择需导入的Excel文件', function(){});
		  		return false;
			}
			var index=layer.load(2);
			var options = {
				url : "${ctx}/manage/item/import/"+suffix,
				type : "post",
				dataType: "json",
				success : function(data) {
					layer.close(index); //关闭加载层
					if(data.code=="0"){
						opt_alert(data.msg);
					}else{
						opt_error(data.msg);
					}
				}
			};
			$("#importForm").ajaxSubmit(options);
			return false;
		}
    </script>
</body>

</html>