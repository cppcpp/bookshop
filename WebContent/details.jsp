<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ddbs.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
    <script src="js/jquery-2.2.3.js"></script>
	<script src="js/details.js"></script>
	<script src="js/utils.js"></script>
</head>

<style type="text/css">
	.select{
		cursor: point;
	}
</style>
<!-- <script type="text/javascript">
	$(function(){
		$(".select").click(function(){
			$(".select").removeClass("active");
			this.addClass("active");
			var id = "tab"+this.id;
			var showId = document.getElementById(id);
			
		})
	})
</script> -->

<body>
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>
                <li ><a href="index.jsp">首页</a></li>
                <li><a href="category1.jsp">书城</a></li>
                <li><a href="specials.jsp">特价书城</a></li>
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="mine.htmlmine.html">我的</a></li>
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
       
       <%
       		Books b = (Books)request.getAttribute("book");
       		//System.out.println(b.getB_price());
       %>
        
       <div class="center_content">
       	    <div class="left_content">
	        	<div class="crumb_nav">
	                <a href="index.jsp">首页</a> &gt;&gt; <%=b.getB_name() %>
	            </div>
            	<div class="title"><span class="title_icon">
            	     <img src="images/bullet1.gif" alt="" title="" />
            	     </span><%=b.getB_name() %></div>
        	
        <form action="detailsOrder" method="get" name="form1">      
        	<input type="hidden" value="<%=b.getB_id() %>" id="b_id_text" name="b_id"/>
        	
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="#"><img src="book_images/<%=b.getB_id() %>.jpg" alt="" title="" border="0" style="width:150px;height: 150px;"/></a>
                    <br /><br />
                    <a href="images/big_pic.jpg" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    	<div class="prod_title">图书信息与购买信息</div>
	                    <p class="details">
	                       <%=b.getB_description() %>
	                        <br />
	                        购买信息：已有23人购买，折后价更便宜
	                    </p>
                    	<div class="price"><strong>价格:</strong> <span class="red"> <%=b.getB_discount()*b.getB_price()/100 %></span></div>
                    	<div class="price"><strong>数量:</strong>
                        <span class="red">
                        	<input type="button" value="-" class="desc"/>
	                    	<input type="text" value="1" class="num-text" name="bookNum" style="width: 20px;" id="num_text"/>
	                    	<input type="button" value="+" class="plus"/>
                        </span></div>
                    </div>
                    <div style="margin-left: 120px;margin-top: ">
	                    <input class="detail-buuton1 add-cart" id="add_cart" type="button" value="加入购物车" /> 
	                    <input class="detail-buuton1 order-now" id="now_order" type="submit" value="立即购买" />
	                </div>
                    <div class="clear"></div>
                 </div>
                    
                <div class="box_bottom"></div>
            </div>
            </form>
            <div class="clear"></div>

 <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                    <li><a class="active" href="#tab1">More details</a></li>
                    <li><a class="" href="#tab2">Related books</a></li>
                </ul>

                <div class="tabs-container">

                    <div style="display: block;" class="tab" id="tab1">
                        <p class="more_details">图书名称：<%=b.getB_name() %>
                        </p>
                        <ul class="list">
                            <li><a href="#">图书编号：<%=b.getB_id() %></a></li>
                            <li><a href="#">打折情况：<%=b.getB_discount() %></a></li>
                            <li><a href="#">图书服务情况：<%=b.getB_service() %></a></li>
                            <li><a href="#">图书出版时间：<%=b.getB_press_time() %></a></li>
                        </ul>
                        <p class="more_details">
                        	图书适用人群：<%=b.getB_description() %>
                        </p>
                    </div>
                    
                    <div style="display: none;" class="tab" id="tab2">
				      <c:forEach var="relative" items="${requestScope.relative}"  varStatus="currentStatus">
                        <div class="new_prod_box">
                            <a href="details.jsp" style="white-space:nowrap;text-overflow:ellipsis;overflow: hidden;width: 100px;">${relative.b_name }</a>
                            <div class="new_prod_bg">
                                <a href="details.jsp"><img src="book_images/${relative.b_id}.jpg" alt="" title="" class="thumb" border="0" width="90px" height="90px"/></a>
                            </div>
                        </div>
				      </c:forEach>
                        <div class="clear"></div>
                    </div>

                </div>


            </div>
       
        </div>

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
</p>

               </div>

           </div><!--end of right content-->

            <div class="clear"></div>
       </div>
		
       <div class="clear"></div>

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

<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});
</script>
</html>