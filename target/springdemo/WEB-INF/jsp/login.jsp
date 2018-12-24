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
<title>登录</title>
<style type="text/css">
  .content .login1{
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
     margin-left:70px;
  }
  
    .login{
     margin-left:120px;
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
		   <div class="login1">
		        <h2 class="login">登录</h2>
				<form >
					用户名：<input name="phone" type="text" id="phone" /><br><br>
					密&nbsp;&nbsp;&nbsp;码：<input name="password" id="password" type="password" /><br><br>
					      <a href="/springdemo_war_exploded/user/toregister">快速注册</a>&nbsp;&nbsp;&nbsp;
					      <br><br>
				</form>
			   <button class="submit" onclick="login()">登录</button>
		   </div>
		</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function login() {
        console.log("登录")
        var newphone = $('#phone').val();
        var newpassword = $('#password').val();
        var url = 'user/login';
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'json',
			data:{
			    "phone": newphone,
				"password": newpassword
			},
			success:function (data) {
				if(data == 1){
				    console.log("登陆成功");
                    window.location.href = "message/tolist";
				}else if(data == 2){
				    alert("手机号输入错误！");
				}else if(data == 3){
				    alert("密码输入错误");
				}
            }
		})
    }
	
</script>
</html>