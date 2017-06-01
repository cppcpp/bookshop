//检测登录账号是用那一中账号登录的
$(function(){
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
	
	
	var loginBtn = document.getElementById("loginBtn");
	//alert(loginBtn);
	var loginAccount = document.getElementById("login_account");
	var loginPass = document.getElementById("login_password");
	loginBtn.onclick = checkLogin;
	
	function checkLogin() {
		//alert(login.hide.value);
		var value = loginAccount.value;
		//监测是用什么方式登录的
		//邮件
		var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		//电话
	    var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
	    if(isMob.test(value)){
			//alert("手机号码");
	    	login.hide.value = "u_phone";
		}else if(pattern.test(value)){
			//alert("邮件");
			login.hide.value = "u_mail";
		}else{
			//alert("账号");
			login.hide.value = "u_account";
		}
		
		//获取验证码
	    check_code = document.getElementById("login_checkCode");
	    var code_text = check_code.value;
	    //alert(code_text);
		
	    img = document.getElementById("change_code");
		/*for(var i = 0;i<loginAccount.value.length;i++){
			if(loginAccount.value[i]=="@"){
				login.hide.value = "u_mail";
				break;
			}
		}
		if(login.hide.value != "u_mail"){
			
			if(loginAccount.value.length==8){
				login.hide.value = "u_account";
			}else if(loginAccount.value.length==11||loginAccount.value.length==12){
				login.hide.value = "u_phone";
			}else{
				login.hide.value = "u_mail";
			}
			//alert(login.hide.value);
		}*/
		
		requestLogin = createRequest();
		//alert(requestLogin)
		var url = "login?tag="+login.hide.value+"&u_account="+loginAccount.value+"&u_password="+loginPass.value+"&code="+code_text;
		requestLogin.open("GET", url, true);
		requestLogin.onreadystatechange = handleStateChangeLogin;
		requestLogin.send(null);
	}
	
	
	function handleStateChangeLogin() {
		if(requestLogin.readyState==4){
			if(requestLogin.status==200){
				/*if(requestLogin.responseText.trim()=="okay"){
					alert("登录成功");
				}*/
				var t = requestLogin.responseText.trim();
				//alert(t);
				//vat m = /^([a-zA-Z])+*/;
				if(t=="1111/bookshop/specials.jsp"||t=="1111null"||t=="1111/bookshop/index.jsp"||t=="1111/bookshop/about.jsp"||t=="1111/bookshop/cart.jsp"){
					//alert("登录成功");
					$(".check").css("display","none");
					$(".check").css("acode","none");
					var login = document.getElementById("login-tag");
					login.innerHTML = requestLogin.responseText;
					$(".contact_form").css("display","none");
					var page = t.split("/");
					var p = page[page.length-1];
					if(t=="1111null"){
						window.location = "index.jsp";
					}else{
						window.location = p;
					}
				}else if(requestLogin.responseText.trim()=="验证码错误"){
					$(".check").css("display","none");
					$(".acode").css("display","block");
					img.src = img.src + "?" + new Date().getTime();
					check_code.value = "";
				}else{
					//alert("sdf");
					$(".check").css("display","block");
					$(".acode").css("display","none");
				}
			}
		}
	}
	
	
	$("#change_code").click(function() {
		//codeRequest = createRequest();
		//var url = this.src;
//		alert(url);
		this.src = this.src + "?" + new Date().getTime();
		/*codeRequest.open("GET",url,true);
		codeRequest.onreadystatechange = codeHandler;
		codeRequest.send(null);*/
	})
	
	/*function codeHandler(){
		if(codeRequest.readyState==4){
			if(codeRequest.status==200){
				var img = document.getElementById("change_code");
				img.src = img.src + "?" + new Date().getTime();
			}
		}
	}*/
	
})