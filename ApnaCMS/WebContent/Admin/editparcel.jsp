<%@page import="com.apnacms.bean.ParcelBean"%>
<%@page import="com.apnacms.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: Edit Parcel</title>
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
    <script src="./assets/js/adminsearch.js" ></script>
    <script type = "text/javascript">
    function validation(){
    	
		var contactexp = /^\d{10}$/;
		var emailexp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var zipexp = /^\d{6}$/;
		var letterexp = /^[A-Za-z]+$/;
        var numberexp = /^\d+$/;
        var letterspaceexp = /^[a-zA-Z\s]*$/g;
		
        if(document.form.sender_name.value=='')
		{
			document.getElementById("errorspan").innerHTML = "Enter Sender Name";  
			return false;
		}
		else if(!document.form.sender_name.value.match(letterspaceexp))
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
		else if(!document.form.recipient_name.value.match(letterspaceexp))
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
    	else if(document.form.branchprocess.value==-1) 
    	{ 
    		document.getElementById("errorspan").innerHTML = "Select Branch Processed";  
    		return false;
    	}
    	else if(document.form.type.value=='Deliver' && document.form.deliverybranch.value == 'undefined')  
    	{ 
    		document.getElementById("errorspan").innerHTML = "Select Delivery Branch";  
    		return false;
    	}
    	else if(document.form.type.value=='PickUp' && document.form.pickupbranch.value == 'undefined') 
    	{ 
    		document.getElementById("errorspan").innerHTML = "Select PickUp Branch";  
    		return false;
    	}
    	else if(document.form.branchprocess.value === document.form.deliverybranch.value) 
    	{ 
    		document.getElementById("errorspan").innerHTML = "Branch Processed And Delivery Branch Is Same";  
    		return false;
    	}
    	else if(document.form.branchprocess.value === document.form.pickupbranch.value) 
    	{ 
    		document.getElementById("errorspan").innerHTML = "Branch Processed And PickUp Branch Is Same";  
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
    	else if(!document.form.price.value.match(flaotexp))
    	{
    		document.getElementById("errorspan").innerHTML = "Enter Correct Price";  
    		return false;
    	}
    	else if(document.form.total.value=='')
    	{
    		document.getElementById("errorspan").innerHTML = "Enter Total";  
    		return false;
    	} 
    	else if(!document.form.total.value.match(flaotexp))
    	{
    		document.getElementById("errorspan").innerHTML = "Enter Correct Total Amount";  
    		return false;
    	} 
		else
		{
			document.getElementById("errorspan").innerHTML = "";
			return true;
		}
		
	} 
    
    function deliverpickup()
    {
    	if(document.form.type.value=='Deliver')
    	{
    		//alert("Deliver");
    		loadDeliveryBranch();
    		document.getElementById("ajaxPickUpBranch").innerHTML = '<option value = "undefined" selected>Choose Pickup Branch</option>';
    		return false;
    	}
    	else if(document.form.type.value=='PickUp')
    	{	
    		//alert("PickUp");
            loadPickUpBranch();
            document.getElementById("ajaxDeliveryBranch").innerHTML = '<option value = "undefined" selected>Choose Delivery Branch</option>';
    		return false; 
    	}
    	
    }
    
    
    </script>
</head>
<body onload = "loadProcessBranch()">
<%
	if(session.getAttribute("emailid")==null)
	{
		response.sendRedirect("./LogIn");
	}	

	String key = request.getParameter("key") != null || request.getParameter("key") != ""
	? request.getParameter("key")
	: "undefined";
	key = key.isEmpty() ? "undefined" : key; 
	
//	System.out.println(key);
	
	ParcelBean pb = ParcelDao.getParcelById(key);
%>
	<!--========== HEADER ==========-->
        <header class="header">
            <div class="header__container">
				
                <a href="AdminPanel" class="header__logo" style = "text-decoration:none;">Apna Courier Management System - Admin Panel |<small> Welcome, <%= session.getAttribute("emailid") %></small></a>
    
                <div class="header__search">
                    <input list="browsers" name="browser" id="browser" placeholder="Search" class="header__input"><button type = "submit" onclick = "return search()" style = "border:none;outline:0px;background-color:lightgrey;border-radius:15%"><i class='bx bx-search header__icon'></i></button>
                    <datalist id="browsers" style = "height: 80vh;">
					  <option value="Home">
					  <option value="Add New Branch">
					  <option value="Branch List">
					  <option value="Add New Branch Staff">
					  <option value="Branch Staff List">
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
        	<b>Edit Parcel</b>
        
        </div>
        <div class = "container-fluid form-container">
        	
        <form class = "form-body" action = "./EditParcel" method = "POST" name = "form">
        	<input type = "hidden" name = "parcel_id" value = "<%= key %>">
            <div class="row">
            
	          <div class="col-md-6">
	              <b>Sender Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_name" id="" class="form-control form-control-sm" value="<%= pb.getSendername() %>" readonly>
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_address" id="" class="form-control form-control-sm" value="<%= pb.getSenderaddress() %>" readonly>
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="sender_contact" id="" class="form-control form-control-sm" value="<%= pb.getSendercontact() %>" readonly>
	              </div>
	          </div>
	          <div class="col-md-6">
	              <b>Recipient Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_name" id="" class="form-control form-control-sm" value="<%= pb.getReceipantname() %>" readonly>
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_address" id="" class="form-control form-control-sm" value="<%= pb.getReceipantaddress() %>" readonly>
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                <input type="text" name="recipient_contact" id="" class="form-control form-control-sm" value="<%= pb.getReceipantcontact() %>" readonly>
	              </div>
	          </div>
	        </div>
           	<hr>
           	<div class="row">
	          <div class="col-md-6">
	            <div class="form-group">
	              <label for="dtype">Type<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="type" class="form-control" style = "font-size: 12px;" onchange = "return deliverpickup()">
                    	<option value = "-1" selected>Choose Type...</option>
	                    <option>Deliver</option>
	                    <option>PickUp</option>
                    </select>
	            </div>
	          </div>
	          <div class="col-md-6">
	             <div class="form-group">
	             	<label for="" class="control-label">Branch Processed<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="branchprocess" id = "ajaxBranchProcess" class="form-control branchprocess" style = "font-size: 12px;">
	                   <option value = "-1" selected>Choose Branch Processed...</option>
                    </select>
                    
	            </div>
	          </div>
	          <div class = "col-md-6">
	          	<div class="form-group" >
	              	<label for="" class="control-label">Delivery Branch<small style = "font-size:9px;font-weight:bolder;">(If Type Is Deliver)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="deliverybranch" id = "ajaxDeliveryBranch" class="form-control" style = "font-size: 12px;">
	                    <option value = "undefined" selected>Choose Delivery Branch...</option>
                    </select>
	            </div>
	          </div>
	          <div class = "col-md-6">
	          	<div class="form-group">
	              	<label for="" class="control-label">Pickup Branch<small style = "font-size:9px;font-weight:bolder;">(If Type Is Pickup)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	              	<select name="pickupbranch" id = "ajaxPickUpBranch" class="form-control" style = "font-size: 12px;">
	                    <option value = "undefined" selected>Choose Pickup Branch...</option>
                    </select>
	            </div>
	          </div>
	        </div>
            <hr>
            <b>Parcel Information</b>
            <div class="form-row">
                <div class="form-group col-md-1">
                    <label for="productprice">Height<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
                    <input type="text" class="form-control" name="height" value = "<%= pb.getProdheight().equals("undefined")?"":pb.getProdheight() %>" placeholder="Height">
                </div>
                <div class="form-group col-md-1">
                    <label for="productprice">Weight<small style = "font-size:9px;font-weight:bolder;color:grey">(kg)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="weight" value = "<%= pb.getProdweight().equals("undefined")?"":pb.getProdweight() %>" placeholder="Weight">
                </div>
            	<div class="form-group col-md-1">
                    <label for="productprice">Length<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
                    <input type="text" class="form-control" name="length" value = "<%= pb.getProdlength().equals("undefined")?"":pb.getProdlength() %>" placeholder="Length">
                </div>
                <div class="form-group col-md-1">
                    <label for="productprice">Width<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
                    <input type="text" class="form-control" name="width" value = "<%= pb.getProdwidth().equals("undefined")?"":pb.getProdwidth() %>" placeholder="Width">
                </div>
                <div class="form-group col-md-3">
                    <label for="productprice">Price<small style = "font-size:9px;font-weight:bolder;color:grey">(Rs.)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="price" value = "<%= Float.parseFloat(pb.getPrice()) / Float.parseFloat(pb.getQty()) %>0" placeholder="Price">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">qty<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="qty" value = "<%= pb.getQty() %>" placeholder="Qty">
                </div>
                <div class="form-group col-md-3">
                    <label for="productprice">Total<small style = "font-size:9px;font-weight:bolder;color:grey">(Rs.)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
                    <input type="text" class="form-control" name="total" value = "<%= pb.getPrice() %>" placeholder="Total">
                </div>
            </div>
            <hr>
            
            <div class = "text-center">
                <!-- Button trigger modal -->
                <button type="submit" class="btn btn-primary form-control" style = "font-size: 12px;font-weight: bolder;" onclick = "return validation()">Submit</button>
            </div> 
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
    
    <script>
    function loadProcessBranch()
    {
    	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
           if (xmlhttp.readyState == XMLHttpRequest.DONE) {
              if (xmlhttp.status == 200) {
                   document.getElementById("ajaxBranchProcess").innerHTML = xmlhttp.responseText;
              }
              else if (xmlhttp.status == 400) {
                  alert('There was an error 400');
              }
              else {
                 alert('something else other than 200 was returned');
              }
           }
       };
    		
       var url = "GetBranchProcess";
       xmlhttp.open("GET", url , false);
       xmlhttp.send();       
    }
    
    function loadDeliveryBranch()
    {
    	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
           if (xmlhttp.readyState == XMLHttpRequest.DONE) {
              if (xmlhttp.status == 200) {
                   document.getElementById("ajaxDeliveryBranch").innerHTML = xmlhttp.responseText;
              }
              else if (xmlhttp.status == 400) {
                  alert('There was an error 400');
              }
              else {
                 alert('loadDeliveryBranch() something else other than 200 was returned');
              }
           }
       };
    		
		var url = "GetDeliveryBranch";
	   // alert(url);
	    xmlhttp.open("GET", url , false);
	    xmlhttp.send(); 
    	
    }
    
    function loadPickUpBranch()
    {
    	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
           if (xmlhttp.readyState == XMLHttpRequest.DONE) {
              if (xmlhttp.status == 200) {
                   document.getElementById("ajaxPickUpBranch").innerHTML = xmlhttp.responseText;
              }
              else if (xmlhttp.status == 400) {
                  alert('There was an error 400');
              }
              else {
                 alert('loadPickUpBranch() something else other than 200 was returned');
              }
           }
       };
    		
		var url = "GetPickUpBranch";
	   // alert(url);
	    xmlhttp.open("GET", url , false);
	    xmlhttp.send(); 
    	
    }
    </script>
    
    <script >
    /* $('.branchprocess').change(function() {    
        $("#choosebranchprocess").val($("#ajaxBranchProcess").val()); 
    }); */ 
    </script>
</body>
</html>