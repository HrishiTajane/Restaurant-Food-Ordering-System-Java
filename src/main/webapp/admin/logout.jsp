<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%
     HttpSession s1=request.getSession(false);
     s1.invalidate();
     
     	response.sendRedirect("login.html");
     %>
</body>
</html>