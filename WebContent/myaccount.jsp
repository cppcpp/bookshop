<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/utils.js"></script>
</head>
<body>
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="category1.jsp">书城</a></li>
                <!--<li><a href="specials.jsp">specials books</a></li>-->
                <li><a href="cart.jsp">购物车</a></li>
                <li  class="selected"><a href="mine.html">我的</a></li>
                <!--<li><a href="register.jsp">register</a></li>-->
                <li><a href="contact.jsp">联系我们</a></li>
                <li><a href="about.jsp">关于我们</a></li>
                <c:if test="${sessionScope.u_account==null}" var="check">
	                <li class="log-reg"><a href="login.jsp">登录</a></li>
	                <li class="log-reg"><a href="register.jsp">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.u_account!=null}" var="check">
	                <li class="log-reg"><a href="#" id="exit">退出</a></li>
                </c:if>
                <c:if test="${sessionScope.manager!=null}" var="check">
	                <li class="log-reg"><a href="manager.html">卖家管理</a></li>
                </c:if>
            </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
       	    <div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>我的账号</div>

        	<div class="feat_prod_box_details">
        	<c:if test="${sessionScope.u_account==null}" var="check">
	            <p class="details">
	                	您还没有登录，请登录
	            </p>
            </c:if>

            </div>	

        <div class="clear"></div>
        </div><!--end of left content-->

           <div class="right_content">
               <div class="cart">
                   <a href="cart.jsp">
                       <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>购物车</div>
                   </a>
                   <div class="home_cart_content">
                       数量 X <b> <%=session.getAttribute("s_nums") %> </b>|| <span class="red">总价: <%=session.getAttribute("num") %></span>
                   </div>


               </div>

               <div class="right_box">

                   <div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>图书种类</div>

                   <ul class="list">
                       <li><a href="#">计算机IT与互联网</a></li>
                       <li><a href="#">数学与经济管理</a></li>
                       <li><a href="#">考试类辅导书</a></li>
                       <li><a href="#">外语</a></li>
                       <li><a href="#">文学书</a></li>
                       <li><a href="#">词典与工具书</a></li>
                       <li><a href="#">教材教辅</a></li>
                       <li><a href="#">励志与成功</a></li>
                       <li><a href="#">家庭教育</a></li>
                       <li><a href="#">期刊杂志</a></li>
                       <li><a href="#">进口书</a></li>
                       <li><a href="">更多种类</a></li>
                   </ul>
               </div>

               <div class="right_box">
             
             	<a href="specials.jsp">
             		<div class="title"><span class="title_icon">
             			<img src="images/bullet4.gif" alt="" title="" /></span>特价书
             		</div>
             	</a>
             	
	             	<c:forEach var="special" items="${sessionScope.special}"  varStatus="currentStatus">
	                    <c:if test="${currentStatus.index <= 1 }">
		                    <div class="new_prod_box">
		                        <a href="details.jsp">${special.b_name}</a>
		                        <div class="new_prod_bg">
		                        <!-- <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span> -->
		                        <a href="details.jsp"><img src="book_images/${special.b_id }.jpg" alt="" title="" class="thumb" border="0" width="100px" height="100px"/></a>
		                        </div>           
		                    </div>
	                    </c:if>
	               </c:forEach>     
                    
             </div>
               <div class="right-img">
                   <img src="images/border.gif" alt=""/>
               </div>


               <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>我们的书店</div>
               <div class="about">
                   <p>
                       <img src="images/about.gif" alt="" title="" class="right" />
                       Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
                   </p>

               </div>

           </div><!--end of right content-->



           <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div>
    

</div>

</body>
</html>