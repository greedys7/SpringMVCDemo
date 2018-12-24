<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
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
<meta charset="utf-8">
<title>消息列表</title>
<link rel="stylesheet" 
      href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 
</head>
<body>
   	<div class="header">
		<img src="picture/logo.png">
		<hr>
		<h3 align="center">消息列表</h3>
	</div>
	<div>
	   <table class="table table-striped" >
	       <tr align="center">
	         <td><strong>序号</strong></td>
             <td><strong>消息标题</strong></td>
             <td><strong>消息正文</strong></td>
             <td><strong>发布日期</strong></td>
             <td><strong>操作</strong></td>
           </tr>
	       <c:forEach items="${list}" var="m" varStatus="ns">
	          <tr align="center" >
	             <td>${m.id}</td>
	             <td>${m.title}</td>
	             <td>${m.context}</td>
	             <td>${m.date}</td>
	             <td>
	                <a href="/springdemo_war_exploded/message/toContext?id=${m.id}">编辑</a>&nbsp;
			        <a href="/springdemo_war_exploded/message/toDelete?id=${m.id}">删除</a>&nbsp;
			     </td>		     
	          </tr>
		   </c:forEach>
	   </table>
	</div>
</body>
</html>