/**
 * by
 * ztchun
 */
$(function() {

	$("#other_address").click(function() {
		//弹框显示
		$(".address-all").slideDown();
		
		//alert(radios.length);
		/*for(var i = 0;i<radios.length;i++){
			//alert(radios[i].value);
			radios[i].onclick = function() {
				alert(this.value);
			};
		}*/
	});
	
	$(".circles").click(function() {
		//弹框消失
		$(".address-all").slideUp();
	})
	
	
	$("#add_address").click(function() {
		$(".add_address").slideDown();
	})
	
	$(".circle").click(function() {
		//弹框消失
		$(".add_address").slideUp();
	})
	
	
	function radioClick() {
		alert(this.value);
	}
	
	//选择其他地址  确定的时候触发事件
	$(".address_button").click(function() {
		//选中数据
		//alert("sdf");
		var radios = document.getElementsByClassName("radio_address");
		//radios = address.cate;
		//radios[1].checked=true;
		for(var i = 0;i<radios.length;i++){
			if(radios[i].checked){
				var div = radios[i].parentNode;
				var children = div.childNodes;
				//alert(children[4].innerHTML);//收货人姓名
				//alert(children[8].innerHTML);//收货地址
				//alert(children[12].innerHTML);//联系方式
				var person = children[4].innerHTML;
				var address = children[8].innerHTML;
				var phone = children[12].innerHTML;
				
				$("#huo_person").html(person);
				$("#huo_address").html(address);
				$("#huo_phone").html(phone);
				$("#a_person").value = person;
				$("#a_address").value = address;
				$("#a_phone").value = phone;
				
			}
		}
		$(".address-all").slideUp();
		
	});
	
	
	//增加收货地址 确定时触发的事件  需要改变页面上的收货信息  并且写入数据库  ajax请求
	$(".add_address_button").click(function() {
		//改变页面的收获信息
		var person = document.getElementById("add_person").value;
		var address = document.getElementById("add_address_info").value;
		var phone = document.getElementById("add_phone").value;
		var radio_check = document.getElementById("radio_check");
		//alert(radio_check.checked)
		if(radio_check.checked){
			check_radio = 1;
		}else{
			check_radio = 0;
		}
		//alert(check_radio);
		
		$("#huo_person").html(person);
		$("#huo_address").html(address);
		$("#huo_phone").html(phone);
		$("#a_person").value = person;
		$("#a_address").value = address;
		$("#a_phone").value = phone;
		
		//写入数据库
		add_addressRequest = createRequest();
		var data = "person="+person+"&address="+address+"&phone="+phone+"&check_radio="+check_radio;
		add_addressRequest.open("post","add_address");
		add_addressRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		add_addressRequest.onreadystatechange = addressHandle;
		add_addressRequest.send(data);
		
		$(".add_address").slideUp();
	})
	
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
	
	
	function addressHandle(){
		//alert(add_addressRequest.readyState);
		if(add_addressRequest.readyState==4){
			if(add_addressRequest.status==200){
				if(add_addressRequest.responseText=="okay"){
					alert("收货地址增加成功");
				}
			}
		}
	}
});