<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
</head>
<script type="text/javascript">
	
</script>
<body>
	<div class="wrap">
		<div class="right_content"
			style="background: white; width: 79.5%; float: left; height: auto;">
			<div class="title">
				<span class="title_icon"><img src="images/bullet1.gif" alt=""
					title="" /></span>所有订单
			</div>
			<br />
			<br />
			<br />
			<br />
			<!-- 写内容 -->
			<!-- 用户所有订单需要分页 ，这需要分页-->
			<form action="MineAllNew">
				<c:forEach var="orders" items="${sessionScope.myorders}">
					<div class="huo">
						<div>
							<b class="pass_update">下单时间</b><input type="text"
								value="${orders.o_time}">
						</div>
						<div>
							<b class="pass_update">订单编号</b><input type="text"
								name = "o_id" value="${orders.o_id}">
						</div>
						<div>
							<b class="pass_update">收货人</b><input type="text"
								value="${orders.o_receiver}">
						</div>
						<div>
							<b class="pass_update">订单数量</b><input type="text"
								value="${orders.o_num}">
						</div>
						<div>
							<b class="pass_update">订单总价</b><input type="text"
								value="${orders.o_price}">
						</div>
						<div>
							<b class="pass_update">订单优惠</b><input type="text"
								value="${orders.o_cheaper}">
						</div>
						<div>
							<b class="pass_update">商品信息</b>
							<table>
								<c:forEach var="orderDetailList"
									items="${sessionScope.orderDetailList}">
									<c:if test="${orderDetailList.o_id == orders.o_id}">
									<tr>
										<td><img src="book_images/${orderDetailList.b_id}.jpg"
											class="cart-img"></td>
										<td>${orderDetailList.b_name}</td>
									</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
						<input type="submit" value="删除" class="pass_button">
					</div>
				</c:forEach>
			</form>

		</div>
		<!-- end of left content -->
	</div>

</body>
</html>