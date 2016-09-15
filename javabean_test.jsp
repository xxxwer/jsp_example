<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*" %>

<%@ page import="com.po.*"%>
<%	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>

<html>
<head>
<base href="<%=basepath%>">
<title>JavaBean Test</title>
</head>
<body bgcolor=white>

<%
	User user1 = new User();
	user1.setUsername("test");
	out.println("class user1 :" + user1.getUsername() );
%>

<hr>
<%
	request.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="user2" class="com.po.User" scope="page" />
<jsp:setProperty name="user2" property="*" />
javaBean user2 : <%=user2.getUsername() %>

<hr>

<jsp:useBean id="user3" class="com.po.User" scope="page" />
<jsp:setProperty name="user3" property="username" param="username2" />
javaBean user3 : <%=user3.getUsername() %>

<hr>

<%
	CheckUser check1 = new CheckUser();
	int ret = check1.checkUserVal(user3);
	if (ret == 1) {
		out.println("true");
	}
	else{
		out.println("false");
	}
%>
<hr>

<form action="javabean_test.jsp" method="post">
<input type="text" name="username" placeholder="User2 Name">
<input type="text" name="username2" placeholder="User3 Name">
<input type="submit" value="submit">
</form>

<hr  style="border:solid 2px green;">
</body>
</html>
