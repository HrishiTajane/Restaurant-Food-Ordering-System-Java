<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@include file="navbar.jsp" %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
  
   <link rel="stylesheet" href="profile.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
      
<style>
 li{
 margin-top:10px!important;
 }
 a{
  font-size:17px!important;
 }
.profile{
	animation: transition 2.4s;
}

@keyframes transition
	{
		from{
			opacity: 0;
			transform: rotateX(-10deg);
		}
		
		to{
			opacity: 1;
			transform: rotateX(0);
		}
		
	}
</style>
      
    
     <%
     
    

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

     String sql;

     Statement stmt =con.createStatement();

     sql="select * from login where username='"+username+"'";
     ResultSet rs=stmt.executeQuery(sql);
     
     if(rs.next())
     {
     
     %>
         <div class="container-fluid">
           <div class="profile">
              <img src="profile.png" >
              <h3><% out.println(rs.getString("name")); out.println(rs.getString("last_name")); %></h3>
              <h3><i class="fa fa-envelope">  &nbsp&nbsp <% out.println(rs.getString("email")); %></i></h3>
              <h3><i class="fa fa-phone">&nbsp&nbsp <% out.println(rs.getString("phone_no")); %></i></h3>
              <a href="profile_update.jsp" class="btn">update profile</a>
              <a href="logout.jsp" class=" btn delete-btn">logout</a>

           </div>
         </div>
     <%
     }
     %>
      
      
</body>
</html>