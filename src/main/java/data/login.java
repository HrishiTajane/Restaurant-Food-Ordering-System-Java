package data;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
				  

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurent","root","");

    
    Statement stmt=con.createStatement();

	String sql;
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	
	
	sql="select * from login where username='"+username+"' AND password='"+password+"'";
	  ResultSet rs=stmt.executeQuery(sql);
	
	  if(rs.next())
	  {
		  
    HttpSession s1=request.getSession();
    s1.setAttribute("username", username);
    
		  out.println("<script>window.location.href = 'admin/User/home.jsp'</script>");
	  }
	  else{
		  
	      out.println("<script>alert('username and password not match')</script>");
	      out.println("<script>window.location.href = 'login.html'</script>");
		  
	  }
	  
	}catch(Exception e)
	{
		
	}
    
	}

}
