<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>消息详情页</title>
<link rel="stylesheet" 
      href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
   .context{
      margin-left:400px;
      border:1px;
   }
   
   .btn{
      margin-left:230px;
   }
</style> 
</head>
<body>
    <div class="header">
		<img src="picture/logo.png">
		<hr>
		<h3 align="center">消息详情</h3>
	</div>

   <div class="context">
      <form >
          <c:forEach items="${context}" var="c">
          	      <input type="hidden" id="id" style="width:10px" value="${c.id}"><br><br>
		      消息标题：<input type="text" id="title" style="width:500px" value="${c.title}"><br><br>
		         消息正文：<input type="text" id="context" style="width:500px" value="${c.context}"><br><br>
		         发布日期：<input type="text"  id="date" style="width:500px" value="${c.date}"><br><br>
		 </c:forEach>
	  </form>
		 <div class="btn">
			 <button onclick="save()">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="/springdemo_war_exploded/message/tolist"><button>取消</button></a>
		 </div>
   </div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    function save() {
        console.log("修改消息")
        var id = parseInt($('#id').val());
        var title = $('#title').val();
        var context = $('#context').val();
        var date = $('#date').val();
        var url = 'message/toSave';
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'text',
            data:{
                "id": id,
                "title": title,
                "context": context,
                "date": date
            },
            success:function (data) {
                alert(123);
                window.location.href = "message/tolist";
			},
			error:function(data){
                alert("456");
			}
        })
    }
</script>
</html>