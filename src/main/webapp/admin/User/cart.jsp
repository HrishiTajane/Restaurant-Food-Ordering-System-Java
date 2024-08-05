<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="navbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
 
 <style>

 body{
    background-color: rgb(221, 234, 242);
  
}
 .table{
 background-color:white;
 }
 
 .empty-row{
 background-color:rgb(221, 234, 242);
 }
 
 .qty-box {
 width:60px;
 float:left;
 }
 
 .bill{
 position:fixed;
 right:0;
 
 }
 
 .place-order-btn{
 margin-bottom:-75px;
 }
 
 .remove-btn{
 width:100%;
 }
 .remove-btn{
 justify-content:right;
 display:flex;
 }
 
 .card{
 height:450px;
 }
 .card-body{
 align-items:center;
 justify-content:center; 
 height:50px;
 display:flex;
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
.image-cart{
border-radius:8px;
} 
 
 
  </style>
 
 
 
     <div class="container">
      <div class="row mt-4">
      
      <%
		               Class.forName("com.mysql.jdbc.Driver");
		    		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
		               Statement stmt1=con.createStatement();
		               String sql1="select * from cart where username='"+username+"'";
		               ResultSet rs1=stmt1.executeQuery(sql1);
		               
		               int count=0;
		               while(rs1.next())
		               {
		            	   
		            	   count++;
		               }
		            		if(count==0)
		            		{
		            			%>
		            			 
		            			 <div class="card">
		            			   <div class="card-body text-center">
		            			     <div>
		            			          <img src="fast-food.jpg" class="image-cart" height=200 width=200 >
		            			          <h3 class="mt-4">YOUR CART IS EMPTY!</h3>
		            			          <h6 class="mt-3">Add items to it now.</h6>
		            			         <a href="menu.jsp"><button type="button" class="add-food-btn mt-3">Add Food</button></a> 
		            			     </div>
		            			   </div>
		            			 </div>
		            			 
		            			<%
		            		}
		            		else{
		            			
		            		
		            	
		             %>
      
      
        <div class="col-md-10 mx-auto">
     
		 <table class="table">
		    
		   <tbody> 
		           <%
		               
		               Statement stmt=con.createStatement();
		               String sql="select * from cart where username='"+username+"'";
		               ResultSet rs=stmt.executeQuery(sql);
		               
		               int price1,qty1,total;
		               ArrayList<Integer> arr=new ArrayList<Integer>();
		               while(rs.next())
		               {
		            	   price1=Integer.parseInt(rs.getString("price"));
		             	  qty1=Integer.parseInt(rs.getString("qty"));
		             	  
		             	 total=price1*qty1;
		            	  arr.add(total);
		              
		             %>
		     <tr>
		     <td> </td>
		       <td width="180px"><img src="image/<%out.println(rs.getString("image")); %>" class="mt-5" height=120px width="130px"></td>
		       <td> 
		        <h5 class="mt-3"> <%out.println(rs.getString("food_name")); %></h5>
		             <%out.println(rs.getString("description")); %><br><br>
		             <div>
		                 <h5><b> &#8377; <%out.println(total); %></b></h5><br>
		                 <form action="update-qty.jsp" method="post">
		                     <input type="hidden" name="id" value="<%=rs.getInt("id") %>">
		                     <input type="number" class="form-control qty-box" min="1" name="qty" value="<%=rs.getString("qty") %>">&nbsp
		                     <input type="submit" class="btn btn-outline-primary" value="Update Qty">
		                 
		                 </form>
		                 
		                 <form action="place-order.jsp" method="post">
		                    <input type="hidden" name="id" value="<%=rs.getInt("id") %>"> 
		                    <input type="hidden" class="form-control" name="food_name" value=<%out.println(rs.getString("food_name")); %>>
		                    <input type="hidden" class="form-control qty-box" name="qty" value="<%=rs.getString("qty") %>">
		                    <input type="hidden" class="form-control" name="price" value=<%=rs.getString("price") %>>
		                    <input type="hidden" class="form-control" name="type" value=<%=rs.getString("type") %>>
		                    <input type="hidden" class="form-control" name="desc" value=<%out.println(rs.getString("description")); %>>
		                    <input type="hidden" class="form-control" name="image" value=<%=rs.getString("image") %>>
		                  
		                    <input type="submit" value="Place Order" class="btn btn-outline-primary place-order-btn">
		                 </form>
		                 
		           </div >
		           <div class="remove-btn">
		             <a href="remove-food.jsp?id=<%=rs.getInt("id") %>">
		       <button type="button" class="button btn btn-outline-danger  mt-2 remove-btn2"><b>Remove</b></button></a></div></td>
		     </tr>
		     
		     <tr class="empty-row"><td> </td><td> </td><td> </td><td> </td> </tr>
		     
		     <% } %>
		   </tbody> 
		 </table>
     </div>
     <%} %>
     </div> 
     
     </div>
      
      
</body>
</html>