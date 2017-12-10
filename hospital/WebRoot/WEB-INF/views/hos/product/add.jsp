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
    <link href="${ctx}/statics/manage/css/plugins/chosen/chosen.css" rel="stylesheet">
   <link href="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/css/bootstrapValidator.css" rel="stylesheet">
</head>

<body>
    <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form action="" method="post" class="form-horizontal">
                         <div class="form-group">
                                <label class="col-sm-2 control-label">厂家</label>
                                   
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="name" required data-bv-notempty-message="厂家不能为空">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">型号</label>
                                   
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="number" required data-bv-notempty-message="型号不能为空">
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

    <script src="${ctx}/statics/manage/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/statics/manage/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/statics/manage/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/statics/manage/js/plugins/switchery/switchery.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx}/statics/manage/plugins/layer/layer.js"></script>
    <script src="${ctx}/statics/manage/js/plugins/sweetalert/sweetalert.min.js"></script>
   <script src="${ctx}/statics/manage/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js"></script>
    <script src="${ctx}/statics/manage/plugins/bootstrapvalidator-0.4.5/js/bootstrapValidator.js"></script>
    
    <script>
	    $(document).ready(function() {
	        $('form').bootstrapValidator();
	    });
        $('.chosen-select').chosen();
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
        $('.chosen-select').chosen();
        $(".chosen-select").trigger("chosen:updated");
        function add(){
        	var bootstrapValidator = $("form").data('bootstrapValidator');
	        bootstrapValidator.validate();
	        if(!bootstrapValidator.isValid())return;
        	$(".btn-primary").attr("disabled",true);
        	$.post("${ctx}/manage/product/add",{"name":$("[name='name']").val(),"number":$("[name='number']").val()},function(data){
        		if(data.code=="0"){
					opt_success("添加成功",0);
				}else if(data.code=="2"){
					opt_error("型号重复");
					$(".btn-primary").attr("disabled",false);
				}else{
					opt_error("添加失败");
					$(".btn-primary").attr("disabled",false);
				}
        	},"json")
        }
    </script>
</body>

</html>