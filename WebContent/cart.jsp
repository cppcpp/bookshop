<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book-store</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/cart.js"></script>
<script src="js/utils.js"></script>
<style type="text/css">
.cart-submit{
	background:#734633;
	border: 1px solid #734633;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
	width:80px;
	margin-left:390px;
	margin-top:10px;
	color:white;
	height:25px;
}
</style>
</head>
<body>
<div id="wrap">
       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>
                <li ><a href="index.jsp">首页</a></li>
                <li><a href="category1.jsp">书城</a></li>
                <li><a href="specials.jsp">特价书城</a></li>
                <li class="selected"><a href="cart.jsp">购物车</a></li>
                <li><a href="mine.html">我的</a></li>
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
			<c:if test="${sessionScope.u_account==null}" var="u">
				 <div><span>你还没有登录，<a href="login.jsp">请登录</a></span></div>
			</c:if>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>
        
        	<div class="feat_prod_box_details">
            <form action="order" method="get">
            <table class="cart_table" id="cart-table">
            	<tr class="cart_title">
                    <td><input type="checkbox" name="book-select" class="selectAll" checked/></td>
                	<td>图片</td>
                	<td>书名</td>
                    <td>原单价</td>
                    <td>折后单价</td>
                    <td>数量</td>
                    <td>总价</td> 
                    <td>编辑</td>  
                    <td>删除</td>             
                </tr>
                <c:forEach var="cart" items="${sessionScope.carts}"  varStatus="currentStatus">
                	<tr title="${currentStatus.index}">
                		<%-- <input type="hidden" value="${cart.b_sumdiscountprice}" /> --%>
                		<td><input type="checkbox" class="selectSub" name="${cart.b_id}" checked/></td>
						<td><img src="book_images/${cart.b_id}.jpg" class="cart-img"></td>
						<td>${cart.b_name}</td>
						<td class="price">${cart.b_price}</td>
						<td class="dis_price">${cart.b_discountprice}</td>
						<td style="width:70px;">
							<input type="button" value="-" class="desc" style="display: none;"/>
	                    	<input type="text" value="${cart.b_nums}" class="num-text" name="book_num" disabled="disabled"/>
	                    	<input type="button" value="+" class="plus" style="display: none;"/>
						</td>
						<td class="sum_money">${cart.b_sumdiscountprice}</td>
						<td><input type="button" value="编辑" class="cart-delete edit-text" title="${cart.b_id}"/></td> 
						<td><input type="button" value="删除" class="cart-delete2" id="delete"/></td> 
						
						<%-- <c:out value="book_images/${cart.b_id}.jpg" ></c:out> --%>
					</tr>
                </c:forEach>       	
               
                <tr>
	                <td colspan="8" class="cart_total"><span class="red">实付(不含运费)</span></td>
	                <td class="ac_money"><%=session.getAttribute("num") %></td>
                </tr>                  
            
            </table>
            <a class="continue">&lt; 返回首页</a>
            <input class="cart-submit" type="submit" value="下单 &gt;">
            </form>
        
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
                    我们经营的不仅仅是书本，我们经营的是知识。在这里，你可以查阅到各种专业各种行业的有关书籍，如果我们没有您需要的书籍，请联系我们，我们会尽快补齐。我们秉着诚实经营的理念，走到现在。同时，我们也有图书捐赠的活动，在我们的活动主页可以看到，我们图书捐赠活动，也请您积极参加哦                   </p>                   </p>

               </div>

           </div><!--end of right content-->


           <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> </div>
        <div class="right_footer">
        <a href="#">首页</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div>
    

</div>

</body>
</html>