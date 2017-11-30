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
    
    <title>智行家</title>
    <meta name="keywords" content="后台bootstrap框架,后台HTML,响应式后台">
    <meta name="description" content="基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx}/statics/manage/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/statics/manage/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/statics/manage/css/style.min.css?v=4.0.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>出行服务<a class="pull-right btn btn-xs btn-white" onclick="layer_show('新增出行服务','${ctx}/manage/appset/add/0','','','')"><i class="fa fa-plus"></i> 新增</a></h3>
                        <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动服务面板更改排序</p>
                        <ul class="sortable-list agile-list" id="sortable_t">
                        	<c:forEach items="${travels }" var="t">
                        	<li class="success-element" data-id="${t.id }">
                                <div class="feed-element" style="padding-bottom: 0;">
                                    <a href="javascript:;" class="pull-left">
                                        <img alt="image" class="img-circle" src="${t.image }">
                                    </a>
                                    <div class="media-body" style="line-height: 38px;">
                                        <strong>${t.name }</strong>
                                        <div class="pull-right">
                                            <a class="btn btn-xs btn-white" onclick="layer_show('修改出行服务','${ctx}/manage/appset/update/${t.id }','','','')"><i class="fa fa-pencil"></i> 修改</a>
                                            <a class="btn btn-xs btn-danger" onclick="del('${t.id}')"><i class="fa fa-trash"></i> 删除</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>增值服务<a class="pull-right btn btn-xs btn-white" onclick="layer_show('新增增值服务','${ctx}/manage/appset/add/1','','','')"><i class="fa fa-plus"></i> 新增</a></h3>
                        <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动服务面板更改排序</p>
                        <ul class="sortable-list agile-list" id="sortable_s">
                        	<c:forEach items="${surges }" var="s">
                            <li class="info-element" data-id="${s.id }">
                               	<div class="feed-element" style="padding-bottom: 0;">
                                    <a href="javascript:;" class="pull-left">
                                        <img alt="image" class="img-circle" src="${s.image }">
                                    </a>
                                    <div class="media-body" style="line-height: 38px;">
                                    	<strong>${s.name }</strong>
                                        <div class="pull-right">
                                            <a class="btn btn-xs btn-white" onclick="layer_show('修改增值服务','${ctx}/manage/appset/update/${s.id }','','','')"><i class="fa fa-pencil"></i> 修改</a>
                                            <a class="btn btn-xs btn-danger" onclick="del('${s.id}')"><i class="fa fa-trash"></i> 删除</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>


    </div>
    <script src="${ctx}/statics/manage/js/jquery.min.js"></script>
    <script src="${ctx}/statics/manage/js/bootstrap.min.js"></script>
    <script src="${ctx}/statics/manage/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/statics/manage/js/content.min.js"></script>
    <script src="${ctx}/statics/manage/plugins/layer/layer.js"></script>
    <script src="${ctx}/statics/manage/js/common.js?v=1.0.0"></script>
    <script>
        $(document).ready(function(){$("#sortable_t").sortable({update: function(event, ui){
        	var ids=[];
        	$(this).find("li").each(function(){
        		ids.push($(this).data("id"));
        	})
        	$.post("${ctx}/manage/appset/updSort",{"id":ids.toString()},function(data){
				layer.msg('排序完成');
			},"json")
        }}).disableSelection()});
        $(document).ready(function(){$("#sortable_s").sortable({update: function(event, ui){
        	var ids=[];
        	$(this).find("li").each(function(){
        		ids.push($(this).data("id"));
        	})
        	$.post("${ctx}/manage/appset/updSort",{"id":ids.toString()},function(data){
				layer.msg('排序完成');
			},"json")
        }}).disableSelection()});
        //删除
        function del(id){
        	layer.confirm('确认要删除吗？', function(index){
			  layer.close(index);
			  $.post("${ctx}/manage/appset/del/"+id,function(data){
				if(data.code=="0"){
					layer.msg("删除成功", {
						icon : 1
					});
					setTimeout("javascript:location.reload()", 2000)
				}else{
					opt_error("系统繁忙，请稍后再试");
				}
			  },"json")
			});  
        }
    </script>

</body>

</html>