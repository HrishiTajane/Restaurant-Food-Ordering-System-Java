<%@page import="java.sql.PreparedStatement"%>
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

<link rel="stylesheet" href="bootstrap.min.css">
<meta charset="UTF-8">
<title>Place Order</title>

<style>
.row{
margin-top:25px;
}

body{
    background-color: rgb(221, 234, 242);
  
}
.address{
 width:100%;
 font-size:18px;
}
.p{
width:90%;
}


.delever-button{
height:50px;
width:200px;
cursor:pointer;

}
.delever-button:hover{
 background-color:transparent;
color:blue;
border:4px solid blue;

}

span{
width:100%
}

a{
margin-left:50%;
}


#td{
font-size:20px;
}

.payment{
font-size:19px;
}

</style>

</head>
<body>
        <div class="container">
           <div class="row">
             
        <div class="col-md-8">
            <div class="card">
              <div class="card-header bg-primary text-light"><h4><b>Delivery Address</b></h4></div>
               <div class="card-body">
                <%
             
                Class.forName("com.mysql.jdbc.Driver");
   		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
   		        Statement stmt1=con.createStatement();
   		        String sql;
   		        sql="select * from login where username='"+username+"'";
   		        ResultSet rs=stmt1.executeQuery(sql);
   		        
   		        String name,last_name,phone_no,address;
   		        if(rs.next())
   		        {
   		        	 name=rs.getString("name");
   		        	 last_name=rs.getString("last_name");
   		        	 phone_no=rs.getString("phone_no");
   		        	
   		        	%> <h4><%out.println(name); out.println(last_name); %></h4>
   		        	   <h5><%out.println(phone_no); %></h5>
   		          
   		            <%

   		        	out.println("<br>");
   		        	
   		        	 address=rs.getString("address");%>
   		        	<h6 class="address"><p class="p"><%out.println(address); %></p></h6><%
   		        	out.println("<br>");
   		        }
   		      
   		         String fname,price1,type,qty1,image,desc;
   		        
   		         int id=Integer.parseInt(request.getParameter("id"));
   		         fname=request.getParameter("food_name");
   		         price1=request.getParameter("price");
   		         qty1=request.getParameter("qty");
   		         type=request.getParameter("type");
   		         image=request.getParameter("image");
   		         desc=request.getParameter("desc");
   		       %>  
   		       
   		       <form action="store-order.jsp" method="post">
   		         
   		         <input type="hidden" name="id" value=<%=id %>>
   		         <input type="hidden" name="food_name" value= <%=fname %> >
   		         <input type="hidden" name="price" value=<%=price1 %>>
   		         <input type="hidden" name="qty" value=<%=qty1 %>>
   		         <input type="hidden" name="type" value=<%=type %>>
   		         <input type="hidden" name="desc" value=<%=desc %>>
   		         <input type="hidden" name="image" value=<%=image %>>
   		         
   		          <div>
   		            	<p class="payment">Payment : Cash On Delivery</p>
   		          </div>	 
   		        <span><a href="payment.jsp"><input type="submit" class="btn btn-primary delever-button" value="DELEVER HERE"></a></span>
   		       
   		       </form>
   		       
   		      </div>
            </div>
        </div>
        
        
        
        
        
        <div class="col-md-4 mx-auto">
         <div class="card">
          <div class="card-header">
            <h5 class="text-center"><b>Price Details</b></h5>
          </div>  
              <%
              
             int price,total1,qty;
           
               String dish_name1=fname;
            	  price=Integer.parseInt(price1);
            	  qty=Integer.parseInt(qty1);
            	  
            	  total1=price*qty;
            	%>  
            	  
             
          <div class="card-body">
            
            <table class="table">
              <tr>
              <th>Dish name </th>
              <td id="td"><%  out.println(dish_name1); %></td>
              </tr>
              <tr>
              <th>Price </th>
              <td id="td"><%  out.println(price); %></td>
              </tr>
              <tr>
              <th>Quantity </th>
              <td id="td"> <%  out.println(qty); %></td>
              </tr>
              <tr>
              <th>Delivery </th>
              <td id="td">Free</td>
              </tr>
             
              <tr class="bg-light">
              <th> <h5><b>Total Amount</b></h5> </th>
              <td height=60 ><h5><b><i class="text-success"> &#8377;   <%  out.println(total1); %> </i></b></h5></td>
              </tr>
            
            </table>
                
            
          </div>
   
         </div>
       </div>
     
   
  </div>
     </div> 
          
</body>
</html>