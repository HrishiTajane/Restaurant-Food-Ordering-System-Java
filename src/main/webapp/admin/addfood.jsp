<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Food</title>
</head>
<body>
    <%
    
    
    String name,details,price,image,type;
    
    name=request.getParameter("dish_name");
    image=request.getParameter("file");
    price=request.getParameter("price");
    details=request.getParameter("dish_details");
    type=request.getParameter("dish_type");
          
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
    PreparedStatement ps=null;
    String sql;
    sql="insert into menu (food_name,price,details,type,image)values('"+name+"','"+price+"','"+details+"','"+type+"','"+image+"')";
    ps=con.prepareStatement(sql);
    ps.executeUpdate();
    
    out.println("<script>alert('Food is Added');</script>");
    out.println("<script>window.location.href='menu.jsp';</script>");
    %>
</body>
</html>