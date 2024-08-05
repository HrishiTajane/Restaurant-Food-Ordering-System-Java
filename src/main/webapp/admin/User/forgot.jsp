<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
      
      
      <%
      
      String email,username,password,cpassword;
      
      email=request.getParameter("email");
      username=request.getParameter("uname");
      password=request.getParameter("password");
      cpassword=request.getParameter("cpassword");
      
      Class.forName("com.mysql.jdbc.Driver");

      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

      
      PreparedStatement ps=null;
      Statement stmt=con.createStatement();
      String sql;
      sql="select * from login where username='"+username+"' AND email='"+email+"'";
      ResultSet rs=stmt.executeQuery(sql);
            
      if(rs.next()){
    	  
          String sql1;
          sql="update login set password='"+password+"',cpassword='"+cpassword+"' where email='"+email+"' ";
          ps=con.prepareStatement(sql);
          ps.executeUpdate();
          out.println("<script> alert('Your password is change');</script>");
    	  out.println("<script>window.location.href='login.html';</script>");
      
      }
      else{
    	  out.println("<script> alert('E-mail and username not correct');</script>");
    	  out.println("<script>window.location.href='forgot.html';</script>");
    	  
      }
      
      
      
      
      %>
      
</body>
</html>