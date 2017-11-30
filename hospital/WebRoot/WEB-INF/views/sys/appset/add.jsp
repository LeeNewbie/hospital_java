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
    

    <title>智行家</title>
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
                                    <input type="text" class="form-control" name="name" placeholder="名称">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">图片</label>

                                <div class="col-sm-9">
                                    <input class="fileInput" id="imageUploadify" type="file" name="file" multiple="multiple" accept="image/*"/>
                                    <div class="imageImg" style="display:none;">   
							             <img src="" style="width: 60px;height: 60px">
							         </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">功能</label>
                                <div class="col-sm-9">
                                    <div class="radio radio-success radio-inline">
                                        <input type="radio" id="method1" value="0" name="method" checked="">
                                        <label for="method1"> 打开App功能 </label>
                                    </div>
                                    <div class="radio radio-success radio-inline">
                                        <input type="radio" id="method2" value="1" name="method">
                                        <label for="method2"> 打开H5链接 </label>
                                    </div>
                                    <div class="radio radio-success radio-inline">
                                        <input type="radio" id="method3" value="2" name="method">
                                        <label for="method3"> 打开自定义内容 </label>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" id="directDiv">
                                <label class="col-sm-2 control-label">代码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="direct" placeholder="App定制功能，请咨询开发部门">
                                </div>
                            </div>
                            <div class="form-group" id="urlDiv" style="display:none;">
                                <label class="col-sm-2 control-label">链接</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="url" placeholder="链接">
                                </div>
                            </div>
                            <div class="form-group" id="contentDiv" style="display:none;">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9">
                                    <script type="text/plain" id="content">
    		   	  					</script>
                                </div>
                            </div>
                            <shiro:hasPermission name="manage:advert:addStart">
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4" style="text-align: center;">
                                    <button class="btn btn-primary" type="button" onclick="add()">保存内容</button>
                                    <button class="btn btn-white" type="button" onclick="layer_close()">取消</button>
                                </div>
                            </div>
                            </shiro:hasPermission>
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
    <script src="${ctx}/statics/manage/js/jquery.form.js"></script>
    <script src="${ctx}/statics/manage/js/common.js"></script>
    <script src="${ctx}/statics/manage/plugins/ueditor-1.4.3/ueditor.config.js"></script>
	<script src="${ctx}/statics/manage/plugins/ueditor-1.4.3/ueditor.all.js"></script>
    
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
        var ue=UE.getEditor('content',{
		    //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
		    toolbars: [[
			   'fullscreen', 'source', '|', 'undo', 'redo', '|',
    	       'bold', 'italic', 'underline', 'fontborder', 'removeformat', 'formatmatch', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist',
    	       'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
    	       'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
    	       'indent',
    	       'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
    	       'link', 'unlink','simpleupload', 'insertimage'
			 ]],
		     //关闭字数统计
		     wordCount:false,
		     initialFrameHeight:200,
		     //关闭elementPath
		     elementPathEnabled:false
	    });
	    $("#imageUploadify").uploadify({
        	'buttonImage':'${ctx}/statics/manage/plugins/uploadify/uploadify-button.png',
	        'swf': '${ctx}/statics/manage/plugins/uploadify/uploadify.swf',
	        'uploader':'${ctx}/upload',
	        'onFallback' : function() {//检测FLASH失败调用 
	        	alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");  
	        },  
	        'onUploadSuccess':function(file, data, response){
	            var jsonData = jQuery.parseJSON(data);
                $(".imageImg").css("display","block").find("img").attr("src",jsonData.msg);
        	}
	    });
        function add(){
        	$.post("${ctx}/manage/appset/add",{"name":$("[name='name']").val(),"image":$(".imageImg img").attr("src"),"method":$("[name='method']:checked").val(),"direct":$("[name='direct']").val(),"url":$("[name='url']").val(),"content":ue.getContent(),"type":"${type}"},function(data){
					if(data.code=="0"){
						layer.msg("添加成功", {
							icon : 1
						});
						setTimeout("javascript:parent.location.reload()", 2000)
					}else{
						opt_error("系统繁忙，请稍后再试");
					}
			},"json")
        }
        
        $("[name='method']").change(function(){
        	var cur=$(this).val();
        	if(cur=='0'){
        		$('#directDiv').show();
        		$('#urlDiv').hide();
        		$('#contentDiv').hide();
        	}else if(cur=='1'){
        		$('#directDiv').hide();
        		$('#urlDiv').show();
        		$('#contentDiv').hide();
        	}else{
        		$('#directDiv').hide();
        		$('#urlDiv').hide();
        		$('#contentDiv').show();
        	}
        })
    </script>
</body>

</html>