<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book-store</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/order.js"></script>
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
       
      <c:if test="${requestScope.fail != null }" var="checkOrder">
       		<script type="text/javascript">
       			$(function(){
       				alert("你还没有登录,将为您跳转到登录页面");
       				window.location = "login.jsp";
       			})
       		</script>
       </c:if>
       
       
       <c:if test="${requestScope.fail == null }" var="checkOrder">
       <div class="center_content">
		
		<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>图书订单</div>
       		 <form action="orderSubmit" method="post">
       		 <div class="order-table">
       		  <table class="cart_table" style="width:360px;">
            	<tr class="cart_title">
       		  	<td>图片</td>
       		  	<td>书名</td>
       		  	<td>数量</td>
       		  	<td>总价</td>
       		  </tr>

       		  
       			<c:if test="${sessionScope.order != null }" var="checkOrder">
	       			<c:forEach var="order" items="${sessionScope.order}">
	       			    <tr>
		       				<td><img src="book_images/${order.b_id}.jpg" class="cart-img"></td>
		       				<td>${order.b_name}</td>
		       				<td>${order.b_nums}</td>
		       				<td>${order.b_sumdiscountprice}</td>
	       				</tr>
	       			</c:forEach>
       			</c:if>  
       			<tr>
       				<td colspan="3" class="order_total" >总价</td>
       				<td class="order_number"><b>${requestScope.order_sum }</b></td>
       			</tr>    			 		
       		  </table>
       		  <!-- <div class="order_sum">
       		  		<span>总价</span>
       		  		<span></span>
       		  </div> -->
       		  <br/><br/><br/>
       		  <div>
       		  	<span>选择收货信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
       		  	<input type="button" value="选择其他收货信息" class="order_info" id="other_address"/>
       		  	<input type="button" value="新增收货信息" class="order_info" id="add_address" /><br/><br/>
       		  	<div class="order-add">
	       		  	<c:forEach var="address" items="${requestScope.address}">
			       		收货人：<span id="huo_person">${address.o_receiver}</span><br/>
			       		收货地址：<span id="huo_address">${address.u_address}</span><br/>
			       		联系方式：<span id="huo_phone">${address.o_phone}</span>
			       		<input type="hidden" name="a_person" value="${address.o_receiver}" id="a_person">
			       		<input type="hidden" name="a_address" value="${address.u_address}" id="a_address">
			       		<input type="hidden" name="a_phone" value="${address.o_phone}" id="a_phone">
		       		</c:forEach>
	       		</div>
       		  </div>
       		  <br/>
       		  <div>
       		  	<input type="submit" value="确认" class="order-ok">
       		  </div>
       		</div>
       		</form>
       		<div class="clear"></div>
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
                    我们经营的不仅仅是书本，我们经营的是知识。在这里，你可以查阅到各种专业各种行业的有关书籍，如果我们没有您需要的书籍，请联系我们，我们会尽快补齐。我们秉着诚实经营的理念，走到现在。同时，我们也有图书捐赠的活动，在我们的活动主页可以看到，我们图书捐赠活动，也请您积极参加哦

                </p>

            </div>
        
        </div><!--end of right content-->

       <div class="clear"></div>
       </div><!--end of center content-->
       </c:if>
              
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



<div class="address-all">
<div class="circles">X</div>
  <form id="order_address">
	<c:forEach var="otherAddress" items="${requestScope.allAddress}" varStatus="currentStatus">
    <div>
        <div class="address-info">
            <input type="radio" name="cate" class="radio_address" value="${currentStatus.index }">
            <span>收货人：</span><span>${otherAddress.o_receiver}</span><br/>
            <span>收货地址：</span><span>${otherAddress.u_address }</span><br/>
            <span>联系方式：</span><span>${otherAddress.o_phone}</span>
        </div>
    </div>
	</c:forEach>   
  </form>
    <div class="address-b"><input type="button" value="确定" class="address_button"></div>
</div>


<div class="address-all">
<div class="circles">X</div>
  <form id="order_address">
	<c:forEach var="otherAddress" items="${requestScope.allAddress}" varStatus="currentStatus">
    <div>
        <div class="address-info">
            <input type="radio" name="cate" class="radio_address" value="${currentStatus.index}" />
            <span>收货人：</span><span>${otherAddress.o_receiver}</span><br/>
            <span>收货地址：</span><span>${otherAddress.u_address }</span><br/>
            <span>联系方式：</span><span>${otherAddress.o_phone}</span>
        </div>
    </div>
	</c:forEach>   
  </form>
    <div class="address-b"><input type="button" value="确定" class="address_button"></div>
</div>


<div class="add_address">
    <div class="circle">X</div>
    <div>
        <ul class="add_address_ul">
            <li>收货人：</li>
            <input type="text" placeholder="收货人" id="add_person"/>
            <li>收货地址：</li>
            <textarea cols="21" rows="3" placeholder="收货地址" id="add_address_info"></textarea>
            <li>联系方式：</li>
            <input type="text" placeholder="联系方式" id="add_phone"/>
        </ul>
        <div class="default_address">
            <input type="radio" id="radio_check"/>
            <span>是否设为默认地址</span>
        </div>
        <div class="add_address_ok"><input type="button" value="增加" class="add_address_button" /></div>
    </div>
</div>

</body>
</html>