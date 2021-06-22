<%@page import="com.apnacms.dao.StaffDao"%>
<%@page import="com.apnacms.admin.bean.BranchStaffBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: Manage Account</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<!--========== BOX ICONS ==========-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/form.css">
    
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="./assets/js/staffsearch.js" ></script>
    <script type = "text/javascript">
    function validation(){
    		
	    	var contactexp = /^\d{10}$/;
			var emailexp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var zipexp = /^\d{6}$/;
			var letterexp = /^[A-Za-z]+$/;
            
            if(document.form.firstname.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Enter First Name";  
    			return false;
    		}
    		else
    		{
    			document.getElementById("errorspan").innerHTML = "";
    			return true;
    		}
    		 
    	} 
    </script>
</head>
<style>
input[type=email], input[type=password]{
    font-size: 12px;   
    outline: none;  
}
</style>
<body>
<%
	if(session.getAttribute("emailid")==null)
	{
		response.sendRedirect("./LogIn");
	}	

	String emailid = session.getAttribute("emailid").toString();
	System.out.println("emailid :: "+emailid);
	BranchStaffBean bfb = StaffDao.getStaffAccountByEmailId(emailid);  
%>
	<!--========== HEADER ==========-->
        <header class="header">
            <div class="header__container">
				
                <a href="StaffPanel" class="header__logo" style = "text-decoration:none;">Apna Courier Management System - Staff Panel |<small> Welcome, <%= session.getAttribute("emailid") %></small></a>
    
                <div class="header__search">
                    <input list="browsers" name="browser" id="browser" placeholder="Search" class="header__input"><button type = "submit" onclick = "return search()" style = "border:none;outline:0px;background-color:lightgrey;border-radius:15%"><i class='bx bx-search header__icon'></i></button>
                    <datalist id="browsers" style = "height: 80vh;">
					  <option value="Home">
					  <option value="Parcel List">
					  <option value="Item Accept By Courier">
					  <option value="Collected">
					  <option value="Shipped">
					  <option value="In-Transit">
					  <option value="Arrived At Destination">
					  <option value="Out For Delivery">
					  <option value="Ready To PickUp">
					  <option value="Delivery">
					  <option value="PickUp">
					  <option value="Unsuccessfully Delivery Attempt">
					  <option value="Track Order">
					  <option value="Reports">
					  <option value="Manage Account">
					</datalist>
                </div>
    
                <div class="header__toggle">
                    <i class='bx bx-menu' id="header-toggle"></i>
                </div>
            </div>
        </header>

        <!--========== NAV ==========-->
        <div class="nav" id="navbar">
            <nav class="nav__container">
                <div>
                    <a href="StaffPanel" class="nav__link nav__logo" >
                        <i class='bx bx-mask nav__icon' ></i>
                        <span class="nav__logo-name">StaffPanel</span>
                    </a>
    				<div class="nav__list">
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Menu</h3> 
    						<a href="StaffPanel" class="nav__link ">
                                <i class='bx bx-home nav__icon' ></i>
                                <span class="nav__name">Home</span>
                            </a>
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                    <i class='bx bx-box nav__icon' ></i>
                                    <span class="nav__name">Parcel</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="SP_ParcelList" class="nav__dropdown-item">List All</a>
                                        <a href="SP_ItemAcceptByCourier" class="nav__dropdown-item">Item Accepted by courier</a>
                                        <a href="SP_Collected" class="nav__dropdown-item">Collected</a>
                                        <a href="SP_Shipped" class="nav__dropdown-item">Shipped</a>
                                        <a href="SP_InTransit" class="nav__dropdown-item">In-Transit</a>
                                        <a href="SP_ArrivedAtDestination" class="nav__dropdown-item">Arrived At Destination</a>
                                        <a href="SP_OutForDelivery" class="nav__dropdown-item">Out For Delivery</a>
                                        <a href="SP_ReadyToPickUp" class="nav__dropdown-item">Ready To PickUp</a>
                                        <a href="SP_Delivered" class="nav__dropdown-item">Delivered</a>
                                        <a href="SP_PickUp" class="nav__dropdown-item">PickUp</a>
                                        <a href="SP_UnsuccessfullyDelivery" class="nav__dropdown-item">Unsuccessfully Delivery Attempt</a>
                                    </div>
                                </div>
                            </div>
                            <a href="SP_TrackOrder" class="nav__link ">
                                <i class='bx bx-current-location nav__icon' ></i>
                                <span class="nav__name">Track Order</span>
                            </a>
                            <a href="SP_Reports" class="nav__link">
                                <i class='bx bxs-report nav__icon' ></i>
                                <span class="nav__name">Reports</span>
                            </a>
                        </div>
    
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Profile</h3>
                            <a href="SP_ManageAccount active" class="nav__link">
                                <i class='bx bx-compass nav__icon' ></i>
                                <span class="nav__name">Manage Account</span>
                            </a>
                            <small class="nav__subtitle" style = "font-size:12px;"> Welcome, <b style = "text-transform:lowercase;"><%= session.getAttribute("emailid") %></b></small>
                        </div>
                    </div>
                </div>

                <a href="SP_LogOut" class="nav__link nav__logout">
                    <i class='bx bx-log-out nav__icon' ></i>
                    <span class="nav__name">Log Out</span>
                </a>
            </nav>
        </div>

        <!--========== CONTENTS ==========-->
        
        <div class = "container-fluid page-header text-center">
        	<b>Manage Account</b>
        
        </div>
        <div class = "container-fluid form-container">
        <div class = "row justify-content-center">
        	<div class="col-12">
        		<form class = "form-body" action = "./SP_ManageAccount" method = "POST">
		            <div class="form-group col-md-12"> 
		                    <label for="firstname">Name</label>
		                    <input type="text" class="form-control" name="name" placeholder="Full Name" value = "<%= bfb.getName() %>" style = "text-transform:uppercase">
		            </div>
		            <div class="form-group col-md-12">
		                <label for="inputAddress">Email</label>
		                <input type="email" class="form-control" name="email" value = "<%= emailid%>" readonly>
		            </div>
		           	<div class="form-group col-md-12">
		                <label for="inputAddress">Password</label>
		                <input type="password" class="form-control" name="password" value = "<%= bfb.getPassword() %>" placeholder="Password">
		            </div>
		            
					
		            <div class = "text-center  col-md-12">
		                <!-- Button trigger modal -->
		                <button type="submit" class="btn btn-primary form-control " style = "font-size: 12px;font-weight: bolder;" onclick = "return validation()" >Submit</button>
		            </div>
		            
		            
		        </form>
        	</div>
        </div>	
	        
        </div>
        
	
	
	<div class = "main-footer" style = "margin-top:50px;font-size:x-small;font-weight:bolder;text-align:center;bottom:0;">
		<p class = "main-footer-text">Copyright @ 2021 All Rights Reserved. Terms of Use | Privacy Policy AND Website Design and Developed By <b style = "font-style:oblique;font-weight:bolder;">Suraj Nikam</b></p>
	</div>
	
	

	<script src="./assets/js/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    
    <script src="./assets/js/main.js"></script>
    
    <script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>