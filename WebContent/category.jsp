<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book-store</title>
<script src="js/jquery-2.2.3.js"></script>
<script src="js/style.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
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
                <li  class="selected"><a href="category.jsp">书城</a></li>
                <li><a href="specials.jsp">特价书城</a></li>
                <li><a href="cart.jsp">购物车</a></li>
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
        	<div class="crumb_nav">
            <a href="index.jsp">首页</a> &gt;&gt; 书城
            </div>
            <div class="title"><span class="title_icon">
                <img src="images/bullet1.gif" alt="" title="" /></span>
                <label class="title-text">哲学、社会科学</label>
            </div>
           
           <div class="new_products" id="哲学、社会科学">
           
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.jsp"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>          


                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        
                        <a href="details.jsp"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div> 
       
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div> 

                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                     <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>

                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                         <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    <div class="new_prod_box">
                        <a href="details.jsp">计算机网络</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                  
                    

                    <div class="pagination">
                    <span class="disabled"><<</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                    </div>
            
            </div>


           <div class="new_products" id="政治、法律" style="display: none">
               <div class="new_prod_box">
                   <a href="details.jsp">政治、法律</a>
                   <div class="new_prod_bg">
                       <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                   </div>
               </div>
               <div class="pagination">
                   <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
               </div>
           </div>

            <div class="new_products" id="文学书" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">文学书</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="语言、文字" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">语言、文字</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="艺术" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">艺术</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="数理化科学" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">数理化科学</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="天文学、地球科学" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">天文学、地球科学化科学</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="自然科学总论" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">自然科学总论</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="文化、科学、教育、体育" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">文化、科学、教育、体育</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

            <div class="new_products" id="综合性图书" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">综合性图书</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>

			<div class="new_products" id="期刊杂志" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">期刊杂志</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>
			
			<div class="new_products" id="经济" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">经济</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
            </div>
			
			<div class="new_products" id="历史、地理" style="display: none">
                <div class="new_prod_box">
                    <a href="details.jsp">历史、地理</a>
                    <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                <div class="pagination">
                    <span class="disabled"></span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
                </div>
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
                       <li class="select-cat tag" title="哲学、社会科学">哲学、社会科学</li>
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
                        我们经营的不仅仅是书本，我们经营的是知识。在这里，你可以查阅到各种专业各种行业的有关书籍，如果我们没有您需要的书籍，请联系我们，我们会尽快补齐。我们秉着诚实经营的理念，走到现在。同时，我们也有图书捐赠的活动，在我们的活动主页可以看到，我们图书捐赠活动，也请您积极参加哦                   </p>                   </p>
</p>

               </div>

           </div><!--end of right content-->


           <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /></div>
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