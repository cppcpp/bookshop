<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookList</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
<script src="js/books.js"></script>

</head>
<body>
<div id="wrap">
       <div class="right_content" style="background: white;width: 72.2%;float: left;height:500px;">
       		 <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>图书信息修改</div>
     		<br/>
     		<div>
     			<input type="text" placeholder="书籍搜索" class="cate-in">
     			<i class="fa fa-search" style="font-size:20px;color:#f8981d;margin-left: 10px;margin-bottom: 20px;"></i>
     		</div>
     		
     		<div style="margin-left:40px;">
     			<div class="category_margin"><b class="cate_a" title="a">马克思主义、列宁主义、毛泽东思想(A)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="b" style="cursor: pointer;">哲学(B)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="c" style="cursor: pointer;">社会科学(C)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="d" style="cursor: pointer;">政治、法律(D)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="e" style="cursor: pointer;">军事(E)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="f" style="cursor: pointer;">经济(F)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="g" style="cursor: pointer;">文化、科学、教育、体育(G)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="h" style="cursor: pointer;">语言、文字(H)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="i" style="cursor: pointer;">文学(I)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="j" style="cursor: pointer;">艺术(J)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="k" style="cursor: pointer;">历史、地理(K)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="n" style="cursor: pointer;">自然科学总论(N)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="o" style="cursor: pointer;">数理科学和化学(O)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="p" style="cursor: pointer;">天文学、地球科学(P)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="q" style="cursor: pointer;">生物科学(Q)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="r" style="cursor: pointer;">医药、卫生(R)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="s" style="cursor: pointer;">农业科学(S)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="t" style="cursor: pointer;">工业科学(T)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="u" style="cursor: pointer;">交通运输(U)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="v" style="cursor: pointer;">航空、航天(V)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="x" style="cursor: pointer;">环境科学(X)</b></div>
	     		<div class="category_margin"><b class="cate_a" title="z" style="cursor: pointer;">综合性图书(Z)</b></div>
            </div>
            
       </div><!-- end of left content -->
</div>
</body>
</html>