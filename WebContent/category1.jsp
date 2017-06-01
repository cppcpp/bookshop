<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <%-- <base href="<%=basePath%>"> --%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<title>Book Store</title>
</head>
<script src="js/jquery-2.2.3.js"></script>
<body>
<style type="text/css">
.sort{
	margin-top:-5px;
	margin-bottom:10px;
	background-color:#EAEAEA;
	width:500px;
	height:32px;
	text-align:center;
	
}
.sort ul{
	list-style:none;	
	text-align:center;
	width:600px;
	margin-left:-50px;
}
.sort ul li{
	float:left;
	
}
.sort ul li a{
	float:left;
	display:block;
	height:32px;
	width:60px;	
	margin-left:3px;
	line-height:32px;
	text-decoration:none;
	color:#000000;
}
.sort ul li a:hover{
	text-decoration:none;
	background-color:#CDC9C9;
	cursor:pointer;
}
.split{
	float:left;
	color:#CDC9C9;
	margin-top:6px;
	margin-left:3px;
}
.input1{
	width:45px;
	border-color:#f8981d;
	border:1px solid #f8981d;
}
.input2{
	width:45px;
	border-color:#f8981d;
}
</style>
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
	        <div id="menu">
	            <ul>                                                                       
	                <li><a href="index.jsp">首页</a></li>
	                <li  class="selected"><a href="category1.jsp">书城</a></li>
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
       		
       		<div class="sort">	
			<ul>
				<li><a>默认</a><span class="split">|</span></li>
				<li><a id="b_sale_num">销量<span class="fa  fa-arrow-down"></span></a><span class="split">|</span></li>
				<li><a id="b_discount">折扣<span class="fa  fa-arrow-down"></span></a><span class="split">|</span></li>
				<li><a id="b_add_time">最新<span class="fa  fa-arrow-down"></span></a><span class="split">|</span></li>
				<li><a id="b_price"><span>价格</span>
						<i id="angle_up" class="fa fa-angle-up" style="font-size:20px;position:relative;top:-4px;left:-2px;text-align:3px;color:#000000"></i>
						<i id="angle_down" class="fa fa-angle-down" style="font-size:20px;margin-top:-20px;margin-left:23px;text-align:3px;"></i>
					</a>
					<span class="split">|</span>
				</li>
				<li style="text-align:center;margin-top:3px">价格区间：<input id="input_left" type="text" class="input1">-<input id="input_right" type="text" class="input1"></li>
			</ul>
			<ul> 
	            <li id="b_sale_num_show" style="width:150px;height:20px;background-color:#CDC9C9;margin-right:200px;display:none">点击后销量由高到低</li>
	       		<li id="b_discount_show" style="width:150px;height:20px;background-color:#CDC9C9;margin-left:150px;display:none">点击后折扣由高到低</li>
	       		<li id="b_add_time_show" style="width:200px;height:20px;background-color:#CDC9C9;margin-left:100px;display:none">点击后按照最近由近到远</li>
	       		<li id="b_price_show" style="width:150px;height:20px;background-color:#CDC9C9;margin-left:250px;display:none"></li>
	       		<li style="margin-left:81px;margin-top:0px">
	       		<input id="input_button_submit" type="button" value="确定" style="width:47px;background-color:#f8981d;color:#ffffff;display: none;border:1px solid #f8981d; ">
	       		<input id="input_button_reset" type="reset" value="取消" style="width:47px;background-color:#CDC9C9;display: none;border:1px solid #f8981d;"></li>
	        </ul>
		</div>
       
       
        <div class="new_products" style="margin-bottom: -20px;">
        	<!-- 循环列出所有图书信息 -->
        	<c:forEach var="b" items="${sessionScope.booksList}">
        		<div class="new_prod_box" style="border:1px">
                        <div class="new_prod_bg" style="height:250px">
                        <%-- <c:if test="(long)${b.b_add_time==0}"><span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span></c:if> --%>
                        <a href="details.jsp"><img src="book_images/${b.b_id}.jpg" alt="" title="" class="thumb" border="0" style="width:90px;height:90px"/></a>
                        	<span style="font-size:20px;color:#ec2323;font-weight:bold;">￥${b.b_price}</span><br>
                        	<c:if test="${b.b_discount!=100}">
                        	<span style="text-decoration:line-through;font-size:5px;color:#b5b5b6;">
                        		(￥<fmt:formatNumber value="${b.b_price/(b.b_discount/100)}" maxFractionDigits="2">
                        		</fmt:formatNumber>)
                        	</span>
                        	<span style="font-size:5px;color:#b5b5b6;">${b.b_discount/100}折</span>
                        	</c:if>
                        	<a href="details.jsp">${b.b_name}</a>
                        	<%-- 销量:已售${b.b_sale_num}本 --%>
                        </div> 
                 </div>
			</c:forEach>
        </div>
        
       </div><!-- end of left content -->
       
       
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
                   <!-- 实现动态加载种类——————————————————————————------------！！！！！！！留---------- -->
                       <li class="no-select-cat tag" title="b">哲学</li>
                       <li class="no-select-cat tag" title="d">政治、法律</li>
                       <li class="no-select-cat tag" title="i">文学书</li>
                       <li class="no-select-cat tag" title="h">语言、文字</li>
                       <li class="no-select-cat tag" title="j">艺术</li>
                       <li class="no-select-cat tag" title="o">数理化科学</li>
                       <li class="no-select-cat tag" title="p">天文学、地球科学</li>
                       <li class="no-select-cat tag" title="n">自然科学总论</li>
                       <li class="no-select-cat tag" title="g">文化、教育</li>
                       <li class="no-select-cat tag" title="j">综合性图书</li>
                       <li class="no-select-cat tag" title="k">期刊杂志</li>
                       <li class="no-select-cat tag" title="f">经济</li>
                       <li class="no-select-cat tag" title="k">历史、地理</li>
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
       	 <div class="clear"></div>
       </div><!--end of right content-->
      <div class="clear"></div>
    </div><!--end of center content--> 
       
       
       <div>
       		<!-- 设置每页几条  -->
       		<div style="margin-left: 15%;">
				<span>
					<c:if test="${sessionScope.pageCount!=0&&sessionScope.curPage!=1}">
						<a style="cursor:pointer" onclick="tab(1)">首页</a>
						<a style="cursor:pointer" onclick="tab(${sessionScope.curPage-1})">前一页</a>
					</c:if>
				</span>
				
				<span>
					<c:if test="${sessionScope.pageCount==0||sessionScope.curPage==1}">首页 前一页</c:if>
				</span>
				
				<span>
					<c:if test="${sessionScope.pageCount!=0&&sessionScope.curPage!=sessionScope.pageCount}">
						<a style="cursor:pointer" onclick="tab(${sessionScope.curPage+1})">下一页</a>
						<a style="cursor:pointer" onclick="tab(${sessionScope.pageCount})">尾页</a>
					</c:if>
				</span>
				
				<span>
					<c:if test="${sessionScope.pageCount==0||sessionScope.curPage==sessionScope.pageCount}">下一页 尾页</c:if>
					&nbsp;
					第${sessionScope.curPage}页/共${sessionScope.pageCount}页
					&nbsp;
					设置每页<input type="text" id="pageSize" style="width: 20px;">条
				</span>
			</div>
       	</div>
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /></div>
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
//-------------------------------------------------按照种类查找以及分页----------------------------------------
var storage=window.localStorage;

