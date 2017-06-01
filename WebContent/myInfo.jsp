<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$(".pass_button").click(function(){
		//alert(this.value);
		var update = this.previousSibling;
		while(update.nodeName=="#text"){
			update = update.previousSibling;
		}
		$(update).prop("disabled",false);
		this.value = "完成";
		//alert(update);
		$(this).click(function () {
			this.value = "修改";
			$(update).prop("disabled",true);
		})
	})
})
</script>
<body>
<div class="wrap">
       <div class="right_content" style="background: white;width: 79.5%;float: left;height:510px;">
			 <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>个人资料</div>
       		<br/><br/><br/>
       		<!-- 写内容 -->
       		<form action="MineAllNew">
	       		<ul class="pass-text">
	       			<li>
	       				<b class="pass_update">账号</b><br/>
	       				<input type="text" value="${sessionScope.myInfoOld.u_account}" disabled="disabled" class="pass-input" name = "u_account">
	       				<span>不支持修改</span>
	       				<br/>
	       			</li>
	       			<li>
	       				<b class="pass_update">昵称</b><br/>
	       				<input type="text" value="${sessionScope.myInfoOld.u_name}" class="pass-input" name="u_name">
	       				<!-- <input type="button" value="修改" class="pass_button"> -->
	       				<br/>
	       			</li>
	       			<li>
	       				<b class="pass_update">手机号</b><br/>
	       				<input type="text" value="${sessionScope.myInfoOld.u_phone}" class="pass-input" name = "u_phone">
	       				<!-- <input type="button" value="修改" class="pass_button"> -->
	       				<br/>
	       			</li>
	       			<li>
	       				<b class="pass_update">电子邮件</b><br/>
	       				<input type="text" value="${sessionScope.myInfoOld.u_mail}"  class="pass-input" name ="u_mail">
	       				<!-- <input type="button" value="修改" class="pass_button"> -->
	       				<br/>
	       			</li>
	       		</ul>
	       		<input type="submit" value="提交" class="pass_button" style="margin-left: 12%;width: 100px;">
       		</form>
       </div><!-- end of left content -->
</div>
</body>
</html>