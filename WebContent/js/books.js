$(function(){
	//js全选功能
	$("#choseAll").click(function(){
		console.log("执行")
		//当状态是选中时
		if($(this).is(':checked')){
			console.log("选中")
			$('input:checkbox').each(function() {
				console.log("每一个都选中")
		        $(this).prop('checked', true);
			});
		}else{
			console.log("未选中")
			$('input:checkbox').each(function() {
				console.log("每一个都未选中")
		        $(this).prop('checked', false);
			});
		}
	});
	//input文本框随内容变换长度
	$('.book_input').bind('input propertychange', function() {
	    var $this = $(this);
	   // console.log($this);
	    var text_length = $this.val().length;//获取当前文本框的长度
	    var current_width = parseInt(text_length) *16;//该16是改变前的宽度除以当前字符串的长度,算出每个字符的长度
	   // console.log(current_width);
	    $this.css("width",current_width+"px");
	});
	//----------------------------查询图书的js-----------------------
	$("#search_con").change(function(){
		if(this.value=="search_bookCategory"){
			$("#div3").css("display","block");
			//让搜索按钮失效
			$("#search_button").attr("disabled", true); 
		}
	})

	var b=document.getElementsByTagName("b");
	for(var i=0;i<b.length;i++){
		b[i].onclick=function(){
			//console.log(this.title);
			checkByCat(this.title);
		}
	}

	function checkByCat(cat){
		//console.log(cat);
		if(!window.localStorage){
		    alert("浏览器支持localstorage");
		    return false;
		}else{
			var storage=window.localStorage;
			storage.setItem("category",cat);
			 //console.log("存cunc"+storage["category"]);
		}
		$.ajax({
			url:'booksSearchByCat?category='+cat,
			type:"get",
			success:function(data){
				location.href =data; 
			},
			error:function(){
				
			}
		});
	}
	
	var flag2=0;
	$("#search_button").click(function(){
		var search_con=$("#search_con").val();
		var search_input=$("#search_input").val();
		console.log(search_con+"+++++"+search_input);			
		var storage=window.localStorage;
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
					location.href="booksCart.jsp";
				}
			},
			error:function(){
				
			}
		})
		if(flag2==1){
			checkByCat(cat);
		}
	});

	//分页---放在这里找不到
	/*function tab(curPage){
		var storage=window.localStorage;
		var category=storage.getItem("category");
		var pageSize=document.getElementById("pageSize").value;
		//console.log(pageSize);
		//console.log("种类：：："+category);
		 $.ajax({
			url:'booksSearchByCat2?category='+category+"&&curPage="+curPage+"&&pageSize="+pageSize,
			type:"get",
			success:function(data){
				location.href =data; 
			},
			error:function(){
				
			}
		});
	}*/
	//----------------------------删除图书的js------------------------
	var flag=0;
	function deleteBook(id){
		$.ajax({
			url:'deleteBook?id='+id,
			type:"get",
			async: false,//失去ajax异步的优点
			success:function(data){
				if(data=="success"){
					//alert("删除成功");
					flag=1;
				}
				else if(data=="fail"){
					alert("失败！！！！！");
				}
			},
			error:function(XMLHttpRequest,textStatus, errorThrown){
	       	 alert(XMLHttpRequest.status);//200正常响应
	         alert(XMLHttpRequest.readyState);//4处理状态正常接收
	         alert(XMLHttpRequest.responseText);//返回响应文本
	         alert(textStatus);
	     }
		});
	}

	//单个删除
	$(".singleDelete").click(function(){
		var b_id=this.name;
		deleteBook(b_id);
		var cat=b_id.charAt(0);
		console.log("删除：："+cat);
		if(flag==1){
			console.log(cat);
		//删除成功后再查询此种类图书
		checkByCat(cat);
		}
	})



	//多个删除
	$("#mulDelete").click(function(){
		var temp;
		$('input:checkbox').each(function() {
	        if($(this).is(':checked')){
	        	temp=$(this).val();
	        	deleteBook(temp);
	        }
		});
		var cat=temp.charAt(0);
		checkByCat(cat);
	});

	//-----------------------修改图书的js------------------------------
	var length_book_description;
	var length_book_name;
	$(".singleModify").click(function(){
		//$("#div2").css("display","block");
		$("#div2").slideDown();
		var b_id=this.name;
		var ul=this.parentNode;
		console.log("ul::"+ul.title);
		var ulchilds=ul.childNodes;
		for(var i=0;i<ulchilds.length;i++){
			//console.log("li:::"+ulchilds[i].nodeName);
			if(ulchilds[i].nodeName=="LI"){			
				//console.log("li  title:::"+ulchilds[i].title);
				assignment(ulchilds[i]);
			}
		}
	});

	
	

	//给input的相应节点赋值
	function assignment(thNode){
		var input=document.getElementsByTagName("input");
		for(var k=0;k<input.length;k++){
			var name=input[k].name;
			if(name==thNode.title){
				input[k].value=thNode.lastChild.nodeValue;
				//设置input的宽度------------------------------未实现
				/*input[k].style.width=input[k].value.length;
				console.log("input[k].style.width:++"+input[k].style.width);*/
				/*if(name=="book_name"){
					length_book_name=input[k].value.length;
				}
				if(name=="book_description"){
					length_book_description=input[k].value.length;
				}*/
			}
		}
	}
	//-----------------------增加图书的js-------------------------------
	var b_id=$("#b_id").val();
	var b_name=$("#b_name").val();
	var b_desctiption=$("#b_desctiption").val();
	var b_price=$("#b_price").val();
	var b_discount=$("#b_discount").val();
	var b_author=$("#b_author").val();
	var b_press=$("#b_press").val();
	var b_press_time=$("#b_press_time").val();

	//图书id验证
	$("#b_id").blur(function(){
		var b_id=$("#b_id").val();
		if(b_id==""||b_id==null){
			//console.log("b-id："+b_id);
			$("#p_id").html("id不能为空！");
		}else{
			$("#p_id").html("");
		}
		$.ajax({
			type:'get',
			url:'booksIdCheck?inputId='+b_id,
			success:function(data){
				if(data=="exit"){
					$("#b_id").val("");
					$("#p_id").html("id已经存在，请重新输入");
				}
			},
			error:function(){
			}
		});
	})

	function checkNull(variable){
		if(variable==""||variable==null){
			$("#p_name").html("name不能为空！");
			return false;
		}else{
			$("#p_name").html("");
		}
	}
	
	$("#b_name").blur(function(){
		var b_name=$("#b_name").val();
		if(b_name==""||b_name==null){
			$("#p_name").html("name不能为空！");
			return false;
		}else{
			$("#p_name").html("");
		}
	})
	
	$("#b_description").blur(function(){
		var b_description=$("#b_description").val();
		if(b_description==""||b_description==null){
			$("#p_description").html("描述不能为空！");
			return false;
		}else{
			$("#p_description").html("");
		}
	})
	//价格的验证
	$("#b_price").blur(function(){
		var b_price=$("#b_price").val();
		//var reg_price=/(^[1-9]\d{0,2}\.\d{1,2})|(^[1-9]\d{0,2})/;
		var price=parseFloat(b_price);
		if(!(price>0&&price<=999.99)){
			$("#p_price").html("价格不满足条件");
			$("#b_price").val("");
		}else{
			$("#p_price").html("");
		}
	})
	//折扣的验证
	$("#b_discount").blur(function(){
		var b_discount=$("#b_discount").val();
		//var reg_discount=/^[1-9]\d{0,2}/;
		var discount=Number(b_discount);
		//alert(discount);
		if(!(discount>0 &&discount<=100)){
			$("#p_discount").html("折扣不满足条件");
			$("#b_discount").val("");
		}else{
			$("#p_discount").html("");
		}
	})
	$("#b_author").blur(function(){
		var b_author=$("#b_author").val();
		if(b_author==""||b_author==null){
			$("#p_author").html("作者不能为空！");
			return false;
		}else{
			$("#p_author").html("");
		}
	})
	$("#b_press").blur(function(){
		var b_press=$("#b_press").val();
		if(b_press==""||b_press==null){
			$("#p_press").html("出版社不能为空！");
			return false;
		}else{
			$("#p_press").html("");
		}
	})
	
	$("#b_press_time").blur(function(){
		var b_press_time=$("#b_press_time").val();
		if(b_press_time==""||b_press_time==null){
			$("#p_press_time").html("出版时间不能为空！");
			return false;
		}else{
			$("#p_press_time").html("");
		}
	})

	//增加图书信息为空的验证
	function checkAddStuNull(){
		var b_id=$("#b_id").val();
		var b_name=$("#b_name").val();
		var b_desctiption=$("#b_desctiption").val();
		var b_price=$("#b_price").val();
		var b_discount=$("#b_discount").val();
		var b_author=$("#b_author").val();
		var b_press=$("#b_press").val();
		var b_press_time=$("#b_press_time").val();
		if(b_id==""||b_id==null){
			$("#p_id").html("id不能为空！");
			return false;
		}else{
			$("#p_id").html("");
		}
		if(b_name==""||b_name==null){
			$("#p_name").html("name不能为空！");
			return false;
		}else{
			$("#p_name").html("");
		}
		if(b_description==""||b_description==null){
			$("#p_description").html("描述不能为空！");
			return false;
		}else{
			$("#p_description").html("");
		}
		if(b_author==""||b_author==null){
			$("#p_author").html("作者不能为空！");
			return false;
		}else{
			$("#p_author").html("");
		}
		if(b_press==""||b_press==null){
			$("#p_press").html("出版社不能为空！");
			return false;
		}else{
			$("#p_press").html("");
		}
		if(b_press_time==""||b_press_time==null){
			$("#p_press_time").html("出版时间不能为空！");
			return false;
		}else{
			$("#p_press_time").html("");
		}
		if(b_discount==""||b_discount==null){
			$("#p_discount").html("折扣不能为空！");
			return false;
		}else{
			$("#p_discount").html("");
		}
		if(b_price==""||b_price==null){
			$("#p_price").html("价格不能为空！");
			return false;
		}else{
			$("#p_price").html("");
		}
		return true;
	}
	
	$(".circles").click(function() {
		//弹框消失
		$("#div2").slideUp();
	})

})
