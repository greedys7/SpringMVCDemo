<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="utf-8">
<title>注册</title>
<style type="text/css">
  .content .register{
    float:left;
    width:400px;
    height:450px;
    margin-top:50px;
    margin-left:80px;
    padding-bottom:20px;
}

  .picture{
     float:left;
  }
  
    .submit{
     width:150px;
     height:30px;
     margin-left:10px;
  }
  
  .reg{
     margin-left:50px;
  }
</style>

</head>
<body>
	<div class="header">
		<img src="picture/logo.png">
		<hr>
	</div>
	<div class="content">
		<div class="picture">
			<img src="picture/picture.PNG">
		</div>
	   <div class="register">
	       <h2 class="reg">注册</h2>
		   <form name="frm">
		      <input type="text" name="phone" id="phone" <%--onblur="check1()"--%> placeholder="请输入手机号"></br></br>
		      <input type="text"  name="code" id="code" placeholder="短信验证码">
		      <button type="button" id="rcbtn" >获取验证码</button><br>
		      <div id="showCode"></div><br>
		      <input type="password" name="password" id="password" <%--onblur="check2()"--%> placeholder="请输入密码"></br></br>
		      <div class="checkbox">
					<label> <input type="checkbox" name="checkbox">我已阅读并同意<a href="https://privacy.qq.com/">《用户注册协议》</a><br><br>
					</label>
				</div>
		   </form>
           <button class="submit" onclick="submitfn()">注册</button><br><br>
           完成注册可获得500积分
	   </div>
   </div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
/*   //判断手机号码格式
    function check1(){
    	var newphone = document.getElementById("phone").value;
    	console.log(newphone);
		if (!(/^1[34578]\d{9}$/.test(newphone))) {
			alert("手机号码有误，请重填");
		}
    }
    
    //判断密码格式
    function check2(){
    	var pwd = document.getElementById("password").value;  	
		if (!(/[0-9A-Za-z]\d{4}$/.test(pwd))) {
			alert("密码不能小于4位！");
		}
    }*/
    
	//获取验证码
	var mfbtn=document.getElementById('rcbtn');
	var countdown = 60;
	function settime(obj) {
		if (countdown == 0) {
			obj.disabled=false;
	        obj.innerHTML="获取验证码";
	        countdown = 60;
	        return;
		} else {
			obj.disabled=true;
	        obj.innerHTML="重新发送(" + countdown +"s)";
	        countdown--;
		} 
		setTimeout(function() {
	        settime(obj);
	    }, 1000)
	}
	
	//随机验证码生成
	mfbtn.onclick=function () {
	    settime(mfbtn);
	    alert("手机验证码已成功发送，请注意查收");
        var newcode = Math.floor(Math.random() * 10000);
        document.getElementById('showCode').innerHTML = newcode;

	}

    function insertuser(){
        console.log(">??????/")
        var newphone = $('#phone').val();
        var newpassword = $('#password').val();
        $.getJSON("user/saveUser",{"phone":newphone,"password":newpassword},function(data){
        })
    }

    function submitfn() {
        console.log("注册")
        var newphone = $('#phone').val();
        var newpassword = $('#password').val();
        var code = $('#code').val();
        var providecode = $('#showCode').html();
        var url = 'user/addUser';
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'json',
            data: {
                "phone": newphone,
                "password": newpassword,
                "code": code,
                "providecode": providecode,
            },
            success: function (data) {
                if (data == 3) {
                    if (!(/^1[34578]\d{9}$/.test(newphone))) {
                        alert("手机号码格式有误，请重填");
                    } else if (newpassword.length < 4) {
                        alert("密码不得少于4位！")
                    } else if (frm.checkbox.checked == true) {
                        alert("恭喜您已经成功注册会员！")
                        insertuser();
                        window.location.href = "user/tologin";
                    } else {
                        alert("请阅读并同意相关协议可注册！")
                    }

                } else if (data == 4) {
                    alert("信息填写不完整，请填写完整");
                } else if (data == 5) {
                    alert("验证码错误");
                } else if (data == 1) {
                    alert("该用户已经注册，请前去登录！");

                }
            }
        })
    }

		
</script> 

</html>