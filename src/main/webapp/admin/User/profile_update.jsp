<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile update</title>
   <link rel="stylesheet" href="bootstrap.min.css">
   <link rel="stylesheet" href="profile.css">
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

              String sql;

              Statement stmt =con.createStatement();

              sql="select * from login where username='"+username+"'";
              ResultSet rs=stmt.executeQuery(sql);
              
              if(rs.next())
              {
            	  
            %>  
              
              
              
<div class="update-profile">

   <form action="update_profile_code.jsp" method="POST">
  
      <img src="profile.png" >
      <div class="flex">
         <div class="inputBox">
            <span>Name :</span>
            <input type="text" name="name" value="<%out.println(rs.getString("name"));%>" class="box">
                        
            <span>username :</span>
            <input type="text" name="username" value="<%out.println(rs.getString("username"));%>" class="box">
           
            <span>your email :</span>
            <input type="email" name="email" value="<%out.println(rs.getString("email"));%>" class="box">
           
            <span>your phone no. :</span>
            <input type="text" name="phone_no" value="<%out.println(rs.getString("phone_no"));%>" class="box">
           
         </div>
         <div class="inputBox">
            
             <span>Last name :</span>
            <input type="text" name="l_name" value="<%out.println(rs.getString("last_name"));%>" class="box">
            <span>old password :</span>
            <input type="password" name="old_password" placeholder="enter Old password" value="<%=rs.getString("password") %>" class="box" required>
            <span>new password :</span>
            <input type="password" name="new_password" placeholder="enter new password" value="<%=rs.getString("password") %>" class="box" required>
            <span>confirm password :</span>
            <input type="password" name="cpassword" placeholder="confirm new password" value="<%=rs.getString("cpassword") %>" class="box" required>
         </div>
      </div>
      <input type="submit" value="update profile" name="update_profile" class="btn">
      <a href="profile.jsp" class="btn btn-outline-danger" >Cancel</a>
   </form>

<%
}
%>
     
  
</div>
       
       
</body>
</html>