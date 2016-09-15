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

	String printMultiTable(){
		String s = "";
		int i = 0;
		int j = 0;
		for(i = 1; i <= 9; i++){
			for(j = 1; j <= i; j++){
				if( (i*j) < 10 ){
					s += i + "*" + j + "=" + (i*j) + "&nbsp;&nbsp;&nbsp;&nbsp;";				
				}
				else{
					s += i + "*" + j + "=" + (i*j) + "&nbsp;&nbsp;";
				}
			}
			s += "<br>";
		}
		return s;
	}

	void printMultiTable2(JspWriter out) throws Exception {
		String s = "";
		int i = 0;
		int j = 0;
		for(i = 1; i <= 9; i++){
			for(j = 1; j <= i; j++){
				if( (i*j) < 10 ){
					out.println(i + "*" + j + "=" + (i*j) + "&nbsp;&nbsp;&nbsp;&nbsp;");				
				}
				else{
					out.println(i + "*" + j + "=" + (i*j) + "&nbsp;&nbsp;");				
				}
			}
			out.println("<br>");				
		}
		return;
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
<%=printMultiTable() %>
<hr>
<% printMultiTable2(out); %>
<hr>
<% 
	//out.flush(); 
%>
<%=out.getClass().getName() %>
<hr>
<h3>Buffer size</h3> <%=out.getBufferSize()/1024 %> KB<br>
<h3>Remaining buffer size</h3> <%=out.getRemaining()/1024 %> KB<br>
<h3>Is auto flush</h3> <%=out.isAutoFlush() %> <br>

<form action="hello2.jsp" method="post">
	<input type="text" name="username" placeholder="username">
	<input type="password" name="password" placeholder="password">
	<input type="text" name="x[]" placeholder="x[1]">
	<input type="text" name="x[]" placeholder="x[2]">
	<input type="text" name="x[]" placeholder="x[3]">
	<input type="submit" value="login">
</form>
<hr>
<%
	request.setCharacterEncoding("utf-8");
	
	out.println("username: " + request.getParameter("username"));		
	
	
	out.println("password: " + request.getParameter("password"));		
	
	if (request.getParameterValues("x[]") != null) {
		String[] x = request.getParameterValues("x[]");
		 
		for(String i : x){
			out.println("<br>" + i);
		}

		out.println( Arrays.toString(x) );
	}
	

	// 请求重定向，在客户端看来是两次请求， 不能自动保留参数， url也是改变的
	// response.sendRedirect("hello.jsp"); 
	// 调用 sendRedirect ， 前面不能有 out.flush().
	// 请求转发 可以保留参数， 在客户端看来， 其url不变，是一次请求
	// request.getRequestDispatcher("hello.jsp").forward(request,response);
%>
<hr>
<%
	date_s = sdf.format( new Date( session.getCreationTime() ) );
	out.println("Session Create Time: " + date_s);
	session.setAttribute("username","admin");
	out.println("<br>Session get attribute: " + session.getAttribute("username") );
	out.println("<br>Session id : " + session.getId() );
	// session.setMaxInactiveInterval(5); //设置session 过期时间 单位 s
	// session.invalidate(); // 销毁当前回话

%>

<hr>
<%
	application.setAttribute("hello2_user","user1");
	out.println("application value : " + application.getAttribute("hello2_user") );
	out.println("<br>application server info : " + application.getServerInfo() );
%>
<hr style="border:solid 2px #00FF7F; ">
<%
	pageContext.include("hello.jsp");
%>
<hr style="border:solid 2px #00FF7F; ">
</body>
</html>

