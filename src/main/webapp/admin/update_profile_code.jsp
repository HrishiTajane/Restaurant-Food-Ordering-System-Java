<%@page import="com.mysql.cj.exceptions.RSAException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update profile</title>
</head>
<body>
      <%
      HttpSession s1=request.getSession(false);
      String username=(String)s1.getAttribute("username");

      if(username==null)
      {
      	response.sendRedirect("login.html");
      }

      Class.forName("com.mysql.jdbc.Driver");

      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

      String name,uname,email;
      
      name=request.getParameter("name");
    
      email=request.getParameter("email");
      
      String sql1;
      PreparedStatement ps=null;
      sql1="update admin set name='"+name+"',email='"+email+"' where username='"+username+"'";
      ps=con.prepareStatement(sql1);
      ps.executeUpdate();
      out.println("<script>alert('Profile updated');</script>");
	  out.println("<script>window.location.href='profile.jsp';</script>");
      
    
      

      %>
</body>
</html>