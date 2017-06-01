$(function(){
	//js全选功能
	$("#choseAll").click(function(){
		//当状态是选中时
		if($(this).is(':checked')){
			$('input:checkbox').each(function() {
		        $(this).attr('checked', true);
			});
		}else{
			$('input:checkbox').each(function() {
		        $(this).attr('checked', false);
			});
		}
	});

	var flag=0;
	function deleteBook(id){
		$.ajax({
			url:'deleteBook?id='+id,
			type:"get",
			async: false,
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
		if(flag==1){
		//删除成功后页面跳转
		location.href ="booksList"; 
		}
	})


	//多个删除
	$("#mulDelete").click(function(){
		$('input:checkbox').each(function() {
	        if($(this).is(':checked')){
	        	var temp=$(this).val();
	        	//alert(temp);
	        	deleteBook(temp);
	        }
		});
		location.href="booksList";
	});

	//增加输入图书信息验证
	function checkBookId(){
		var inputId=$("#b_id").val();
		$.ajax({
			type:'get',
			url:'booksIdCheck',
			data:inputId,
			success:function(data){
				if(data=="exit"){
					alert("id已经存在，请重新输入");
				}
			},
			error:function(){
			}
		});
	}
	
	
	//购物车中复选框中的全选与反选
    $(".selectAll").click(function () {
        //alert("sddsd");
        if (this.checked) {
        	var num = 0,n=0;
        	var m = document.getElementsByClassName("sum_money");
        	for(var i = 0;i<m.length;i++){
        		num += Number(m[i].innerHTML);
        	}
            //alert(this.checked);
        	$(".ac_money").html(num.toFixed(2));
            $(".selectSub").prop("checked", true);
            
            $(".selectSub").click(function () {
            	$(".selectAll").prop("checked", false);
            	
            	var no = this.parentNode.parentNode;
            	//alert(no);
            	var td = no.childNodes;
            	//alert(td[11].innerHTML);
            	/*var shu = td[11].childNodes;
            	//alert(shu[3].value);
            	shu[3].value = 0;*/
            	//alert(td[13].innerHTML);
            	n = Number(num) - Number(td[13].innerHTML);
            		
            	$(".ac_money").html(n.toFixed(2));
                
            });
            
        } else {
            //alert(this.checked);
        	var r = 0.00;
            $(".selectSub").prop("checked", false);
            $(".ac_money").html(r.toFixed(2));
        }
    });


    //购物车  当所有子复选框都选中  总的复选框也同样选中
    $(".selectSub").change(function () {
    	$(".selectAll").prop("checked", false);
        var total = 0;
        var compare = 0,n = 0;
        $(".selectSub").each(function () {
            compare += 1;
            if (this.checked) {
                total += 1;
                var no = this.parentNode.parentNode;
                //alert(no);
                var td = no.childNodes;
                //alert(td[13].innerHTML);
                n += Number(td[13].innerHTML);
            }
            
        });
        //console.log(compare);
        //console.log(total);
        if (total == compare) {
            $(".selectAll").prop("checked", true);
            
        }
        $(".ac_money").html(n.toFixed(2));
    });
   
	
	/*var plus = document.getElementsByClass("plus");
	var text = document.getElementsByClass("num-text");
	var i = text.value;
	//alert(i);
    //alert(plus);
    plus.onclick = checkPlus;
    function checkPlus() {
    	i = Number(i)+1
		//alert("sadfads");
    	text.value = i;
	}
    
    var desc = document.getElementsByClass("desc");
	//alert(i);
    //alert(plus);
    desc.onclick = checkDesc;
    function checkDesc() {
    	i = Number(i)-1
		//alert("sadfads");
    	text.value = i;
	}*/
    
    //购物车中的增加和减少数量的功能
    $(".plus").click(function(){
    	//alert(this.value);
    	//获取总价列
    	var sum_money = this.parentNode.nextSibling;
    	while(sum_money.nodeName=="#text"){
    		sum_money = sum_money.nextSibling;
    	}
    	
    	//获取打折单价列
    	var price = this.parentNode.previousSibling.previousSibling;
    	while(price.nodeName=="#text"){
    		price = price.nextSibling;
    	}
    	every_price = Number(price.innerHTML);
    	 	
    	//获取原单价
    	/*var ac_price = this.parentNode.previousSibling.previousSibling.previousSibling.previousSibling;
    	var every_ac_price = Number(ac_price.innerHTML);*/
    	
    	
    	//改变数量
    	var num = this.previousSibling;
    	while(num.nodeName=="#text"){
    		num = num.previousSibling;
    	}
    	var num_text = num.value ;
    	num_text = Number(num_text)+1;
    	num.value = num_text;
    	sum_money.innerHTML = (num_text*every_price).toFixed(2);
    	
    	
    	//获取复选框
    	var check = this.parentNode.parentNode.childNodes;
    	//alert(check[1].innerHTML)
    	subCheck = check[1].childNodes;
    	//alert(subCheck[0].nodeName)
    	
    	//获取总价
    	//var zongjia = this.parentNode.parentNode.nextSibling;
    	//$(".money").html((every_ac_price*num_text).toFixed(2));
    	//$(".ac_money").html((every_price*num_text).toFixed(2));
    	
    	//获取总价
    	/*var a = document.getElementsByClassName("price");
    	var b = 0;
    	for(var i=0;i<a.length;i++){
    		b += Number(a[i].innerHTML);
    	}*/
    	var c = document.getElementsByClassName("sum_money");
    	var d = 0;
    	for(var i=0;i<c.length;i++){
    		d += Number(c[i].innerHTML);
    	}
    	//$(".money").html(b.toFixed(2));
    	if(subCheck[0].checked){
    		//alert("sdfsd");
    		$(".ac_money").html(d.toFixed(2));
    	}
    	
    })
    
    
    $(".desc").click(function(){
    	
    	//获取总价列
    	var sum_money = this.parentNode.nextSibling;
    	while(sum_money.nodeName=="#text"){
    		sum_money = sum_money.nextSibling;
    	}
    	
    	//获取单价列
    	var price = this.parentNode.previousSibling.previousSibling;
    	while(price.nodeName=="#text"){
    		price = price.nextSibling;
    	}
    	every_price = Number(price.innerHTML);
    	
    	//原单价列
    	/*var ac_price = this.parentNode.previousSibling.previousSibling.previousSibling.previousSibling;
    	var every_ac_price = Number(ac_price.innerHTML);*/
    	
    	//获取复选框
    	var check = this.parentNode.parentNode.childNodes;
    	//alert(check[1].innerHTML)
    	subCheck = check[1].childNodes;
    	//alert(subCheck[0].nodeName)
    	
    	//alert("fsd");
    	var num = this.nextSibling;
    	while(num.nodeName=="#text"){
    		num = num.nextSibling;
    	}
    	var num_text = num.value;
    	num_text = Number(num_text)-1;
    	if(num_text<=1){
    		num_text=1;
    	}
    	num.value = num_text;
    	sum_money.innerHTML =  (num_text*every_price).toFixed(2);
    	
    	//$(".ac_money").html((every_price*num_text).toFixed(2));
    	//获取总价
    	/*var a = document.getElementsByClassName("price");
    	var b = 0;
    	for(var i=0;i<a.length;i++){
    		b += Number(a[i].innerHTML);
    	}*/
    	var c = document.getElementsByClassName("sum_money");
    	var d = 0;
    	for(var i=0;i<c.length;i++){
    		d += Number(c[i].innerHTML);
    	}
    	
    	if(subCheck[0].checked){
    		//alert("sdfsd");
    		$(".ac_money").html(d.toFixed(2));
    	}
    	//$(".money").html(b.toFixed(2));
    });
    
    
    //点击编辑的按钮
    $(".edit-text").click(function() {
    	//alert(this);
    	var title = this.title.trim();
		var tr = this.parentNode.parentNode;
		var td = tr.childNodes;
		var price = td[7].innerHTML.trim();
		var dis_price = td[9].innerHTML.trim();
		//alert(dis_price);
		var inputs = td[11].childNodes;
		if(checkYN(inputs[1])){
			//完成编辑，存入数据库中
			inputs[3].disabled = true;
			inputs[1].style.display = "none";
			inputs[5].style.display = "none";
			this.value = "编辑";
			var v = inputs[3].value;
			cartRequest = createRequest();
			var url = "cartservlet?number="+v+"&b_id="+title+"&price="+price+"&dis_price="+dis_price;
			cartRequest.open("GET",url, true);
			cartRequest.onreadystatechange = cartHandle;
			cartRequest.send(null);
			//alert("dasd");
			
		}else{
			//开始编辑
			inputs[3].disabled = false;
			inputs[1].style.display = "inline";
			inputs[5].style.display = "inline";
			this.value = "完成";
		}
		//alert(inputs[1]);
		//alert(inputs[3]);
		//alert(inputs[5]);
		//$(this).removeClass("edit-text");
	})
	
	//检验 数据库的数量是否在编辑的状态
	function checkYN(ele) {
    	//alert(ele.style.dispaly);
		if(ele.style.display=="inline"){
			return true;
		}
		if(ele.style.display=="none"){
			return false;
		}
	}
    
    
    //ajax异步请求对象 
    function createRequest(){
    	try {
    		var request = new XMLHttpRequest();
    	} catch (tryMS) {
    		try {
    			request = new ActiveXObject("Msxml2.XMLHTTP");
    		} catch (otherMS) {
    			try {
    				request = new ActiveXObject("Microsoft.XMLHTTP");
    			} catch (failed) {
    				request = null;
    			}
    		}
    	}
    	return request;
    }
    
    function cartHandle() {
    	if(cartRequest.readyState==4){
			if(cartRequest.status==200){
				if(cartRequest.responseText.trim()=="okay"){
					//alert("写入session成功");
				}
			}
		}
	}
    
    /*window.onbeforeunload=function (){
    	if(event.clientX>document.body.clientWidth && event.clientY < 0 || event.altKey){
    		alert("你关闭了浏览器");
    	}else{
    		alert("你正在刷新页面");
    	}
    }*/

    //购物车中的删除
    $("#delete").click(function() {
		var tr = this.parentNode.parentNode;
		var td = tr.childNodes;
		//alert(tr.title);
		var index = Number(tr.title);
		var table = document.getElementById("cart-table");
		table.deleteRow(index+1);
		//删除表格后  session中的cart值需要改变  ajax请求
		//获取当前的b_id
		b_idImg = td[3].childNodes;
		var s = b_idImg[0].src;
		var str = s.split("/");
		var b_ida = str[str.length-1];
		var b_idb = b_ida.split(".");
		var b_id = b_idb[0];
		//alert(b_id);
		deleteRequest = createRequest();
		var url = "delete?b_id="+b_id;
		deleteRequest.open("GET",url,true);
		deleteRequest.onreadystatechange = deletehandler;
		deleteRequest.send(null);//转到后台对session进行删除
		
	})
	
	//ajax后台处理完成之后转到前台进行显示
	function deletehandler() {
		if(deleteRequest.readyState==4){
			if(deleteRequest.status==200){
				console.log("删除成功");
			}
		}
	}
})


