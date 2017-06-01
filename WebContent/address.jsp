<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息管理</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/books.css" />
<script src="js/jquery-2.2.3.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$("#new_huo").click(function() {
			$(".newhuo").slideDown();
		})
		$(".circles").click(function() {
			$(".newhuo").slideUp();
		})
	})
</script>
<body>
	<div class="wrap">
		<div class="right_content"
			style="background: white; width: 79.5%; float: left; height: auto;">
			<div class="title">
				<span class="title_icon"><img src="images/bullet1.gif" alt=""
					title="" /></span>收货地址管理
			</div>
			<br />
			<br />
			<br />
			<br />
			<!-- 写内容 -->
			<input type="button" value="增加收货地址" class="pass_button"
				style="margin-bottom: 20px;" id="new_huo">


			<c:forEach var="add" items="${sessionScope.myAddresses}">
				<form action="MineAllNew" method="post">
					<div class="huo">
						<div>
							<b class="pass_update">收货人</b><input type="text"
								value="${add.o_receiver}" class="pass-input" name="o_receiver">
						</div>
						<div>
							<b class="pass_update">收货地址</b><input type="text"
								value="${add.u_address}" class="pass-input" name="o_address">
						</div>
						<div>
							<b class="pass_update">收货人电话</b><input type="text"
								value="${add.o_phone}" class="pass-input" name="o_phone">
						</div>
						<div>
							<b class="pass_update">是否默认</b><input type="radio" name="default">
						</div>
						<input type="hidden" value="${add.u_addr_id}" name="uAddrId">
						<input type="submit" value="修改" class="pass_button" name="update">
						<input type="submit" value="删除" class="pass_button" name="delete">
					</div>
				</form>
			</c:forEach>
			<!--  点击增加按钮，增加收货地址的div-->
			<form action="MineAllNew" method="post">
				<div class="newhuo">
					<div class="circles" style="margin-top: -8%;">X</div>
					<div>
						<b class="pass_update">收货人</b><input type="text"
							class="pass-input" name="o_receiver">
					</div>
					<div>
						<b class="pass_update">收货地址</b><input type="text"
							class="pass-input" name="o_address">
					</div>
					<div>
						<b class="pass_update">收货人电话</b><input type="text"
							class="pass-input" name="o_phone">
					</div>
					<div>
						<b class="pass_update">是否默认</b><input type="radio" name="default">
					</div>
					<input type="hidden" value="" name="uAddrId"> <input
						type="submit" value="确定" class="pass_button" name="add">
				</div>
			</form>

		</div>
		<!-- end of left content  o_receiverAdd  o_addressAdd o_phoneAdd defaultAdd uAddrIdAdd-->
	</div>
</body>
</html>