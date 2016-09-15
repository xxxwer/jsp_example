<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*" %>
<%@ page import="com.po.MyMD5" %>
<%	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>

<html>
<head>
<base href="<%=basepath%>">
<title>Login (test cookie)</title>
</head>
<body bgcolor=white>

<%
	String[] save_login_info = request.getParameterValues("save_login_info");

	if (save_login_info != null) {
		if (save_login_info[0].equals("1") ) {
			String password = request.getParameter("password");
			
			MyMD5 md5 = new MyMD5();
			String md5_str = md5.bytesToMD5(password.getBytes() );
			//out.println("<hr>"+md5_str);
			Cookie is_login = new Cookie("is_login",md5_str);
			is_login.setMaxAge(864000);
			response.addCookie(is_login);
		}
	}
	else {
		Cookie[] cc = request.getCookies();
		if(cc != null && cc.length > 0){
			for (Cookie c:cc ){
				if (c.getName().equals("is_login")){
					out.println(c.getValue() );
					//delete cookie
					c.setMaxAge(0);
					response.addCookie(c);			
				}

			}
		}
	}

%>

</body>
</html>
