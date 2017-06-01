/**
 * Created by ztchun on 2016-12-9.
 */
$(function() {
	
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
    
    
    //用来控制按钮的是否可以按
    var checkA = false;
    var checkP = false;
    var checkE = false;
    var checkH = false;
    
    //用户名是否再重复  格式是否正确
    var u_account = document.getElementById("u-account") ;
    var btn = document.getElementById("btn");
    u_account.onblur = checkName;
    
    function checkName() {
		var length = u_account.value.length;
		//alert(length);
		if(length=="8"){
			var name_value = u_account.value;
			var userc= /^[A-Za-z0-9]+$/;
			if(!name_value.match(userc))
			{
				//u_account.focus()
				//alert("用户名只能是数字或者字母");
				//return false;
				//alert($(".account"));
				$(".user_error").css("display","none");
				$(".account").css("display","block");
				u_account.value = "";
				//return;
			}else{
				//var account = u_account.value;
				requestName = createRequest();
				var url = "registerAccount?u_account="+name_value;
				//console.log(account);
				requestName.open("GET",url, true);
				requestName.onreadystatechange = handleStateChange;
				requestName.send(null);
			}
		}else{
			//alert("请输入八位数字或者字符账号");
			//return ;
			$(".user_error").css("display","none");
			$(".account").css("display","block");
			u_account.value = "";
		}
	}
    
    //回调函数
    function handleStateChange() {
		if(requestName.readyState==4){
			if(requestName.status==200){
				//alert(request.responseText);
				if(requestName.responseText.trim()=="okay"){
					//alert("sdfas");
					$(".account").css("display","none");
					$(".user_error").css("display","none");
					checkA = true;
					registerChange();
					/*$("#btn").css("disabled","false");
					$("#btn").css("opacity","1.0");*/
				}else{
					$(".account").css("display","none");
					$(".user_error").css("display","block");
					//alert("用户名已被注册，请重新创建一个账号");
					//u_account.value = "";
				}
			}
		}
	}
    
    
    
    //检测password格式对否正确
    var password = document.getElementById("u_password");
    var checkPass = document.getElementById("checkPass");
    checkPass.onblur = checkPassword;
    
    
    function checkPassword() {
		var pass1 = password.value;
		var pass2 = checkPass.value;
		if(pass1==pass2){
			//alert("两个密码相同");
			checkP = true;
			$(".password").css("display","none");
		}else{
			//alert("密码符合格式");
			password.value = "";
			checkPass.value = "";
			$(".password").css("display","block");
		}
		registerChange();
	}
    
    
    
    //检测email填写的格式是否正确
    var u_email = document.getElementById("u_email");
    u_email.onblur = checkEmail;
    function checkEmail() {
		var email = u_email.value;
		/*var h = 0 ;
		for(var i = 0;i<email.length;i++){
			if(email[i]=="@"){
				checkE = true;
				//alert("邮件格式正确")
				break;
			}else{
				h += 1;
				//alert("邮件格式错误");
			}
		}
		if(h==email.length){
			alert("邮件格式错误");
		}*/
		var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		if(!pattern.test(email)){
			//alert("请输入正确的邮件地址");
			$(".email").css("display","block");
			u_email.value = "";
		}else{
			checkE = true;
			$(".email").css("display","none");
		}
		registerChange();
	}
    
    
    //检测电话号码格式是否正确
    var u_phone = document.getElementById("u_phone");
    u_phone.onblur = checkPhone;
    function checkPhone() {
    	var phone_value = u_phone.value;
		var phone = u_phone.value.length;
		//alert(phone);
		//if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){
		//var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
	    var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
		if(isMob.test(phone_value)){
			//alert("手机号码正确");
			$(".phone").css("display","none");
			checkH = true;
		}else{
			//alert("手机号码格式错误");
			$(".phone").css("display","block");
			u_phone.value = "";
		}
		/*if(phone==11||phone==12){
			checkH = true;
			//alert("电话格式正确");
		}else{
			//alert("电话格式错误");
		}*/
		registerChange();
	}
    
    //var proto = document.getElementById("proto");
    //提交按钮的是否可以执行
    function registerChange() {
		if(checkP&&checkA&&checkE&&checkH){
			return true;
			//$("#btn").css("disabled","false");
			//$("#btn").css("opacity","1.0");
			//alert(proto.checked);
		}
	}
    
    $("#proto").change(function() {
    	if(this.checked){
    		if(registerChange()){
    			$("#btn").css("disabled","false");
    			$("#btn").css("opacity","1.0");
    		}
    	}
	})
    
    
    //提交按钮的ajax提交
    $("#btn").click(function(){
    	//alert("das");
    	if(checkP&&checkA&&checkE&&checkP){
    		//alert("asdfa");
    		requestRegister = createRequest();
    		var url = getDate();
    		requestRegister.open("GET",url,true);
    		requestRegister.onreadystatechange = handleStateChange2;
    		requestRegister.send(null);
    	}else{
    		alert("有格式填写不正确，请重新填写");
    	}
	})
	
	
	function getDate() {
    	var name = document.getElementById("u_name");
		var date = "register?u_account="+u_account.value+"&u_password="+password.value+"&u_name="
		+name.value+"&u_email="+u_email.value+"&u_phone="+u_phone.value;
		return date;
	}
    function handleStateChange2() {
    	if(requestRegister.readyState==4){
			if(requestRegister.status==200){
				//alert(request.responseText);
				var register = document.getElementById("register-tag");
				register.innerHTML = requestRegister.responseText;
				$(".contact_form").css("display","none");
				window.location = "index.jsp";
				//alert("注册成功");
			}
		}
	}
   
    
	
});