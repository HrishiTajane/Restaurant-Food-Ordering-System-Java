<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="navbar.css">
<title>Customer file</title>
</head>
<body>
       
 <style>
 body{
background-color:#f2f6fc;
}
.card-body{

}
.table-customers{
margin-left:10px;
margin-right:10px;
}
.container-body{
  margin-top:30px;
}

</style>
       <div class="container-body">
       
       <div class="table-customers">
       
       <div class="card">
          <div class="card-header">
              <h2>Customers</h2>
          </div>
         <div class="card-body">
        
       
        <table class="table table-responsive table-striped  table-hover">
          <thead>
           <tr class="text-center bg-primary">
           <th>Sr.no</th>
             <th>Name</th>
             <th>E-mail</th>
             <th width="20%">Phone no</th>
             <th>Address</th>
           </tr>
          </thead>
          
          <tbody>
          
          <%
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
             Statement stmt=con.createStatement();
             String sql="select * from login";
             ResultSet rs=stmt.executeQuery(sql);
             int i=1;
             while(rs.next())
             {
          %>
           <tr class="tr">
         <td class="text-center"><%out.println(i); %></td>
             <td><%out.println(rs.getString("name"));out.println(rs.getString("last_name")); %></td>
             <td><%out.println(rs.getString("email"));%></td>
             <td class="text-center"><%out.println(rs.getString("phone_no"));%></td>
             <td><%out.println(rs.getString("address"));%></td>
        
           </tr>
          <% i++;} %>
         
          </tbody>
        </table>  
         </div>
        </div>
       </div>
      </div>
       
</body>
</html>