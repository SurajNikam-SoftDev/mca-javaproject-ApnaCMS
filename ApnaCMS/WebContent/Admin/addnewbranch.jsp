<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: Add New Branch</title>
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
    
    <script src="./assets/js/countries.js"></script>
    
    <script type = "text/javascript">
    	function validation(){
    	/*	var phoneNumber = document.getElementById('contactno').value;
    		var phoneRGEX = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
    		
    		var postalCode = document.getElementById('zipcode').value;
    		var postalRGEX = /^[A-Z]{1,2}[0-9]{1,2} ?[0-9][A-Z]{6}$/i;
    	*/
    	
    		var zippattern="/^\d{6}$/";	//	pincode
            var mobilepattern='/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/';	//  mobile number
            //var email=/^([a-z A-Z 0-9 _\.\-])+\@(([a-z A-Z 0-9\-])+\.)+([a-z A-z 0-9]{3,3})+$/;	//	email
            
            
            if(document.form.streetbuilding.value==0)
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Street/Building";  
    			return false;
    		}
    		else if(document.form.state.value==-1)
    		{
    			document.getElementById("errorspan").innerHTML = "Select State First";  
    			return false;
    		}
    		else if(document.form.city.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Select City";  
    			return false;
    		} 
    		else if(document.form.zipcode.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Enter ZipCode";  
    			return false;
    		}
    		else if(document.form.contactno.value==''){
    			document.getElementById("errorspan").innerHTML = "Enter Contact Number";  
    			return false;
    		}
    		else
    		{
    			document.getElementById("errorspan").innerHTML = "";
    			return true;
    		}
    		 
    		
    		/*
    		else if(phoneRGEX.test(phoneNumber)==false){
    			document.getElementById("errorspan").innerHTML = "Enter Correct ZipCode";  
    			return false;
    		}
    		else if(postalRGEX.test(postalCode)==false){
    			document.getElementById("errorspan").innerHTML = "Enter Correct Contact Number";  
    			return false;
    		}
    		*/
//    		document.getElementById("errorspan").innerHTML = "error";  
//     		document.​getElementById("errorspan").element.style.color = 'red';

    	} 
    </script>
</head>
<body>
<%
	if(session.getAttribute("emailid")==null)
	{
		response.sendRedirect("./LogIn");
	}	
