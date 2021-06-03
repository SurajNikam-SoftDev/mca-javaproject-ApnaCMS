<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: Add New Parcel</title>
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
    <script type = "text/javascript">
    	function validation(){
    	
    		var contactexp = /^\d{10}$/;
			var emailexp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var zipexp = /^\d{6}$/;
			var letterexp = /^[A-Za-z]+$/;
            var numberexp = /^\d+$/;
			
            if(document.form.sender_name.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Sender Name";  
    			return false;
    		}
			else if(!document.form.sender_name.value.match(letterexp))
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Correct Sender Name";  
    			return false;
    		}
			else if(document.form.sender_address.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Sender Address";  
    			return false;
    		}
    		else if(document.form.sender_contact.value=='')
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Sender Contact";  
    			return false;
    		} 
    		else if(!document.form.sender_contact.value.match(contactexp))
    		{
    			document.getElementById("errorspan").innerHTML = "Enter Correct Sender Contact";  
    			return false;
    		}
    		else if(document.form.recipient_name.value=='')
    		{
        		document.getElementById("errorspan").innerHTML = "Enter Recipient Name";  
        		return false;
        	}
    		else if(!document.form.recipient_name.value.match(letterexp))
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Correct Recipient Name";  
        		return false;
        	}
        	else if(document.form.recipient_address.value=='')
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Recipient Address";  
        		return false;
        	}
        	else if(document.form.recipient_contact.value=='')
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Recipient Contact";  
        		return false;
        	} 
        	else if(!document.form.recipient_contact.value.match(contactexp))
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Correct Recipient Contact";  
        		return false;
        	}
        	else if(document.form.type.value==-1)
        	{
        		document.getElementById("errorspan").innerHTML = "Select Type";  
        		return false;
        	}
        	else if(document.form.weight.value=='')
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Weight";  
        		return false;
        	} 
        	else if(!document.form.weight.value.match(numberexp))
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Number Only";  
        		return false;
        	}
        	else if(document.form.price.value=='')
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Price";  
        		return false;
        	} 
        	else if(!document.form.price.value.match(numberexp))
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Number Only";  
        		return false;
        	}
        	else if(document.form.total.value=='')
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Total";  
        		return false;
        	} 
        	else if(!document.form.total.value.match(numberexp))
        	{
        		document.getElementById("errorspan").innerHTML = "Enter Number Only";  
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
#pickup-branch-div{
	display: none;
}

</style>
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
                                <a href="#" class="nav__link">
                                	<i class='bx bx-git-branch nav__icon'></i>
                                    <span class="nav__name">Branch</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="AddNewBranch" class="nav__dropdown-item">Add New</a>
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
                                <a href="#" class="nav__link active">
                                    <i class='bx bx-box nav__icon' ></i>
                                    <span class="nav__name">Parcel</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>
								<div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="AddNewParcel" class="nav__dropdown-item active">Add New</a>
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
        	<b>Add New Parcel</b>
        
        </div>
        <div class = "container-fluid form-container">
        	
        <form class = "form-body" name = "form">
            <div class="row">
	          <div class="col-md-6">
	              <b>Sender Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_name"  class="form-control form-control-sm" >
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_address"  class="form-control form-control-sm" >
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_contact"  class="form-control form-control-sm" maxlength="10" >
	              </div>
	          </div>
	          <div class="col-md-6">
	              <b>Recipient Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_name"  class="form-control form-control-sm" >
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_address"  class="form-control form-control-sm" >
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_contact"  class="form-control form-control-sm" maxlength="10">
	              </div>
	          </div>
	        </div>
           	<hr>
           	<div class="row">
	          <div class="col-md-6">
	            <div class="form-group">
	              <label for="type">Type<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="type" id = "type" class="form-control" style = "font-size: 12px;" onchange = "showDiv(this)">
                    	<option value = "-1" selected>Choose Type...</option>
	                    <option value = "Deliver">Deliver</option>
	                    <option value = "PickUp">PickUp</option>
                    </select>
	            </div>
	          </div>
	           <div class="col-md-6">
	             <div class="form-group">
	                <label for="" class="control-label">Branch Processed<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="category" class="form-control" style = "font-size: 12px;">
	                   <option selected>Choose Branch Processed...</option>
	                   <option>1</option>
	                   <option>2</option>
	                   <option>3</option>
                    </select>
	            </div>
	              
	            <div class="form-group" id="hidden_div" style = "display:none;">
	              	<label for="" class="control-label" >Pickup Branch<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="category" class="form-control" style = "font-size: 12px;">
	                    <option selected>Choose Pickup Branch...</option>
	                    <option>1</option>
	                    <option>2</option>
	                    <option>3</option>
                    </select>
	            </div>
	          </div>
	        </div>
            <hr>
            <b>Parcel Information</b>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="productprice">Height</label>
                    <input type="text" class="form-control" name="height" placeholder="Height">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Weight<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="weight" placeholder="Weight">
                </div>
            	<div class="form-group col-md-2">
                    <label for="productprice">Length</label>
                    <input type="text" class="form-control" name="length" placeholder="Length">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Width</label>
                    <input type="text" class="form-control" name="width" placeholder="Width">
                </div>
            	<div class="form-group col-md-2">
                    <label for="productprice">Price<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="price" placeholder="Price">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Total<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="total" placeholder="Total">
                </div>
            </div>
            <hr>
            
            <div class = "text-center">
                <!-- Button trigger modal -->
                <button type="submit" class="btn btn-primary form-control" style = "font-size: 12px;font-weight: bolder;" onclick = "return validation()">Submit</button>
            </div> 
            
            <!-- Modal -->
            
            
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
	function showDiv(select){
		
		if(select.value=='-1'){
			document.getElementById('hidden_div').style.display = "none";	
		}
		else if(select.value=='Deliver'){
	    	document.getElementById('hidden_div').style.display = "none";
	   	}
		else if(select.value=='PickUp'){
	    	document.getElementById('hidden_div').style.display = "block";
	   	} 
		
	} 
	</script>
</body>
</html>