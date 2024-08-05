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

      String name,last_name,uname,phone_no,email,old_pass,new_pass,cpass;
      
      name=request.getParameter("name");
      last_name=request.getParameter("l_name");
      uname=request.getParameter("username");
      email=request.getParameter("email");
      phone_no=request.getParameter("phone_no");
      old_pass=request.getParameter("old_password");
      new_pass=request.getParameter("new_password");
      cpass=request.getParameter("cpassword");
      
      String sql;
      Statement stmt=con.createStatement();
      sql="select * from login where password='"+old_pass+"'";
      ResultSet rs=stmt.executeQuery(sql);  
      
      if(rs.next()){
    	  
      String sql1;
      PreparedStatement ps=null;
      sql1="update login set name='"+name+"',last_name='"+last_name+"',username='"+uname+"',email='"+email+"',phone_no='"+phone_no+"'"+ 
                              ",password='"+new_pass+"',cpassword='"+cpass+"' where username='"+username+"'";
      ps=con.prepareStatement(sql1);
      ps.executeUpdate();
      out.println("<script>alert('Profile updated');</script>");
	  out.println("<script>window.location.href='profile.jsp';</script>");
      
      }
      else{
    	  out.println("<script>alert('Old Password not correct');</script>");
    	  out.println("<script>window.location.href='profile_update.jsp';</script>");
      }

      %>
</body>
</html>