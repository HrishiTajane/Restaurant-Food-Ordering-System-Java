
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

HttpSession s1=request.getSession(false);

String username=(String)s1.getAttribute("uname");

if(username==null)
{
	response.sendRedirect("login.html");
}

%>


<html>
<head>


<meta charset="UTF-8">

<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="navbar.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<body>
       
       <div class="header" style="z-index: 1;">
       <h2 class="resto-name">Restaurant</h2> 
    <i class="fa fa-user adminprofile">&nbsp <a href="profile.jsp" class="admin-name">Admin</a></i>
      <div class="hamberger">
                <span>
                    <i class="ham fa fa-bars"> </i>
                    <i class="cross fa fa-times text-light"></i>
                </span>
            </div>
       </div>
           <nav style="z-index: 1;">
            <ol>
                <div id="viewport">
                    <div class="aside sidebarGo" id="sidebarGo">

                        <ul>                                                       
                            <li class="nav_list_profile"><b><i class="fa fa-user icon-nav"></i>  &nbsp&nbsp<a href="profile.jsp">Profile</a></b> </li>
                            <li class="nav_list"><b><i class="fa fa-home icon-nav"></i>&nbsp&nbsp<a href="dashboard.jsp">Dashboard</a></b></li>
                            <li class="nav_list"><b><i class="fa fa-users icon-nav"></i>&nbsp&nbsp<a href="customer.jsp">Customers</a></b></li>
                            <li class="nav_list"><b><i class="fa fa-book icon-nav"></i> &nbsp&nbsp<a href="menu.jsp">Menu</a></b></li>
                            <li class="nav_list"><b><i class="fa fa-circle-o icon-nav"> &nbsp&nbsp</i><a href="orders.jsp">Orders</a></b></li>
                           <!--  <li class="nav_list"><b><i class="fa fa-circle-o icon-nav"> &nbsp&nbsp</i><a href="welcom.jsp">Report</a></b></li> -->
                        </ul>
                    </div>
                </div>
            </ol>
          
          
        </nav>
        
        
        <!--*********************************** right div ******************************************* -->
        
        <div class="right-div mobile-div">
            
        </div>
        
        

   <script src="navbar.js"></script>
</body>
</html>