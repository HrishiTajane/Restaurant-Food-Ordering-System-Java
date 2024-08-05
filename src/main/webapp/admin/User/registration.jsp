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

String name,email,username,l_name;
String phone_no,pass,cpass,address;


name=request.getParameter("name");
l_name=request.getParameter("l_name");
email=request.getParameter("email");
phone_no=request.getParameter("phone_no");

username=request.getParameter("uname");
pass=request.getParameter("password");
cpass=request.getParameter("cpassword");
address=request.getParameter("address");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

PreparedStatement ps=null;


String sql1;


Statement stmt =con.createStatement();

sql1="select * from login where email='"+email+"'";
ResultSet rs=stmt.executeQuery(sql1);

if(rs.next())
{
	out.println("<script>alert('Email id exist')");
	out.println("window.location.href='registration.html'</script>");
	
}
else{
	


	   
String sql;

if(pass.equals(cpass)){
sql="insert into login(name,email,phone_no,username,password,cpassword,last_name,address) values ('"+name+"','"+email+"','"+phone_no+"','"+username+"','"+pass+"','"+cpass+"','"+l_name+"','"+address+"')";

ps=con.prepareStatement(sql);
ps.executeUpdate();

out.println("<script>alert('record submited')</script>");
out.println("<script>window.location.href='login.html';</script>");

}
else{
	   out.println("<script>alert('password and confirmed password not match')");
	   out.println("window.location.href='registration.html'</script>");
}
}

%>

</body>
</html>