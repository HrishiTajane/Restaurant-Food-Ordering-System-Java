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
              String username=(String)s1.getAttribute("uname");

              if(username==null)
              {
              	response.sendRedirect("login.html");
              }

              Class.forName("com.mysql.jdbc.Driver");

              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root",""); 

              String sql;

              Statement stmt =con.createStatement();

              sql="select * from admin where username='"+username+"'";
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
            <input type="text" name="username" value="<%out.println(rs.getString("username"));%>" class="box" readonly>
           
         </div>
         <div class="inputBox">
            
            <span>E-mail :</span>
            <input type="text" name="email" value="<%out.println(rs.getString("email"));%>" class="box">
           
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