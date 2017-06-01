<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book-store</title>
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
                <li><a href="specials.jsp">特价书城</a></li>
                <!--<li><a href="specials.jsp">specials books</a></li>-->
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="mine.html">我的</a></li>
                <!--<li><a href="register.jsp">register</a></li>-->
                <li><a href="contact.jsp">联系我们</a></li>
                <li class="selected"><a href="about.jsp">关于我们</a></li>
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
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>About us</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            <img src="images/about.gif" alt="" title="" class="right" />
                我们的书店创建于2000-1-1,拥有很大的图书范围，包含了文学、传记、体育、家庭伦理、辅导、考试类书籍、外语等全面性的书籍种类。在这里，可以遨游书本的海洋，没有了知识范围的边界。如果你是想成为一个“上知天文，下懂地理”的家伙，加入我们吧，我们很有诚心的邀请你加入我们。welcome
                <br /><br />
                当然，我们也秉承着诚实经营的首则，赢得了广大书籍爱好者的信赖，如果你喜欢我们的书店，就请收藏它吧，我们不仅仅在经营一家书店，我们也在经营知识。在几年的经营下，我们的用户系统每天都有用户加入，这是我们很开心的事情，同时有了你们的加入，我们相信我们做的会很好
                <br /><br />
                最后，如果你是一个爱心人，就请为我们的图书系统捐赠吧，让我们为山区的孩子送去一点知识的希望，让我们看到他们学习的快乐，如果你是书籍爱好者，恰巧你又是那么的有爱心，就请点击这个链接，进入我们的捐赠页面
                <a href="">书本捐赠</a>
            </p>
            
            
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
                    我们经营的不仅仅是书本，我们经营的是知识。在这里，你可以查阅到各种专业各种行业的有关书籍，如果我们没有您需要的书籍，请联系我们，我们会尽快补齐。我们秉着诚实经营的理念，走到现在。同时，我们也有图书捐赠的活动，在我们的活动主页可以看到，我们图书捐赠活动，也请您积极参加哦                   </p>

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