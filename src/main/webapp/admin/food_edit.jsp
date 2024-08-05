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
<title>Edit form</title>
</head>
<body>

  
  <%
  String fname,price,type,details,image;
  int id=Integer.parseInt(request.getParameter("id"));
  fname=request.getParameter("dish_name");
  price=request.getParameter("price");
  details=request.getParameter("dish_details");
  type=request.getParameter("dish_type");
  image=request.getParameter("image");

  
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
  
  PreparedStatement ps=null;
  
  String sql="update menu set food_name='"+fname+"', price='"+price+"', type='"+type+"', details='"+details+"' ,image='"+image+"' where id='"+id+"'";
  ps=con.prepareStatement(sql);
  ps.executeUpdate();
  
  out.println("<script>window.location.href='menu.jsp';</script>");
  out.println("");
  
  %>
     
      
</body>
</html>