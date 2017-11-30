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
</head>

<body>
    <div class="row animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form action="" method="post" class="form-horizontal">
                           <div class="form-group">
                                <label class="col-sm-2 control-label">微信企业号账号</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="UserId">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                   
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="username">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">重置密码</label>
                                <div class="col-sm-9">
                                	<input type="checkbox" class="js-switch" name="is_reset"/>
                                	<span>密码重置为123456</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">昵称</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="nickname">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系电话</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="mobile">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            
                              <div class="form-group">
                                <label class="col-sm-2 control-label">所属部门</label>

                                <div class="col-sm-9">
                                    <select data-placeholder="选择部门..." class="chosen-select" tabindex="2" name="depart">
                                    	<option value="" tage="">请选择部门</option>
                                    	<c:if test="${not empty depart}">
                                    	  <option value="${depart.id }" >${depart.name }</option>
	                                    	  <c:forEach items="${depart.child}" var="d">
	                                    		  <option value="${d.id }" >&nbsp;&nbsp;&nbsp;${d.name }</option>
	                                    		  <c:forEach items="${d.child}" var="d">
	                                    		     <option value="${d.id }" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${d.name }</option>
	                                    		     <c:forEach items="${d.child}" var="d">
	                                    		            <option value="${d.id }" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${d.name }</option>
	                                    	                 <c:forEach items="${d.child}" var="d">
	                                    		                  <option value="${d.id }" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${d.name }</option>
	                                    	                       <c:forEach items="${d.child}" var="d">
	                                    		                        <option value="${d.id }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${d.name }</option>
	                                    	                       </c:forEach>
	                                    	                </c:forEach>
	                                    	         </c:forEach>
	                                    	      </c:forEach>
	                                    	  </c:forEach>
                                    	</c:if>
		                            </select>
                                </div>
                            </div>
	                         <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">锁定</label>
                                <div class="col-sm-9">
                                	<input type="checkbox" class="js-switch" name="is_locked"/>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色</label>

                                <div class="col-sm-9">
                                	<c:forEach items="${roles }" var="role">
                                		<label class="checkbox-inline i-checks"><input type="checkbox" value="${role.id }" name="role">${role.name }</label>
                                	</c:forEach>
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
    
    <script>
        $('.chosen-select').chosen();
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"})});
        function add(){
        	var roles=[];
			$("[name='role']:checked").each(function(){
				roles.push($(this).attr("value"));
			})
			if(roles==""){
				opt_error("请选择角色");
				return false;
			}
			var is_reset=0;
			if($("[name='is_reset']").is(":checked"))is_reset=1;
			var is_locked=0;
			if($("[name='is_locked']").is(":checked"))is_locked=1;
			var depart_id=$("[name='depart']").val();
			if(depart_id==""){
			  opt_error("请选择部门！");
			  return ;
			}
        	$.post("${ctx}/manage/user/add",{"UserId":$("[name='UserId']").val(),"username":$("[name='username']").val(),"is_reset":is_reset,"mobile":$("[name='mobile']").val(),"nickname":$("[name='nickname']").val(),"depart_id":depart_id,"is_locked":is_locked,"roles":roles.toString()},function(data){
					if(data.code=="0"){
						opt_success("添加成功",0);
					}else if(data.code=="1"){
						opt_error("添加失败");
					}else{
						opt_error(data.msg);
					}
				},"json")
        }
    </script>
</body>

</html>