%>
	<!--========== HEADER ==========-->
        <header class="header">
            <div class="header__container">
				
                <a href="AdminPanel" class="header__logo" style = "text-decoration:none;">Apna Courier Management System - Admin Panel |<small> Welcome, <%= session.getAttribute("emailid") %></small></a>
    
                <div class="header__search">
                    <input type="search" placeholder="Search" class="header__input">
                    <i class='bx bx-search header__icon'></i>
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
                    <a href="AdminPanel" class="nav__link nav__logo" >
                        <i class='bx bx-mask nav__icon' ></i>
                        <span class="nav__logo-name">AdminPanel</span>
                    </a>
    				<div class="nav__list">
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Menu</h3> 
    						<a href="AdminPanel" class="nav__link ">
                                <i class='bx bx-home nav__icon' ></i>
                                <span class="nav__name">Home</span>
                            </a>
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link active">
                                	<i class='bx bx-git-branch nav__icon'></i>
                                    <span class="nav__name">Branch</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="AddNewBranch" class="nav__dropdown-item active">Add New</a>
                                        <a href="BranchList" class="nav__dropdown-item">List</a>
                                    </div>
                                </div>
                            </div>
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                    <i class='bx bxl-ok-ru nav__icon'></i>
                                    <span class="nav__name">Branch Staff</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="AddNewBranchStaff" class="nav__dropdown-item">Add New</a>
                                        <a href="BranchStaffList" class="nav__dropdown-item">List</a>
                                    </div>
                                </div>
                            </div>
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                    <i class='bx bx-box nav__icon' ></i>
                                    <span class="nav__name">Parcel</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="AddNewParcel" class="nav__dropdown-item">Add New</a>
                                        <a href="ParcelList" class="nav__dropdown-item">List All</a>
                                        <a href="ItemAcceptByCourier" class="nav__dropdown-item">Item Accepted by courier</a>
                                        <a href="Collected" class="nav__dropdown-item">Collected</a>
                                        <a href="Shipped" class="nav__dropdown-item">Shipped</a>
                                        <a href="InTransit" class="nav__dropdown-item">In-Transit</a>
                                        <a href="ArrivedAtDestination" class="nav__dropdown-item">Arrived At Destination</a>
                                        <a href="OutForDelivery" class="nav__dropdown-item">Out For Delivery</a>
                                        <a href="ReadyToPickUp" class="nav__dropdown-item">Ready To PickUp</a>
                                        <a href="Delivered" class="nav__dropdown-item">Delivered</a>
                                        <a href="PickUp" class="nav__dropdown-item">PickUp</a>
                                        <a href="UnsuccessfullyDelivery" class="nav__dropdown-item">Unsuccessfully Delivery Attempt</a>
                                    </div>
                                </div>
                            </div>
                            <a href="TrackOrder" class="nav__link ">
                                <i class='bx bx-current-location nav__icon' ></i>
                                <span class="nav__name">Track Order</span>
                            </a>
                            <a href="Reports" class="nav__link">
                                <i class='bx bxs-report nav__icon' ></i>
                                <span class="nav__name">Reports</span>
                            </a>
                        </div>
    
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Profile</h3>
                            <a href="ManageAccount" class="nav__link">
                                <i class='bx bx-compass nav__icon' ></i>
                                <span class="nav__name">Manage Account</span>
                            </a>
                            <small class="nav__subtitle" style = "font-size:12px;"> Welcome, <b style = "text-transform:lowercase;"><%= session.getAttribute("emailid") %></b></small>
                        </div>
                    </div>
                </div>

                <a href="LogOut" class="nav__link nav__logout">
                    <i class='bx bx-log-out nav__icon' ></i>
                    <span class="nav__name">Log Out</span>
                </a>
            </nav>
        </div>

        <!--========== CONTENTS ==========-->
        
        <div class = "container-fluid page-header text-center">
        	<b>Add New Branch</b> 
        </div>
        <div class = "container-fluid form-container">
        	<!-- ./ --> 
        <form class = "form-body" name = "form" action = "./AddNewBranch" method = "POST" >
            <div class="form-group">
                <label for="inputAddress">Street/Building<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                <input type="text" class="form-control" name="streetbuilding" id = "streetbuilding" placeholder="Street/Building">
            </div>
           
            <div class="form-row"> 
                <div class="form-group col-md-6">
                    <label for="productprice">Country<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <select class="form-control" name = "country" style = "font-size: 12px;">
                    	<option selected>India</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="productprice">State<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <select id="state" name ="state"  class="form-control" style = "font-size: 12px;">
                    	<option selected>Choose State</option>
                    </select>
                </div>
            </div>
			<div class="form-row">
                <div class="form-group col-md-4">
                    <label for="productprice">City<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <select name ="city" id ="city" class="form-control" style = "font-size: 12px;">
                    <option selected>Choose City</option>
                    
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="productprice">ZipCode<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control"  id = "zipcode" name="zipcode" placeholder="ZipCode">
                </div>
                <div class="form-group col-md-4">
                    <label for="productprice">Contact No<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" id = "contactno" name="contactno" placeholder="Contact No">
                </div>
            </div>
            
            
            <div class = "text-center">
                <!-- Button trigger modal -->
                <button type="submit" class="btn btn-primary form-control"  data-toggle="modal" data-target="#exampleModalCenter" style = "font-size: 12px;font-weight: bolder;" onclick = "return validation()">Submit</button>
            </div> 
             
            <!-- Modal -->
     <!--   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                    <h5 class="modal-title" id="exampleModalLongTitle">Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body text-center">
                   		You Want To Save Data
                    </div>
                    <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button> 
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">No</button>
                        <button type="submit" class="btn btn-primary">Yes</button>
                    </div>
                </div>
                </div>
            </div>-->
            
        </form>
        
	        <div class = "text-center p-2">
	        	<span id = "errorspan" style = "font-size:small;font-weight:bolder;color:red"></span>
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
    <script type="text/javascript">
    	populateStates("state", "city");
	</script>
			
</body>
</html>