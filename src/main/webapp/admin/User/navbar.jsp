<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
HttpSession s1=request.getSession(false);

String username=(String)s1.getAttribute("username");

if(username==null)
{
	response.sendRedirect("login.html");
}

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title></title>

<style>

nav{
width:100%;
top:0;
right:0;
justify-content:right;

display:flex;
height:55px;
background-color:black;
z-index:1;
position:fixed;
}
ol{
list-style-type:none;
}
.nav-items{
justify-content:right;
display:flex;
}

li{
float:left;
padding-left:15px;
padding-right:15px;
margin-top:7px;

}

li a{
  text-decoration:none;
  font-size:23px;
  color:white;
}
li a:hover{
font-size:25px;
 color:red;
}


.div-main{
top:0;
height:55px;
background-color:balck;
}

@media(max-width:610px) {

li a{
  text-decoration:none;
  font-size:18px!important;
  color:white;
}
  
  .buy-button{
   margin-left:65%!important;
  }



}
</style>

</head>
<body>
        
        <nav>
            <ol class="nav-items">
              <li><a href="home.jsp">Home</a></li>
              <!-- <li><a href="about.jsp">About</a></li> -->
              <li><a href="menu.jsp">Menu</a></li>
              <li><a href="cart.jsp">Cart</a></li>
              <li><a href="orders.jsp">Orders</a></li>
              <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
            </ol>
       </nav>
       <div class="div-main">
       
       </div>
</body>
</html>