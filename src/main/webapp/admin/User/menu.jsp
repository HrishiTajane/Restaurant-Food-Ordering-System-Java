<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
.col-md-4{
padding:20px;

}
.card{
border-radius:20px;
}
.card:hover{
transform:scale(1.03);
box-shadow:0 0 5px 2px grey;
}
.images{
padding:10px;
border-radius:20px;
}

.name 
{
width:70%;
font-weight: bold;
position :relative;
}

.price{
position:relative;
margin-left:80%;
margin-top:-25px;
}

.types{
position:absolute
}

.description{
margin-top:10px;
margin-bottom:15px;
}

.info-food{
padding:13px;
}

.buy-button{
position :absolute;
margin-top:-60px;
margin-left:17%;
}


</style>

        <div class="container">
        <div class="mt-5 mb-4"><h2>Best Food In Restaurant</h2></div>
		<div class="row">
       
       <% 
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
		 Statement stmt=con.createStatement();
		 String sql;
		 sql="select * from menu";
		 ResultSet rs=stmt.executeQuery(sql);
		 
		 while(rs.next()){
		
		%>	
   
		   <div class="col-md-4">
		   <form action="menu-data-store.jsp" method="post">
		    <div class="card bg-light">
		    
		       <img src="image/<%out.println(rs.getString("image")); %>" height=200 width=auto class="images">
		    
		         <div class="info-food">
		          	   <h5 class="name">         <%  out.println(rs.getString("food_name"));  %> </h5>
		               <h6 class="price"> &#8377; <b><%  out.println(rs.getString("price"));  %> </b></h6>
		                        <h6 class="types"> <%  out.println(rs.getString("type"));       %></h6> <br>
		               <h6 class="description">  <%  out.println(rs.getString("details"));    %> </h6>
		               <input type="hidden" name="quantity" class="form-control" value="1" style="width: 60px;">
		               
		               <input type="hidden" name="fname" value="<%= rs.getString("food_name")%>">
		               <input type="hidden" name="price" value="<%= rs.getString("price")%>">
		               <input type="hidden" name="description" value="<%= rs.getString("details")%>">
		               <input type="hidden" name="type" value="<%= rs.getString("type")%>">
		               <input type="hidden" name="image" value="<%= rs.getString("image")%>">
		             
		      
		           <div>
		               <input type="submit" value="Add To Cart" class="btn btn-primary mt-2">
		           </div>
		        </div>
		     </div>
		   </form>
		   
		       <form action="place-order.jsp" method="post">
	                 
	                 <input type="hidden" name="qty" value="1">
		               <input type="hidden" name="id" value="<%= rs.getString("id")%>">
		               <input type="hidden" name="food_name" value="<%= rs.getString("food_name")%>">
		               <input type="hidden" name="price" value="<%= rs.getString("price")%>">
		               <input type="hidden" name="description" value="<%= rs.getString("details")%>">
		               <input type="hidden" name="type" value="<%= rs.getString("type")%>">
		               <input type="hidden" name="image" value="<%= rs.getString("image")%>">
		                <div class="buy-button">
		                  <input type="submit" value="Buy Now" class="btn btn-outline-primary mt-2">
		                </div>
		       </form>
		 </div>
 
	   <%		 
		 }
       %>
		</div>    
	   </div>
</body>
</html>  