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
    <link href="${ctx}/statics/manage/plugins/uploadify/uploadify.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
</head>

<body>
    <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form action="" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="name" placeholder="部门名称" value="${depart.name }">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                <label class="col-sm-2 control-label">描述</label>

                                <div class="col-sm-9">
                                  <textarea class="form-control" id="description" name="description" placeholder="描述">${depart.description }</textarea>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                <label class="col-sm-2 control-label">排序</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="sort" placeholder="排序" value="${depart.sort }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">地址</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                    	<span class="input-group-addon">省</span>
		                                <select data-placeholder="选择省份..." class="chosen-select" tabindex="2" name="province">
		                                </select>
		                                <span class="input-group-addon">市</span>
		                                <select data-placeholder="选择城市..." class="chosen-select" tabindex="2" name="city">
		                                </select>
		                                <span class="input-group-addon">区</span>
		                                <select data-placeholder="选择区县..." class="chosen-select" tabindex="2" name="region">
		                                </select>
		                            </div>
	                                
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细地址</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="address" placeholder="详细地址" value="${depart.address }">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
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


    <div id="modal-map" class="modal fade" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-body">
	                    <div class="row">
	                        <div class="col-sm-12" id="allmap" style="height: 300px">
	                        	
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    <script src="${ctx}/statics/manage/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/statics/manage/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/statics/manage/js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <script src="${ctx}/statics/manage/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/statics/manage/js/plugins/switchery/switchery.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx}/statics/manage/plugins/layer/layer.js"></script>
    <script src="${ctx}/statics/manage/plugins/uploadify/jquery.uploadify.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js"></script>
    <script>
      $('.chosen-select').chosen();
       $(function(){
    		resetProvince();
    		$("[name='province']").change(function(){
    			resetCity($(this).val());
    		})
    		$("[name='city']").change(function(){
    			resetRegion($(this).val());
    		})
    	})
    	 function resetProvince(){
        	$("[name='province']").html("<option value=\"\">请选择省份</option>");
        	$.getJSON("${ctx}/manage/regions/1",function(data){
        		for(var i=0;i<data.length;i++){
        			$("[name='province']").append("<option value=\""+data[i].id+"\" hassubinfo=\"true\">"+data[i].name+"</option>");
        		}
        		$("[name='province']").val('${depart.province_id}');
        		$(".chosen-select").trigger("chosen:updated");
        		resetCity($("[name='province']").val());
    		})
        }
        function resetCity(province_id){
        	$("[name='city']").html("<option value=\"\">请选择城市</option>");
        	$(".chosen-select").trigger("chosen:updated");
        	if(province_id!=""){
        		$.getJSON("${ctx}/manage/regions/"+province_id,function(data){
	        		for(var i=0;i<data.length;i++){
	        			$("[name='city']").append("<option value=\""+data[i].id+"\" hassubinfo=\"true\">"+data[i].name+"</option>");
	        		}
	        		$("[name='city']").val('${depart.city_id}');
	        		$(".chosen-select").trigger("chosen:updated");
	        		resetRegion($("[name='city']").val());
	    		})
        	}else{
        		resetRegion($("[name='city']").val());
        	}
        }
        function resetRegion(city_id){
        	$("[name='region']").html("<option value=\"\">请选择区县</option>");
        	$(".chosen-select").trigger("chosen:updated");
       		$.getJSON("${ctx}/manage/regions/"+city_id,function(data){
        		for(var i=0;i<data.length;i++){
        			$("[name='region']").append("<option value=\""+data[i].id+"\" hassubinfo=\"true\">"+data[i].name+"</option>");
        		}
        		$("[name='region']").val('${depart.region_id}');
        		$(".chosen-select").trigger("chosen:updated");
    		})
        }
        function add(){
           var type=$("[name='type']:checked").val();
             $(".btn-primary").attr("disabled",true);//防止多次提交
			var params={"id":"${depart.id}","name":$("[name='name']").val(),
			            "description":$("#description").val(),"sort":$("[name='sort']").val(),
			            "province_id":$("[name='province']").val(),"province_name":$("[name='province'] option:selected").text(),
			            "city_id":$("[name='city']").val(),"city_name":$("[name='city'] option:selected").text(),
			            "region_id":$("[name='region']").val(),"region_name":$("[name='region'] option:selected").text(),
			            "address":$("[name='address']").val()
			            };
			
        	$.post("${ctx}/manage/depart/update",params,function(data){
					if(data.code=="0"){
						opt_success("修改成功",0);
					}else{
						opt_error("修改失败");
						  $(".btn-primary").attr("disabled",false);//防止多次提交
					}
				},"json")
        }
    </script>
</body>

</html>