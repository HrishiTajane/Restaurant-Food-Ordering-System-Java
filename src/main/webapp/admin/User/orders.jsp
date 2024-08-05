<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
  <%@include file="navbar.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<style>
body{
    background-color: rgb(221, 234, 242);
}
.cart-order{
margin-top:100px;
height:300px;
}
.card-body{
 align-items:center;
 justify-content:center; 
 height:50px;
 display:flex;
 }

.tr{
background-color:white;
}

.list{
font-size:33px;
}

.pending{
color:rgb(255, 0, 0);
}
.complete{
color:rgb(0, 205, 0);
}
.add-food-btn {
 height:43px;
 width:180px;
 background-color:blue;
 color:white;
 border-radius:4px;
 }
 .add-food-btn:hover {
 background-color:transparent;
 color:blue;
 border:1px solid blue;
 }
</style>

</head>
<body>
       <div class="container">
      <div class="row mt-4">
                  <%
		               Class.forName("com.mysql.jdbc.Driver");
		    		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
		               Statement stmt1=con.createStatement();
		               String sql1="select * from orders where username='"+username+"'";
		               ResultSet rs1=stmt1.executeQuery(sql1);
		               
		               int cnt=0;
		               
		               while(rs1.next())
		               {
		            	  cnt++;
		               }
		               
		                 if(cnt==0)
		                 {
		                	 %>
	            			 
	            			 <div class="card cart-order">
	            			   <div class="card-body text-center">
	            			     <div>
	            			          <h3>NO ORDERS YET!</h3>
	            			         <a href="menu.jsp"><button type="button" class="add-food-btn mt-3">Add Food</button></a> 
	            			     </div>
	            			   </div>
	            			 </div>
	            			 
	            			<%
		                 }
		                 else{
		                	 
		                 
		               
		              %>
        <div class="col-md-12">
     
		 <table class="table">
		    
		   <tbody> 
		           <%
		               
		               Statement stmt=con.createStatement();
		               String sql="select * from orders where username='"+username+"'";
		               ResultSet rs=stmt.executeQuery(sql);
		               
		               
		               
		               while(rs.next())
		               {
		            	  
		              
		             %>  
		      <tr class="tr">  
		        <td> </td>  
		        <td width="180px"><img src="image/<%out.println(rs.getString("image")); %>" class="" height=100px width="110px"></td>
		         <td><%out.println(rs.getString("dish_name")); %><br><br>
		              <%out.println(rs.getString("type")); %></td>
		         <td width="290">  &#8377; <%out.println(rs.getString("price")); %></td>
		        <% String status= rs.getString("status"); %>
		         
		         <%
		         if(status.equals("pending"))
		         {
		            %> <td width="400"> <ul><li class="list pending"> </li></ul>Order Not Placed &nbsp&nbsp&nbsp&nbsp  <a href="cancel-order.jsp?id=<%=rs.getInt(1) %>"> <button type="submit" class="btn btn-danger">Cancel Order</button></a></td>   <%
		         }
		         else{
		        	 %> <td> <ul ><li class="complete list"></li> </ul>
		        	        Order Placed <br> Your items has been delivered</td>   <%
		         }
		         %>
		         
		         
		     </tr>
		     
		     <tr class="empty-row"><td> </td><td> </td><td> </td><td> </td> </tr>
		     
		     <% } %>
		   </tbody> 
		 </table>
     </div>
     <% } %>
     </div>
     </div>
</body>
</html>