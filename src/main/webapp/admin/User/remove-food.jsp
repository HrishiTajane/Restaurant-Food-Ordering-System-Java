<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                       int id=Integer.parseInt(request.getParameter("id"));
      
		               Class.forName("com.mysql.jdbc.Driver");
		    		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
		             
		               PreparedStatement ps=null;
		               String sql="delete from cart where id='"+id+"'";
		               ps=con.prepareStatement(sql);
		               ps.executeUpdate();
		               
		               response.sendRedirect("cart.jsp");
		            
		            	   
		              
		             %>
</body>
</html>