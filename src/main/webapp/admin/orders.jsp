<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
<title>Orders</title>
<style>

.card{
margin-left:27px;
margin-right:27px;
}
.select-box{
width:200px;
height:35px;
border-radius:4px;
background-color:transparent;

}
.date-box{
width:200px;
height:35px;
border-radius:4px;
}
.filter-button{
width:130px;
height:35px;
background-color:#0000FF;
color:white;
border-radius:6px;
}
.select{
float:left;
padding-right:20px;
}
 .search-box{
margin-left:45%;
} 
.view-button{
width:90px;
height:33px;
background-color:#0000FF;
color:white;
border-radius:6px;
}


</style>
</head>
<body>
         <%  
         String status=request.getParameter("select");
         String datetime=request.getParameter("datetime");
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
         Statement stmt=con.createStatement();
         String sql="select * from orders where date='"+datetime+"' AND status='"+status+"'";
         ResultSet rs=stmt.executeQuery(sql);
         
         
         
       
         %>

      <div class="container-body">
        <div class="card mt-4">
          <div class="card-header">
             <h3>Orders</h3>
          </div>
            
          <div class="card-body">
            <div class="search-box">
             <form method="get">
                <div class="select">
                   <label>Status</label><br>
                   <select name="select" class="select-box">
                     <option value="">Select </option>
                     <option>pending</option>
                     <option>completed</option>
                    </select>
                </div>
           
                <div>
                    <label>Date</label><br>
                    <% 
                    
                    LocalDateTime dt=LocalDateTime.now();
                    DateTimeFormatter df=DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    
                    String datetime1=dt.format(df); 
                    
                    %>
                    <input type="date" name="datetime" class="date-box">
              
                    <input type="submit" value="Filter" class="filter-button">
                </div>
             </form>
            </div> 
             <hr>
         </div>
         
             <div class="tables">
                <table class="table table-bordered"> 
                  <thead>
                   <tr> 
                     <th class="text-center" width=70>Sr.no</th>
                     <th class="text-center">Customer Name</th>
                     <th class="text-center">Status</th>
                     <th class="text-center">Order Placed at</th>
                     <th class="text-center">Action</th>
                   </tr>
                  </thead>
                
                <tbody>
                <% 
       
                         int cnt=1;
                         while(rs.next())
                         {
                        %>
                         <tr>
                           <td class="text-center"><%out.println(cnt); %></td>
                           <td><% out.println(rs.getString("name")); out.println(rs.getString("last_name")); %></td>
                           <td class="text-center"><% out.println(rs.getString("status"));%></td>
                           <td  class="text-center" ><% out.println(rs.getString("date")); out.println(rs.getString("time"));%></td>
                           <td class="text-center"><a href="order-details.jsp?id=<%=rs.getInt("id")%>"><button type="button" class="view-button">View</button></a></td>
                         </tr>
                      <%
                        cnt++;
                           }
                         
                    
                  
                  
                   
                   %>
                </tbody>
                
                
                </table>
             </div>
      
      
            
          </div>                              
      </div>
</body>
</html>