<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%
        
    
  

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

    
    Statement stmt=con.createStatement();

	String sql;
	
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	  sql="select * from login where username='"+username+"' AND password='"+password+"'";
	  ResultSet rs=stmt.executeQuery(sql);
	
	  if(rs.next())
	  {
		  
    HttpSession s1=request.getSession();
    s1.setAttribute("username", username);
    
		  out.println("<script>window.location.href = 'home.jsp'</script>");
	  }
	  else{
		  
	      out.println("<script>alert('username and password not match')</script>");
	      out.println("<script>window.location.href = 'login.html'</script>");
		  
	  }
    
    
    
    %>


</body>
</html>