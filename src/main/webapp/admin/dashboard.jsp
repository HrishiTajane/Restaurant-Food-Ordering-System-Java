<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
body{
background-color:#f2f6fc;
}
.card:hover{
box-shadow:0 0 6px 2px rgb(22, 22, 22);
}
.main-container{
padding-left:5%;
padding-right:5%;
}
.card-pending{
/* background-image: linear-gradient(-60deg, #ff5858 0%, #f09819 100%);
color:white; */
}
.card-completed{
/* background-image: linear-gradient(to top, #0ba360 0%, #3cba92 100%);

color:white; */
}
.card-menu{
/* background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
color:white; */
}
.card-customer{
/* background-color: #3e187a;
background-image: linear-gradient(316deg, #3e187a 0%, #994ecc 74%); */
color:black;

}
.card-income{
/* background-image: linear-gradient(to top, #cc208e 0%, #6713d2 100%);

color:white; */
color:black;
}
.text-size{
font-size:22px;
}
.veiw-details{
color:black;
}
</style>
</head>
<body>

            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
            
            Statement stmt =con.createStatement();
          
            %>



         <div class="container-body main-container">
           <h2 class="dash-name mt-3"><b>Restaurant Dashboard </b></h2><hr>
            
            <div class="row mt-5">
              <div class="col-md-4">
                <div class="card card-pending">
                  <div class="card-body">
                   <%
                     String sql="select count(*) from orders where status='pending'";
                     ResultSet rs= stmt.executeQuery(sql);
           
                     rs.next();
                     int pending_orders=rs.getInt(1);
                    %>
                    <h6 class="text-size"> Pending Orders : <% out.println(pending_orders); %> </h6>
                  </div>
                  <div class="card-footer">
                    <h6><a href="orders.jsp"class="veiw-details"> View Details</a> </h6>
                  </div>
                </div>
              </div>
              
              <%
            String sql1="select count(*) from orders where status='completed'";
            ResultSet rs1= stmt.executeQuery(sql1);
           
            rs1.next();
            int complete_orders=rs1.getInt(1);
           
            
            %>
              
              <div class="col-md-4">
                <div class="card card-completed">
                  <div class="card-body">
                    <h6 class="text-size"> Completed Orders : <% out.println(complete_orders); %> </h6>
                  </div>
                  <div class="card-footer">
                    <h6> <a href="orders.jsp"class="veiw-details">View Details </a></h6>
                  </div>
                </div>
              </div>
              
              
              
              <%
            
                String sql2="select count(*) from menu";
                ResultSet rs2= stmt.executeQuery(sql2);
                
                rs2.next();	
               int  menu_items=rs2.getInt(1);

             %>
              <div class="col-md-4">
                <div class="card card-menu">
                  <div class="card-body">
                    <h6 class="text-size"> Menu (items) : <% out.println(menu_items); %> </h6>
                  </div>
                  <div class="card-footer">
                    <h6><a href="menu.jsp" class="veiw-details"> View Details</a> </h6>
                  </div>
                </div>
              </div>   
         </div>
         
            <%
            
                String sql3="select count(*) from login";
                ResultSet rs3= stmt.executeQuery(sql3);
                
                rs3.next();	
                int Register_customers=rs3.getInt(1);

             %>
             
         <div class="row mt-5">
            <div class="col-md-4">
                <div class="card card-customer">
                  <div class="card-body">
                    <h6 class="text-size"> Register Customers : <% out.println(Register_customers); %> </h6>
                  </div>
                  <div class="card-footer">
                    <h6><a href="customer.jsp" class="veiw-details"> View Details</a> </h6>
                  </div>
                </div>
              </div>
              
              
              <%
              LocalDateTime dt=LocalDateTime.now();
              DateTimeFormatter df=DateTimeFormatter.ofPattern("yyyy-MM-dd");
              
              String date=dt.format(df); 
              
              String sql5="select * from orders where date='"+date+"' AND status='completed'";
              ResultSet rs5= stmt.executeQuery(sql5);
              
              ArrayList<Integer> a2=new ArrayList<Integer>();
              while(rs5.next())
              {
            	  int price=Integer.parseInt(rs5.getString("price"));
            	  int qty=Integer.parseInt(rs5.getString("quantity"));
            	  
            	  int total=price*qty;
            	  a2.add(total);
              }
              
              int today_income=0;
              for(int i=0;i<a2.size();i++)
              {
            	  today_income=today_income+a2.get(i);
              }
              
            %>
            
               <div class="col-md-4">
                <div class="card card-income">
                  <div class="card-body">
                    <h6 class="text-size"> Today Income : <% out.println(today_income);%> </h6>
                  </div>
                  <div class="card-footer">
                 
                     <h6 class="veiw-details"> View Details </h6>
                  </div>
                </div>
              </div>
           
          
            <%
              String sql4="select * from orders where status='completed'";
              ResultSet rs4= stmt.executeQuery(sql4);
              
              ArrayList<Integer> a1=new ArrayList<Integer>();
              while(rs4.next())
              {
            	  int price=Integer.parseInt(rs4.getString("price"));
            	  int qty=Integer.parseInt(rs4.getString("quantity"));
            	  
            	  int total=price*qty;
            	  a1.add(total);
              }
              
              int Total_Earning=0;
              for(int i=0;i<a1.size();i++)
              {
            	   Total_Earning=Total_Earning+a1.get(i);
              }
              
            %>
            
             <div class="col-md-4">
                <div class="card card-income">
                  <div class="card-body">
                    <h6 class="text-size"> Total Earnings : <% out.println(Total_Earning);%> </h6>
                  </div>
                  <div class="card-footer">
                 
                     <h6 class="veiw-details"> View Details </h6>
                  </div>
                </div>
              </div>
              
         </div>
    
    </div>
</body>
</html>