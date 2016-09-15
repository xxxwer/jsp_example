<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>

<html>
<head>
<base href="<%=basepath%>">
<title>db test</title>
</head>
<body>

<table style="text-align:center;">
	<tr><th>ID</th><th>Parent User ID</th><th>Name</th></tr>
<%
	AccountDAO account_dao = new AccountDAO();
	ArrayList<Account> accounts = account_dao.getAllAccount();
	if (accounts != null && accounts.size() > 0) {
		for (Account a : accounts ) {
			out.println("<tr><td>"+a.getIdAccount()+"</td><td>"+a.getIdUser()+"</td><td>"+a.getFirstName()+" "+a.getLastName()+"</td></tr>");
		}
	}

	System.out.println("db_test here test");
%>
</table>

</body>
</html>
