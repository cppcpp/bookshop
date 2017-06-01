<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book-store</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css">
<script src="js/jquery-2.2.3.js"></script>
<script src="js/utils.js"></script>
</head>
<body>
<div id="wrap">
       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
	        <div id="menu">
	            <ul>
	                <li class="selected"><a href="index.jsp">首页</a></li>
	                <li><a href="category1.jsp">书城</a></li>
	                <li><a href="specials.jsp">特价书城</a></li>
	                <li><a href="cart.jsp">购物车</a></li>
	                <li><a href="mine.html">我的</a></li>
	                <!--<li><a href="register.jsp">register</a></li>-->
	                <li><a href="contact.jsp">联系我们</a></li>
	                <li><a href="about.jsp">捐赠图书</a></li>
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
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>为你推荐</div>
        
        <!-- 用户没有登录的时候 -->
        <c:if test="${sessionScope.u_account==null}" var="check">
		   <c:forEach var="b" items="${sessionScope.top}"  varStatus="currentStatus">
	        	<div class="feat_prod_box">
	            	<div class="prod_img"><a href="details?b_id=${b.b_id}"><img src="book_images/${b.b_id}.jpg" alt="" title="" border="0" style="width:100px;height: 100px;"/></a></div>
	                <div class="prod_det_box">
	                	<div class="box_top"></div>
	                    <div class="box_center">
	                    <div class="prod_title">${b.b_name}</div>
	                    <p class="details">
	                        ${b.b_description}
	                    </p>
	                    <a href="details.jsp" class="more">- 更多 -</a>
	                    <div class="clear"></div>
	                    </div>
	                    
	                    <div class="box_bottom"></div>
	                </div>    
	                <div class="clear"></div>
	            </div>	
		  </c:forEach>
	    </c:if>
	    
	    <!-- 用户已经登录的时候 -->
	    <c:if test="${sessionScope.u_account!=null}" var="check">
		   <c:forEach var="book" items="${sessionScope.booksByBIBid}"  varStatus="currentStatus">
        	<div class="feat_prod_box">
            
            	<div class="prod_img"><a href="details?b_id=${book.b_id}"><img src="book_images/${book.b_id}.jpg" alt="" title="" border="0" style="width:100px;height: 100px;"/></a></div>
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${book.b_name}</div>
                    <p class="details">
                        ${book.b_description}
                    </p>
                    <a href="details.jsp" class="more">- 更多 -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
                <div class="clear"></div>
            </div>	
		  </c:forEach>
	    </c:if>
        
           <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>新书上架</div>
           
           <div class="new_products">
           		<c:forEach var="bk" items="${sessionScope.newBooks}"  varStatus="currentStatus">
                    <div class="new_prod_box">
                        <a href="details?b_id=${bk.b_id}">${bk.b_name}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="details?b_id=${bk.b_id}"><img src="book_images/${bk.b_id }.jpg" alt="" title="" class="thumb" border="0" width="100px" height="100px"/></a>
                        </div>           
                    </div>
                </c:forEach>
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

                <div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>图书分类</div>

                <ul class="list">
                    <a href="category.jsp" class="cate-a"><li class="no-select-cat tag" title="哲学、社会科学">哲学、社会科学</li></a>
                       <li class="no-select-cat tag" title="政治、法律">政治、法律</li>
                       <li class="no-select-cat tag" title="文学书">文学书</li>
                       <li class="no-select-cat tag" title="语言、文字">语言、文字</li>
                       <li class="no-select-cat tag" title="艺术">艺术</li>
                       <li class="no-select-cat tag" title="数理化科学">数理化科学</li>
                       <li class="no-select-cat tag" title="天文学、地球科学">天文学、地球科学</li>
                       <li class="no-select-cat tag" title="自然科学总论">自然科学总论</li>
                       <li class="no-select-cat tag" title="文化、科学、教育、体育">文化、教育</li>
                       <li class="no-select-cat tag" title="综合性图书">综合性图书</li>
                       <li class="no-select-cat tag" title="期刊杂志">期刊杂志</li>
                       <li class="no-select-cat tag" title="经济">经济</li>
                       <li class="no-select-cat tag" title="历史、地理">历史、地理</li>
                       <li class="no-select-cat tag" title="更多种类">更多种类</li>
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
		                        <a href="details?b_id=${special.b_id}">${special.b_name}</a>
		                        <div class="new_prod_bg">
		                        <!-- <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span> -->
		                        <a href="details?b_id=${special.b_id}"><img src="book_images/${special.b_id }.jpg" alt="" title="" class="thumb" border="0" width="100px" height="100px"/></a>
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
                    我们经营的不仅仅是书本，我们经营的是知识。在这里，你可以查阅到各种专业各种行业的有关书籍，如果我们没有您需要的书籍，请联系我们，我们会尽快补齐。我们秉着诚实经营的理念，走到现在。同时，我们也有图书捐赠的活动，在我们的活动主页可以看到，我们图书捐赠活动，也请您积极参加哦

                </p>

            </div>
        
        </div><!--end of right content-->

       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /></div>
        <div class="right_footer">
        <a href="index.jsp">首页</a>
        <a href="category.jsp">书城</a>
        <a href="cart.jsp">购物车</a>
        <a href="myaccount.jsp">我的</a>
        <a href="contact.jsp">联系我们</a>
        <a href="about.jsp">捐赠图书</a>
        </div>
       </div>
</div>


</body>
</html>