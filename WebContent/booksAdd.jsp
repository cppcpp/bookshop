<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/books.js"></script>
<title>Book Store</title>
</head>

<style type="text/css">

</style>

<body>
<div id="wrap">
       <div class="right_content" style="background: white;width: 72.2%;float: left;height:auto;">
       		 <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>增加图书</div>
     			<form action="booksAdd" method="post" class="addBooks" enctype="multipart/form-data">
					<table class="add_table">
						<tr class="book_id">
							<td class="id_text">图书id</td>
							<td class="id_put"><input type="text" name="book_id" id="b_id" class="input-book"></td>
							<td><p id="p_id"></p></td>
						</tr>
						<tr class="book_name">
							<td class="name_text">图书名称</td>
							<td class="name_input"><input type="text" name="book_name" id="b_name" class="input-book"></td>
							<td><p id="p_name"></p></td>
						</tr>
						<tr>
							<td>图书图片</td>
							<td colspan="2"><input type="file" name="book_pic" ></td>
						</tr>
						<tr class="book_desc">
							<td class="desc_text">描述</td>
							<td class="desc_input"><input type="text" name="book_description" id="b_description" class="input-book"></td>
							<td><p id="p_description"></p></td>
						</tr>
						<tr class="book_price">
							<td class="price_text">单价</td>
							<td class="price_input"><input type="text" name="book_price" id="b_price" class="input-book"></td>
							<td><p id="p_price"></p></td>
						</tr>
						<tr  class="book_disc">
							<td class="disc_text">折扣（百分制）</td>
							<td class="disc_input"><input type="text" name="book_discount" id="b_discount" class="input-book"></td>
							<td><p id="p_discount"></p></td>
						</tr>
						<tr class="book_author">
							<td class="author_text">作者</td>
							<td class="author_input"><input type="text" name="book_author" id="b_author"  class="input-book"></td>
							<td><p id="p_author"></p></td>
						</tr>
						<tr class="book_press">
							<td class="press_text">出版社</td>
							<td class="press_input"><input type="text" name="book_press" id="b_press"  class="input-book"></td>
							<td><p id="p_press"></p></td>
						</tr>
						<tr class="book_press_time">
							<td class="time_text">出版时间</td>
							<td class="time_input"><input type="date" name="book_press_time" id="b_press_time" class="input-book"></td>
							<td><p id="p_input_time"></p></td>
						</tr>
						<tr class="book_server">
							<td class="server_text">店铺服务</td>
							<td class="server_input"><input type="text" name="book_service"  class="input-book"></td>
							<td><p id="p_server"></p></td>
						</tr>
						<tr><td colspan="3"><input type="submit" value="提交" onclick="return checkAddStuNull()" class="add_submit"></td></tr>
					</table>
				</form>
				<!-- <a href="booksList">所有图书列表</a> -->
            
        	<div class="clear"></div>
       </div><!-- end of left content -->
</div>
       <!-- <div class="center_content" style="background: white">
       <div class="left_content" style="width:20%;">
       		<ul class="list">
       			<li class="no-select-cat tag"><a href="booksAdd.jsp">增加图书</a></li>
       			<li class="no-select-cat tag"><a href="booksAdd.jsp">图书分类整理</a></li>
       			<li class="no-select-cat tag"><a href="booksAdd.jsp">图书销售折线图</a></li>
       			<li class="no-select-cat tag"><a href="booksAdd.jsp">用户订单信息管理</a></li>
       			<li class="no-select-cat tag"><a href="booksAdd.jsp">图书销售折线图</a></li>
       			<li class="no-select-cat tag"><a href="booksList">图书列表</a></li>
       			
       		</ul>
       </div>end of left content
       	<div class="right_content" style="width:60%;float: left">       	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>增加图书</div>
     			enctype="multipart/form-data"
     			<form action="booksAdd" method="post" class="addBooks">
					<table class="add_table">
						id设置自增
						<tr class="book_id">
							<td class="id_text">图书id</td>
							<td class="id_put"><input type="text" name="book_id" id="b_id" onblur="checkBookId()"></td>
							<td><p id="p_id"></p></td>
						</tr>
						<tr class="book_name">
							<td class="name_text">图书名称</td>
							<td class="name_input"><input type="text" name="book_name" id="b_name" onblur="checkBookName()"></td>
							<td><p id="p_name"></p></td>
						</tr>
						<tr>
							<td></td>
							<td>图书图片</td>
							<td><input type="file" name="book_pic"></td>
						</tr>
						<tr class="book_desc">
							<td class="desc_text">描述</td>
							<td class="desc_input"><input type="text" name="book_description" id="b_description" onblur="checkBookDescription()"></td>
							<td><p id="p_description"></p></td>
						</tr>
						<tr class="book_price">
							<td class="price_text">单价</td>
							<td class="price_input"><input type="text" name="book_price" id="b_price" onblur="checkBookPrice()"></td>
							<td><p id="p_price"></p></td>
						</tr>
						<tr  class="book_disc">
							<td class="disc_text">折扣（百分制）</td>
							<td class="disc_input"><input type="text" name="book_discount" id="b_discount" onblur="checkBookDiscount()"></td>
							<td><p id="p_discount"></p></td>
						</tr>
						<tr class="book_author">
							<td class="author_text">作者</td>
							<td class="author_input"><input type="text" name="book_author" id="b_author" onblur="checkBookAuthor()"></td>
							<td><p id="p_author"></p></td>
						</tr>
						<tr class="book_press">
							<td class="press_text">出版社</td>
							<td class="press_input"><input type="text" name="book_press" id="b_press" onblur="checkBookPress()"></td>
							<td><p id="p_press"></p></td>
						</tr>
						<tr class="book_press_time">
							<td class="time_text">出版时间</td>
							<td class="time_input"><input type="date" name="book_press_time" id="b_press_time" onblur="checkBookPressTime()"></td>
							<td><p id="p_input_time"></p></td>
						</tr>
						<tr class="book_server">
							<td class="server_text">店铺服务</td>
							<td class="server_input"><input type="text" name="book_service"></td>
							<td><p id="p_server"></p></td>
						</tr>
						<tr><td colspan="2"><input type="submit" value="提交" onclick="return checkAddStuNull()"></td></tr>
					</table>
				</form>
				<a href="booksList">所有图书列表</a>
            
        	<div class="clear"></div>
        </div>end of right content
       <div class="clear"></div>
       </div>end of center content
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
        </div>
       </div> -->
</body>
</html>
