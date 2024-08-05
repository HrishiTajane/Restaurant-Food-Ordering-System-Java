<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
                     String status1=request.getParameter("select");
                     int id=Integer.parseInt(request.getParameter("id"));
                 
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
                 
                     PreparedStatement ps=null;
                     String sql2="update orders set status='"+status1+"' where id='"+id+"'";
                     ps=con.prepareStatement(sql2);
                     ps.executeUpdate();
                     
                     response.sendRedirect("orders.jsp");
                    
                    %>
                    
             
</body>
</html>