var ul=document.getElementsByClassName("list");
var b=ul[0].childNodes;
for(var i=0;i<b.length;i++){
	b[i].onclick=function(){
		console.log(this.title);
		checkByCat(this.title);
	}
}
//var category;
function checkByCat(cat){
	//console.log(cat);
	//category=cat;
	if(!window.localStorage){
	    alert("浏览器支持localstorage");
	    return false;
	}else{
		var storage=window.localStorage;
		storage.setItem("category",cat);
		 console.log("存cunc"+storage["category"]);
	}
	//console.log("--------category"+category);
	$.ajax({
		url:'booksSearchByCat2',
		type:"get",
		data:{"category":cat},
		success:function(data){
			location.href =data; 
		},
		error:function(){
			
		}
	}); 
}

var flag2=0;

$("#input_button_reset").click(function(){
	$("#input_button_submit").css("display","none");
	$("#input_button_reset").css("display","none");
	$("#input_left").val("");
	$("#input_right").val("");
})

$("#search_button").click(function(){
	var search_con=$("#search_con").val();
	var search_input=$("#search_input").val();
	console.log(search_con+"+++++"+search_input);			
	//var storage=window.localStorage;
	var cat=storage.getItem("category");
	console.log(cat);
	
	$.ajax({
		url:"booksSearch",
		type:"get",
		async: false,//失去ajax异步的优点
		data:{"search_con":search_con,"search_input":search_input,"cat":cat},
		success:function(data){
			console.log("data::"+data);
			if(data=="searchByCat"){
				flag2=1;
			}
			if(data=="flush"){
				location.href="category1.jsp";
			}
		},
		error:function(){
			
		}
	})
	if(flag2==1){
		checkByCat(cat);
	}
});

//分页
function tab(curPage){
	var category=storage.getItem("category");
	var pageSize=document.getElementById("pageSize").value;
	console.log("category:++"+category+"pageSize:+++"+pageSize);
	var sortCat=storage.getItem("sortCat");
	var whichSort=storage.getItem("whichSort");
	var minPrice=storage.getItem("minPrice");
	var maxPrice=storage.getItem("maxPrice");
	console.log("srotCat:"+sortCat+"++whichSort:"+whichSort);
	if(sortCat==undefined||whichSort==undefined){
		//alert("分页没有排序");
		$.ajax({
			url:'booksSearchByCat2?category='+category+"&&curPage="+curPage+"&&pageSize="+pageSize,
			type:"get",
			success:function(data){
				location.href =data; 
			},
			error:function(){
				
			}
		});	
	}else{
		//分页有排序
		$.ajax({
			url:'sort',
			type:"get",
			data:{"cat":category,"sortCat":sortCat,"whichSort":whichSort,"curPage":curPage,"minPrice":minPrice,"maxPrice":maxPrice},
			success:function(){
				location.href="category1.jsp";
			},
			error:function(){
				
			}
		})
	}
	
}


