<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <%

            Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");
	        
	        String sql;
	        Statement stmt1=con.createStatement();
		        sql="select * from login where username='"+username+"'";
		        ResultSet rs=stmt1.executeQuery(sql);
		        
		        String name,last_name,phone_no,address;
		        if(rs.next())
		         {
		        	 name=rs.getString("name");
		        	 last_name=rs.getString("last_name");
		        	 phone_no=rs.getString("phone_no");
		        	 address=rs.getString("address");
		        	 
		        	
		          
		            
	        
             String fname,price1,type,qty1,image,desc;
	        
             int id=Integer.parseInt(request.getParameter("id"));
	         fname=request.getParameter("food_name");
	         price1=request.getParameter("price");
	         qty1=request.getParameter("qty");
	         type=request.getParameter("type");
	         image=request.getParameter("image");
	         desc=request.getParameter("desc");
	         
             LocalDateTime dt=LocalDateTime.now();
             DateTimeFormatter df=DateTimeFormatter.ofPattern("yyyy-MM-dd");
             DateTimeFormatter df1=DateTimeFormatter.ofPattern("H:m a");
              String date=dt.format(df);
              String times=dt.format(df1);
              	         
              Statement stmt=con.createStatement();
              
              String sql2="select * from orders where username='"+username+"' AND dish_name='"+fname+"'";
              ResultSet rs2=stmt.executeQuery(sql2);
		           		         
		        	if(rs2.next())
		        	{
		        		out.println("<script>alert('You Allready Orderd This Food Try Another Food');</script>");
		        		out.println("<script>window;location.href='menu.jsp';</script>");
		        	}
	   		        
		         else{
		        	 
		        	 
		        	 PreparedStatement ps=null;
	   		         String sql1="insert into orders(name,last_name,phone_no,address,dish_name,price,description,quantity,type,image,status,username,date,time)values('"+name+"','"+last_name+"','"+phone_no+"','"+address+"','"+fname+"','"+price1+"','"+desc+"','"+qty1+"','"+type+"','"+image+"','pending' ,'"+username+"','"+date+"','"+times+"')";
	   		         ps=con.prepareStatement(sql1);
	   		         ps.executeUpdate();
  		             
	   		         out.println("<script>alert('Order Sent Successfully');</script>");
	   		         
	   		         PreparedStatement ps1=null;
	   		         String sql3="delete from cart where id='"+id+"'";
	   		         ps1=con.prepareStatement(sql3);
	   		         ps1.executeUpdate();
	   		         
	   		      out.println("<script>window;location.href='orders.jsp';</script>");
	   		         
		           }
	         
		         }
       %>
</body>
</html>