<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
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
<style>
.card{
margin:20px;
}
.h3{
margin-left:20px;
}
.back_btn{
height:30px;
width:80px;
background-color:blue;
color:white;
border-radius:4px;
margin-top:-45px;
margin-left:90%;
}
.name{
float:left;
padding-right:30px;
}
.input-box{
width:240px;
margin-bottom:20px;
border:1px solid white;
}
.total{
justify-content:right;
display:flex;
margin-right:40px;
font-size:22px;
}

.in_process{
width:140px;
background-color:orange;
border-radius:5px;
color:white;
}
.completed{
width:140px;
background-color:green;
border-radius:5px;
color:white;
}
.select-box{
width:200px;
height:35px;
border-radius:4px;
background-color:transparent;

}

</style>
</head>
<body>
      <%  
         String status=request.getParameter("select");
         int id=Integer.parseInt(request.getParameter("id"));
      
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
         Statement stmt=con.createStatement();
         
         String sql="select * from orders where id='"+id+"'";
         ResultSet rs=stmt.executeQuery(sql);

       
         %>
         
         <div class="container-body">
           <div>
             <h3 class="mt-4 h3">Order details</h3>
              <a href="orders.jsp"><button type="button" class="back_btn">Back</button></a>
           </div> 
           <div class="card">
             <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <%
                   if(rs.next())
                   {

                  %>
                   <h4>Delivery details</h4><hr>
                    <div class="name">
                      <label><b>First Name</b></label><br>
                      <input type="text" class="input-box" value="<% out.println(rs.getString("name")); %>" readonly>
                    </div>
                    
                    <div>
                      <label><b>Last Name</b></label><br>
                      <input type="text" class="input-box" value="<% out.println(rs.getString("last_name")); %>" readonly>
                    </div>
                    
                     <div class="name">
                      <label><b>Contact Number</b></label><br>
                      <input type="text" class="input-box" value="<% out.println(rs.getString("phone_no")); %>" readonly>
                     </div>
                     
                     <div class="name">
                       <label><b>Pin Code</b></label><br>
                       <input type="text" class="input-box" value="422601" readonly>
                     </div>
                     
                     <div class="name">
                       <label><b>Delivery Address</b></label><br>
                       <p><%  out.println(rs.getString("address")); %></p>
                     </div>
                   
                </div>
                
                <div class="col-md-6">
                  <table class="table mt-2">
                   <thead>
                     <tr>
                       <th>Image</th>
                       <th>Name</th>
                       <th>Price</th>
                       <th>Quantity</th>
                     </tr>
                   </thead>
                   
                   <tbody>
                   
                   <%
                   ArrayList<Integer> a1=new ArrayList<Integer>();
                   int price,qty ,total;
                 
                  
     
                   %>
                     <tr>
                       <td><img src="image/<%=rs.getString("image") %>"  height=60 width=60></td>
                       <td><% out.println(rs.getString("dish_name")); %></td>
                       <td width=100><% out.println(rs.getString("price"));%></td>
                       <td><% out.println(rs.getString("quantity"));%></td>
                     </tr>
                     
                    
                     
                     
                 <% 
                 
                  price= Integer.parseInt(rs.getString("price"));
                  qty= Integer.parseInt(rs.getString("quantity"));
                  total=price*qty;
                  a1.add(total);
                 
                  int totals=0;
                   for(int i=0;i<a1.size();i++)
           	     	{
           		      totals= totals+a1.get(i);
           		    }
                   
                   
                 %>
                   </tbody>
                    
                  
                  </table>
                  <div>
                      <b class="total">Total Price : &#8377; <% out.println(totals); %> </b>
                  </div>
                 <% } %>      
                  
                  <div>
                  <%
                  Statement stmt1=con.createStatement();
                  String sql1="select * from orders";
                  ResultSet rs1=stmt.executeQuery(sql);

                  
                   if(rs1.next())
                   {
                      
                      
                  %>
                    <h6><b>Order Status :</b> <%
                    if(rs1.getString("status").equals("pending"))
                    { 
                    	%><button class="in_process text-center"> <% out.println("In Progress");%></button> <%
                    }
                    else
                    { 
                     %> 	<button class="completed text-center"> <% out.println("Completed");%></button> <%
                    }
                    %>
                    </h6>
                    
                    <p><b>Payment Mode :</b> Cash On Delivery</p>
                    <p><b>Payment Status :</b> <% out.println(rs1.getString("status"));  %> </p>
                    <p><b>Placed At : </b><% out.println(rs1.getString("date")); out.println(rs1.getString("time")); } %></p><hr>
                    
                 <div class="select">                  
                   <label>Update Order Status </label>
                   <form action="update-status.jsp" method="post">
                   <select name="select" class="select-box">
                     <option>pending</option>
                     <option >completed</option>
                    </select>
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="submit" value="update" class="update-btn">
                    </form>
                    
                   
                </div>
                  </div>
                </div>
                
              </div>           
             </div>
           </div>
         </div>

</body>
</html>

