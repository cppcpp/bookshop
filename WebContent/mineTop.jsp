<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
</head>
<body style="margin:0;padding:0;overflow:hidden" scroll="no">
<div id="wrap">
   <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
                <li><a href="index.jsp" target="_parent">首页</a></li>
                <li><a href="category1.jsp" target="_parent">书城</a></li>
                <li><a href="specials.jsp" target="_parent">特价书城</a></li>
                <li><a href="cart.jsp" target="_parent">购物车</a></li>
                <li  class="selected" target="_parent"><a href="myaccount.jsp">我的</a></li>
                <!--<li><a href="register.jsp">register</a></li>-->
                <li><a href="contact.jsp" target="_parent">联系我们</a></li>
                <li><a href="about.jsp" target="_parent">捐赠图书</a></li>
                <c:if test="${sessionScope.u_account==null}" var="check">
	                <li class="log-reg"><a href="login.jsp" target="_parent">登录</a></li>
	                <li class="log-reg"><a href="register.jsp" target="_parent">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.u_account!=null}" var="check">
	                <li class="log-reg"><a href="#" id="exit" target="_parent">退出</a></li>
                </c:if>
            </ul>
        </div>
            
   </div> 
</div>
</body>
</html>