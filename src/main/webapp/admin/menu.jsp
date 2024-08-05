<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="navbar.css">
<meta charset="UTF-8">
<title>Menu card</title>
</head>
<body>

  <style>

body{
background-color:#f2f6fc;
}
.table-menu{
margin-left:20px;
margin-right:20px;
}

button{
width:170px;
color:white;
background-color:blue;
border-radius:6px;
}
button:hover{
background-color:transparent;
border:1px solid black;
color:black;
}
</style> 


  
      <div class="container-body">
<div class="modal-button text-center">
<button type="button" class="mt-5" data-toggle="modal" data-target="#exampleModal">
 <h4><b class="button">Add New Food</b></h4>
</button>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h3 class="modal-title" id="exampleModalLabel"><b>Add New Food</b></h3>        
      </div>
      <form action="addfood.jsp" method="post">
      <div class="modal-body">
             <div class="row justify-content-md-center">
                    <div class="col col-lg-12">

                        <div class="card">
                           
                            <div class="card-body">
                                    <div class="form-group "> <label for="">dish name:</label>
                                        <input type="text" class="form-control" name="dish_name" placeholder="Enter dish name" required>
                                    </div>                                  
                                    <div> <label for="">Price:</label>
                                       <input type="text" class="form-control" name="price" placeholder="Enter dish price" required> 
                                    </div><br>      
                                  
                                    <div class="form-group "> <label for="dish_details">dish details:</label>
                                        <input type="text" class="form-control" id="dish_details" name="dish_details" placeholder="Enter dish destails" required>                                    
                                    </div>
                                    <label for="">Select type:</label><br>
                                        <select name="dish_type" class="form-control w-25" >
                                            <option>Select</option>
                                            <option>Veg</option>
                                            <option>Non-veg</option>
                                        </select>
                                    <br>
                                    <div>
                                        <div class="form-group ">   
                                        <label for="">upload photo:</label>
                                        <input type="file" name="file" class="box form-control w-50"  required accept=".jpg, .jpeg, .png">

                                        </div>
                                    </div>
                                    
                                    
                                    
                               
                            </div>
                        </div>
                    </div>
                </div>
           
      </div>
        <div class="modal-footer">
            <input type="submit" value="add" class="btn btn-success w-25">
            <button type="button" value="cancel" class="btn btn-danger" id="close-btn" data-dismiss="modal">cancel</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="table-menu">
<table class="table table-striped table-bordered table-hover mt-5">
   <thead class="bg-primary">
   <tr class="text-center">
     <th width="20px" class="text-center">Sr.no</th>
     <th class="text-center">Photo</th>
     <th class="text-center">Dish name</th>
     <th class="text-center">Price</th>
     <th class="text-center">Type</th>
     <th width="330px" class="text-center" >Description</th>
     <th class="text-center">Action</th>
   </tr>
   </thead>
   <%
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
   Statement stmt=con.createStatement();
   String sql="select * from menu";
   ResultSet rs=stmt.executeQuery(sql);
   int i=1;
   while(rs.next())
   {
   
   %>
   <tbody>
     <tr>
        <td class="text-center"><% out.println(i);%></td>
        <td class="text-center"><img src="User/image/<% out.println(rs.getString("image"));%>" height=100 width=100></td>
        <td class="text-center"><% out.println(rs.getString("food_name"));%></td>
        <td class="text-center"><% out.println(rs.getString("price"));%></td>
        <td class="text-center"><% out.println(rs.getString("type"));%></td>
        <td class="text-center"><% out.println(rs.getString("details"));%></td>
        <td>
           <a href="food_edit_form.jsp?id=<%=rs.getInt("id") %>" class="btn btn-primary w-75">Edit</a><br><br>
           <a href="food_delete.jsp?id=<%=rs.getInt("id") %>" class="btn btn-danger w-75">Remove</a>
           
        
        </td>
     </tr>
   </tbody>
   <% i++;} %>
</table>
</div>




      </div>
</body>
</html>