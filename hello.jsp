<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*" %>
<%	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>

<html>
<head>
<base href="<%=basepath%>">
<title>Sample Application JSP Page</title>
</head>
<body bgcolor=white>

<table border="0">
<tr>
<td align=center>
<img src="images/tomcat.gif">
<img src="images/tomcat.gif">
</td>
<td>
<h1>Sample Application JSP Page</h1>
This is the output of a JSP page that is part of the Hello, World
application.
<hr>
locate命令用于查找文件
</td>
</tr>
</table>
<%! 
	String a = 	"当我们用whereis和locate无法查找到我们需要的文件时，可以使用find，但是find是在硬盘上遍历查找，<br>" +
				"因此非常消耗硬盘的资源，而且效率也非常低，因此建议大家优先使用whereis和locate。 <br>" +
				"locate 是在数据库里查找，数据库大至每天更新一次。 <br>" +
				"whereis 可以找到可执行命令和man pagefind 就是根据条件查找文件。 <br>" +
				"<br>" +
				"which 可以找到可执行文件和别名(alias)<br>" ;
	int addB(int a, int b){
		return a+2*b;
	}
%>

<%= new String("Hello!") %>

<%
	out.println("test");
	out.println("<hr>"+a+"<hr>");
	int c = addB(1,3);
	out.println(c);
%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String date_s = sdf.format( new Date() );
%>
<hr>
Time: <%=date_s %>
<hr>
<a href="/sample/hello2.jsp">all example</a>
</body>
</html>
