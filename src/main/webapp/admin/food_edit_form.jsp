<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="navbar.css">
<meta charset="UTF-8">
<title>Edit form</title>
</head>
<body>
      <%
      int id=Integer.parseInt(request.getParameter("id"));
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
      
      Statement stmt=con.createStatement();
      String sql="select * from menu where id='"+id+"'";
      ResultSet rs=stmt.executeQuery(sql);
   
      if(rs.next())
      {
      %>
      <form action="food_edit.jsp" method="post">
      <div class="row justify-content-md-center mt-3">
      <div class="col col-md-5">

          <div class="card">
          
          <div class="card-header text-center">
          <h3>Edit food item</h3>
          </div>
             
              <div class="card-body">
                      <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                      <div class="form-group "> <label for="">dish name:</label>
                          <input type="text" class="form-control" name="dish_name" value="<% out.println(rs.getString("food_name")); %>" required>
                      </div><br>                                  
                      <div> <label for="">Price:</label>
                         <input type="text" class="form-control" name="price" value="<% out.println(rs.getString("price")); %>" required> 
                      </div><br>      
                    
                      
                      <label for="">Select type:</label><br>
                          <select name="dish_type" class="form-control w-25" required>
                              <option>select type </option>
                              <option>Veg</option>
                              <option>Non-veg</option>
                          </select><br>
                      
                           
                          <label for="">upload photo:</label>
                          <input type="file" name="image" class="box form-control w-50" accept=".jpg, .jpeg, .png" required><br>
         
              
                      <div class="form-group "> <label for="dish_details">dish details:</label>                                               
                          <textarea rows=2 class="form-control" name="details" ><% out.println(rs.getString("details")); %></textarea>
                      </div>
                </div>
                
              <div class="card-footer">
                  <input type="submit" value="Submit" class="btn btn-outline-success"> 
                   <a href="menu.jsp"><input type="button" value="Cancel" class="btn btn-outline-danger"></a>
              </div>
          </div>
      </div>
  </div>
  </form>


     <%
    	
      }
      
      
      
      %>
      
</body>
</html>