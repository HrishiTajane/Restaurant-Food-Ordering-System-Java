<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete food page</title>
</head>
<body>

     <%
     int id=Integer.parseInt(request.getParameter("id"));
     Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
     PreparedStatement ps=null;
     
     String sql="delete from menu where id='"+id+"'";
    ps=con.prepareStatement(sql);
    ps.executeUpdate();
    out.println("<script>window.location.href='menu.jsp'; </script>");
     
     %>

</body>
</html>