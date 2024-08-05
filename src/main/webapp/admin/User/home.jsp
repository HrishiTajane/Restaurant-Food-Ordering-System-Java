<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="navbar.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home</title>
</head>
<body>

<style>

body{
background-image:url("image/resto4.png");
background-repeat:no-repeat;

background-size:100%;

}

.text{
height:580px;
align-items:center;
justify-content:center;
display:flex;
}

p{
color:white;
}
.logo{
font-size:80px;
font-family:fangsong; 
}

.btn{
height:100px;
width:600px;
justify-content:center;
display:flex;
}

button{
height:50px;
width:200px;
cursor:pointer;
}

button:hover{
background-color:transparent;
color:white;
border:4px solid red;
}

</style>
   
       <div class="container-fluid">
		   
		   <div class="text">
		      <div>
		         <p class="logo"> ONLY TASTE IS<br> REAL FOR FOOD</p><br>
		       
		          <div class="btn">
		            <a href="menu.jsp"><button type="button" ><b>View Our Menu</b></button></a> 
		         </div>
		      </div>
		   </div>
		   
		   
		   
		   
	   </div>
	   
</body>
</html>