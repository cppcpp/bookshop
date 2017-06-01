<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookCate</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/books.js"></script>
<style type="text/css">
#div2{
	background: #f8981d;
    display:none;
    width: 280px;
    height: 280px;
    position: fixed;
    left: 50%;
    top: 50%;
    margin-top: -150px;
    margin-left: -230px;
    padding-left: 30px;
    padding-top:30px;
    background: #f8981d;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;   
}
#div3{
	background-color: #9de;
	height:300px;
	display:none;
}
ul{
	float: left;
}
ul li{
	list-style: none;
	float: left;
}
.book{
	color：black;
	float:left;
	text-align:center;
	padding:10px;
	height:auto;
	display: inline-block;
	margin-right: 50px;
	margin-left: -30px;
}
.book_left{
	display:inline;
	float：left;
	height:300px;
}
.book_right{
	margin-right:-20px;
	color：black;
	display:inline;
	height:300px;
	width:230px;
}
.book_input{
	border-radius: 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border:1px solid #795636;
    margin-top: 3px;
    margin-bottom: 3px;
    white-space:nowrap;
	text-overflow:ellipsis;
	overflow: hidden;
	width: 170px;
}
.dn{
	border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border: 1px solid #f8981d;
    background:#795636;
    color:white;
    height:25px;
    width: 100px;
    margin-left: 25%;
    margin-top: 10px;
}


</style>
</head>
<body>
<div class="wrap">
    <div class="right_content" style="background: white;width: 79.5%;;float: left;height:auto">
	    <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>图书信息</div>
      	<br/><br/><br/><br/>
     		<!-- <div>
     			<input type="text" placeholder="书籍搜索" class="cate-in">
     			<i class="fa fa-search" style="font-size:20px;color:#f8981d;margin-left: 10px;margin-bottom: 20px;"></i>
     		</div>	 -->
     		
     		<!-- 修改按钮 -->
		<div id="div2">
			<div class="circles" style="margin-top: -30px;">X</div>
			<form action="booksModify" method="get" >
				<!-- 设置book_id不可修改  disabled="true"request得不到    readonly="true"request可以取到-->
				<b style="width: 70px;float: left">图书Id</b> <input type="text" class="book_input" name="book_id" value="" readonly="true"><br>
				<b style="width: 70px;float: left">图书名称</b><input type="text" class="book_input" name="book_name" value=""><br>
				<b style="width: 70px;float: left">图书描述</b><input type="text" class="book_input" name="book_description" value=""><br>
				<b style="width: 70px;float: left">图书价格</b><input type="text" class="book_input" name="book_price" value=""><br>
				<b style="width: 70px;float: left">图书折扣</b><input type="text" class="book_input" name="book_discount" value=""><br>
				<b style="width: 70px;float: left">图书作者</b><input type="text" class="book_input" name="book_author" value=""><br>
				<b style="width: 70px;float: left">图书出版社</b><input type="text" class="book_input" name="book_press" value=""><br>
				<b style="width: 70px;float: left">出版时间</b><input type="text" class="book_input" name="book_press_time" value=""><br>
				<b style="width: 70px;float: left">图书服务</b><input type="text" class="book_input" name="book_service" value=""><br>
				<input type="submit" value="提交" name="submitButton" class="dn">
			</form>

		</div>

		<div class="a_b">
			<select name="search_con" id="search_con">
				<option>请选择搜索类型</option>
				<option value="b_name" selected="selected">书名</option>
				<option value="b_press">出版社</option>
				<option value="b_author">作者</option>
				<!-- <option value="search_bookCategory">书目类别</option> -->
			</select>
			<input type="text" name="search_input" id="search_input" >
			<input type="submit" value="搜索" id="search_button" name="searchButton">
			<!-- ------------------------------------全选--------------------------------- -->
			<input type="checkbox" id="choseAll">
			<input type="button" name="b_id" value="多条删除" id="mulDelete">
		</div>


		<c:forEach var="b" items="${sessionScope.booksList}">
			<div class="book">
					<div class="book_left">
					 <img src="book_images/${b.b_id}.jpg" style="width:100px;height:100px;float:left">
					</div>
					<div class="book_right" style="float: left;margin-left: -20px;">
						<ul style="float:left;">
							<li class="li_book"><b style="color:#f8981d">选择：</b><input id='${b.b_id}' type='checkbox' value='${b.b_id }'/></li>
							<li title="book_id"  class="li_book"><b style="color:#f8981d">编号：</b>${b.b_id}</li>
							<li title="book_name"  class="li_book"><b style="color:#f8981d">名称：</b>${b.b_name}</li>
							<li title="book_description" class="li_book"><b style="color:#f8981d">图书描述：</b>${b.b_description}</li>
							<li title="book_price" class="li_book"><b style="color:#f8981d">价格：</b>${b.b_price}</li>
							<li title="book_discount" class="li_book"><b style="color:#f8981d">折扣：</b>${b.b_discount}</li>
							<li title="book_author" class="li_book"><b style="color:#f8981d">作者：</b>${b.b_author}</li>
							<li title="book_press" class="li_book"><b style="color:#f8981d">出版社：</b>${b.b_press}</li>
							<li title="book_press_time" class="li_book"><b style="color:#f8981d">出版时间：</b>${b.b_press_time}</li>
							<li title="book_service" class="li_book"><b style="color:#f8981d">服务：</b>${b.b_service}</li>
							<li title="book_num" class="li_book"><b style="color:#f8981d">已售数量：</b>${b.b_sale_num}</li>
							<li title="book_time" class="li_book"><b style="color:#f8981d">上架时间：</b>${b.b_add_time}</li>
							<input type="button" value="删除" class="singleDelete" name="${b.b_id}">
							<input type="button" value="修改" class="singleModify" name="${b.b_id}">
						</ul>
					</div>
			</div>
		</c:forEach>
		<br/>
       		<!-- 设置每页几条  -->
       		<div style="display: block;width:500px;margin-left: 20%;">
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

	</div><!-- end of div1-->
</div><!-- end of right_content -->
</body>
<script>
function tab(curPage){
	var storage=window.localStorage;
	var category=storage.getItem("category");
	var pageSize=document.getElementById("pageSize").value;
	console.log(pageSize);
	//console.log("种类：：："+category);
	 $.ajax({
		url:'booksSearchByCat?category='+category+"&&curPage="+curPage+"&&pageSize="+pageSize,
		type:"get",
		success:function(data){
			console.log(data)
			location.href =data; 
		},
		error:function(){
			
		}
	});
}
</script>
</html>