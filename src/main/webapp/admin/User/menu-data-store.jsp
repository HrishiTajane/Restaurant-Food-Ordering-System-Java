<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
HttpSession s1=request.getSession(false);

String username=(String)s1.getAttribute("username");

if(username==null)
{
	response.sendRedirect("login.html");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       
        <% 
         String name,price,type,desc,image;
        
         name=request.getParameter("fname");
         price=request.getParameter("price");
         type=request.getParameter("type");
         desc=request.getParameter("description");
         image=request.getParameter("image");
     int qty=Integer.parseInt(request.getParameter("quantity"));
         
         
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
		 PreparedStatement ps=null;
		 String sql;
		 sql="insert into cart (food_name,price,description,image,type,qty,username) values('"+name+"','"+price+"','"+desc+"','"+image+"','"+type+"','"+qty+"','"+username+"')";
		 ps=con.prepareStatement(sql);
		 ps.executeUpdate();
		 
		 out.println("<script>alert('open cart');</script>");
		 out.println("<script>window.location.href='cart.jsp';</script>");
		 
		 
		 
		
		%>	
		
       
       
</body>
</html>