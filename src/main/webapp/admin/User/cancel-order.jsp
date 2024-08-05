<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      
      <%
      int id=Integer.parseInt(request.getParameter("id"));
       Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
       PreparedStatement ps=null;
       
       String sql="delete from orders where id='"+id+"'";
       ps=con.prepareStatement(sql);
       ps.executeUpdate();
       
       response.sendRedirect("orders.jsp");
       
      %>
      
</body>
</html>