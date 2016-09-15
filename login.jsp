<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*" %>
<%	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>

<html>
<head>
<base href="<%=basepath%>">
<title>Login (test cookie)</title>
</head>
<body bgcolor=white>
<form action="dologin.jsp" method="post">
	User name: <input type="text" name="username">
	Password: <input type="text" name="password">
	<input type="checkbox" name="save_login_info" value="1"> save login info
	<hr>
	<input type="submit" value="submit">
</form>

</body>
</html>
