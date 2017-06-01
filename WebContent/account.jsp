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
		$(".pass").css("display","block");
		this.value = "完成";
		//alert(update);
		$(this).click(function () {
			this.value = "修改";
			$(".pass").css("display","none");
		})
	})
	
	
	$("#old_pass").blur(function() {
		passRequest = createRequest();
		var url = "password?old_pass="+this.value;
		passRequest.open("GET",url,true);
		passRequest.onreadystatechange = passHandler;
		passRequest.send(null);
	})
	
	function passHandler(){
		if(passRequest.readyState==4){
			if(passRequest.status==200){
				if(passRequest.responseText=="success"){
					//alert("密码正确")
					$(".check").css("display","none");
				}else{
					//alert("密码不正确");
					$(".check").css("display","block");
					
				}
				
			}
		}
	}
	
	//ajax异步请求对象 
    function createRequest(){
    	try {
    		var request = new XMLHttpRequest();
    	} catch (tryMS) {
    		try {
    			request = new ActiveXObject("Msxml2.XMLHTTP");
    		} catch (otherMS) {
    			try {
    				request = new ActiveXObject("Microsoft.XMLHTTP");
    			} catch (failed) {
    				request = null;
    			}
    		}
    	}
    	return request;
    }
})
</script>
<body>
<div class="wrap">
       <div class="right_content" style="background: white;width: 79.5%;float: left;height:510px;">
			 <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>账号与安全</div>
       		<br/><br/><br/>
       		<!--账户与安全-->
			<form action="MineAllNew">
				<ul class="pass-text">
					<li><b class="pass_update">修改密码</b><br /> <input
						type="password" value="${sessionScope.mySecurityOld.u_password}" disabled="disabled" class="pass-input">
						<input type="button" value="修改" class="pass_button"> <br />
						<div style="display: none;margin-top: 15px;" class="pass" >
							<b class="pass_update" style="width: 70px; margin-top: 3px;">原密码</b><input
								type="password" placeholder="请输入原密码" class="pass-input"
								id="old_pass" />
							<div class="check"
								style="display: none; margin-left: 50px; color: red">密码错误</div>
							<br /> <b class="pass_update" style="width: 70px;">新密码</b><input
								type="password" placeholder="请输入新密码" class="pass-input" name = "firstPw"/><br>
							<b class="pass_update" style="width: 70px;">确认密码</b><input
								type="password" placeholder="确认新密码" class="pass-input" name = "secondPw"/><br>
								<input type="submit" value="提交" align="center" class="pass_button" style="width: 100px;margin-left:12%;margin-top: 15px;">
						</div></li>
				</ul>
			</form>


		</div><!-- end of left content -->
</div>

</body>
</html>