//--------------------------------------------------排序------------------------------------------------
var b_sale_num_show=document.getElementById("b_sale_num_show");
var b_discount_show=document.getElementById("b_discount_show");
var b_add_time_show=document.getElementById("b_add_time_show");
var b_price_show=document.getElementById("b_price_show");


$("#b_sale_num").hover(function(){
	b_sale_num_show.style.display="block";
},
function(){
	b_sale_num_show.style.display="none";
});

//根据已卖数量排序
$("#b_sale_num").click(function(){
	storage.setItem("sortCat","b_sale_num");
	storage.setItem("whichSort","desc");
	sort("b_sale_num","desc");
})

$("#b_discount").hover(function(){
	b_discount_show.style.display="block";
},function(){
	b_discount_show.style.display="none";
})

//按照折扣查询
$("#b_discount").click(function(){
	//var storage=window.localStorage;
	storage.setItem("sortCat","b_discount");
	storage.setItem("whichSort","asc");
	sort("b_discount","asc");
})

$("#b_add_time").hover(function(){
	b_add_time_show.style.display="block";
},function(){
	b_add_time_show.style.display="none";
})

//按照添加时间时间查找
$("#b_add_time").click(function(){
	storage.setItem("sortCat","b_add_time");
	storage.setItem("whichSort","desc");
	sort("b_add_time","desc");
})

var angle_up=document.getElementById("angle_up");
var angle_down=document.getElementById("angle_down");
var storage=window.localStorage;
if(storage.getItem("flag")==undefined){
	storage.setItem("flag","asc");	
}
var flag=storage.getItem("flag");
$("#b_price").hover(function(){
	if(flag=="asc"){
		b_price_show.style.display="block";
		angle_up.style.color="#f8981d";
		b_price_show.innerHTML="按照价格升序";
		storage.setItem("flag","desc");
		return;
	}
	if(flag=="desc"){
		b_price_show.style.display="block";
		angle_down.style.color="#f8981d";
		b_price_show.innerHTML="按照价格降序";
		storage.setItem("flag","asc");
		return;
	}    
},function(){
		angle_up.style.color="#000000";
		b_price_show.style.display="none";
})


//按照价格排序
$("#b_price").click(function(){
	if(flag=="asc"){
		storage.setItem("sortCat","b_price");
		storage.setItem("whichSort","asc");
		sort("b_price","asc");
	}
	if(flag=="desc"){
		storage.setItem("sortCat","b_price");
		storage.setItem("whichSort","desc");
		sort("b_price","desc");
	}
})


//background-color:#f8981d;color:#ffffff"
//按照输入的价格区间查询
var submit=document.getElementById("input_button_submit");
var reset=document.getElementById("input_button_reset");

$("#input_button_submit").hover(function(){
	submit.style.backgroundColor="#d8160f";
},function(){
	submit.style.backgroundColor="#f8981d";
})
$("#input_button_reset").hover(function(){
	reset.style.backgroundColor="#5a5856";
},function(){
	reset.style.backgroundColor="#CDC9C9";
})

$("#input_left").click(function(){
	submit.style.display="block";
	reset.style.display="block";
})
$("#input_right").click(function(){
	submit.style.display="block";
	reset.style.display="block";
})

$("#input_button_submit").click(function(){
	var left_value=$("#input_left").val();
	var right_value=$("#input_right").val();
	//console.log("left:"+left_value+"right:"+right_value);
	if((left_value==""||left_value=="undefined")&&(right_value==""||right_value=="undefined")){
		return;
	}
	storage.setItem("minPrice",left_value);
	storage.setItem("maxPrice",right_value);
	sortBetweenPrice("b_price","desc",left_value,right_value);
	
})
function sort(sortCat,whichSort){
	var storage=window.localStorage;
	var cat=storage.getItem("category");
	//alert("cat:"+cat+"sortCat:"+sortCat+"whichSort:"+whichSort);
	$.ajax({
		url:'sort',
		data:{"cat":cat,"sortCat":sortCat,"whichSort":whichSort},
		success:function(){
			location.href="category1.jsp";
		},
		error:function(){
			
		}
	});
}

 function sortBetweenPrice(sortCat,whichSort,minPrice,maxPrice){
	var storage=window.localStorage;
	var cat=storage.getItem("category");
	
	$.ajax({
		url:'sort',
		data:{"cat":cat,"sortCat":sortCat,"whichSort":whichSort,"minPrice":minPrice,"maxPrice":maxPrice},
		success:function(){
			location.href="category1.jsp";
		},
		error:function(){
			
		}
	})
} 
</script>
</html>
