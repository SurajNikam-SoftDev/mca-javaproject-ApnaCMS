<%@page import="com.apnacms.dao.BranchDao"%>
<%@page import="com.apnacms.dao.ParcelDao"%>
<%@page import="com.apnacms.bean.ParcelBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: View Parcel</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<!--========== BOX ICONS ==========-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/parcel.css">
    
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
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
                                <a href="#" class="nav__link ">
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

                <a href="#" class="nav__link nav__logout">
                    <i class='bx bx-log-out nav__icon' ></i>
                    <span class="nav__name">Log Out</span>
                </a>
            </nav>
        </div>

		<!--========== CONTENTS ==========-->
        
        <div class = "container-fluid page-header text-center">
        	<b>View Parcel</b>
        </div>

		<div class="container-fluid parcel-container">	
		<form action = "./ViewParcel" method = "POST">
			<input type = "hidden" name = "parcel_id" value = "<%= key %>">
			<div class="parcel-sub-container">
				<b class = "parcel-header">Track ID: <%= pb.getReferenceno() %></b>
			</div>
			<br>
        	<div class = "row">
        		<div class = "col-md-6">
        			<div class = "parcel-card">
        				<b>Sender Information</b>
		              	<div class="form-group">
		                	<label for="" class="control-label">Name</label>
		                	<input type="text" name="sender_name" id="" class="form-control form-control-sm" value="<%= pb.getSendername() %>" readonly>
		              	</div>
		              	<div class="form-group">
		                	<label for="" class="control-label">Address</label>
		                	<input type="text" name="sender_address" id="" class="form-control form-control-sm" value="<%= pb.getSenderaddress()%>" readonly>
		              	</div>
		              	<div class="form-group">
		                	<label for="" class="control-label">Contact #</label>
		                	<input type="text" name="sender_contact" id="" class="form-control form-control-sm" value="<%= pb.getSendercontact()%>" readonly>
		              	</div>	
        			</div>
        		</div>
        		<div class = "col-md-6">
        			<div class = "parcel-card">
        				<b>Recipient Information</b>
		              	<div class="form-group">
		                	<label for="" class="control-label">Name</label>
		                	<input type="text" name="recipient_name" id="" class="form-control form-control-sm" value="<%= pb.getReceipantname() %>" readonly>
		              	</div>
		              	<div class="form-group">
		                	<label for="" class="control-label">Address</label>
		                	<input type="text" name="recipient_address" id="" class="form-control form-control-sm" value="<%=pb.getReceipantaddress() %>" readonly>
		              	</div>
		              	<div class="form-group">
		                	<label for="" class="control-label">Contact #</label>
		                	<input type="text" name="recipient_contact" id="" class="form-control form-control-sm" value="<%= pb.getReceipantcontact() %>" readonly>
		              	</div>	
        			</div>
        		</div>
        	</div>
        	<div class="parcel-sub-container mt-4">
				<b class = "parcel-header">Parcel Details:</b>
				
				<div class = "form-row mt-2">
					<div class="form-group col-md-1">
	                    <label for="productprice">Height<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
	                    <input type="text" class="form-control" name="height" value = "<%= pb.getProdheight().equals("undefined")?"":pb.getProdheight() %>" placeholder="Height"  readonly>
	                </div>
	                <div class="form-group col-md-1">
	                    <label for="productprice">Weight<small style = "font-size:9px;font-weight:bolder;color:grey">(kg)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                    <input type="text" class="form-control" name="weight" value = "<%= pb.getProdweight().equals("undefined")?"":pb.getProdweight() %>" placeholder="Weight" readonly>
	                </div>
	            	<div class="form-group col-md-1">
	                    <label for="productprice">Length<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
	                    <input type="text" class="form-control" name="length" value = "<%= pb.getProdlength().equals("undefined")?"":pb.getProdlength() %>" placeholder="Length" readonly>
	                </div>
	                <div class="form-group col-md-1">
	                    <label for="productprice">Width<small style = "font-size:9px;font-weight:bolder;color:grey">(inch)</small></label>
	                    <input type="text" class="form-control" name="width" value = "<%= pb.getProdwidth().equals("undefined")?"":pb.getProdwidth() %>" placeholder="Width" readonly>
	                </div>
	                <div class="form-group col-md-3">
	                    <label for="productprice">Price<small style = "font-size:9px;font-weight:bolder;color:grey">(Rs.)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                    <input type="text" class="form-control" name="price" value = "<%= Float.parseFloat(pb.getPrice()) / Float.parseFloat(pb.getQty()) %>0" placeholder="Price" readonly>
	                </div>
	                <div class="form-group col-md-2">
	                    <label for="productprice">qty<span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                    <input type="text" class="form-control" name="qty" value = "<%= pb.getQty() %>" placeholder="Qty" readonly>
	                </div>
	                <div class="form-group col-md-3">
	                    <label for="productprice">Total<small style = "font-size:9px;font-weight:bolder;color:grey">(Rs.)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
	                    <input type="text" class="form-control" name="total" value = "<%= pb.getPrice() %>" placeholder="Total" readonly>
	                </div>
	                <div class="form-group">
	                	<div class="col-md-12">
	                		<label for="" class="control-label">Branch Accepted the Parcel:</label>
		                	<p class = "parcel-address"><%= BranchDao.getBranchAddressById(pb.getFrombranchid()) %></p>
	                	</div>
		                <div class="col-md-12">
		                	<label for="" class="control-label">Nearest Branch to Recipient for Pickup:</label>
			                <p class = "parcel-address"><%= BranchDao.getBranchAddressById(pb.getTobranchid()) %></p>
		                </div>
	                </div>
	                
				</div>
			</div>
			<div class="parcel-sub-container">
				<b class = "parcel-header">Status: <span class = "parcel-status"><%= pb.getOpstatus() %></span></b>
				<div class = "row mt-2">
					<div class = "col-md-6">
						<div class="form-group">
		                	<label for="" class="control-label">Update Status</label>
		                	<select name="trackstatus" class="form-control" style = "font-size: 12px;">
<% 
	if(pb.getOpstatus().equals("PreApproval From CMS"))
	{
%>			                    
			                    <option selected>Item Accepted by Courier</option>
			                    <option>Unsuccessfully Delivery Attempt</option>
<%
	}
	else if(pb.getOpstatus().equals("Item Accepted by Courier"))
	{
%>
								<option selected>Collected</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Collected"))
	{
%>
								<option selected>Shipped</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Shipped"))
	{
%>
								<option selected>In-Transit</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("In-Transit"))
	{
%>
								<option selected>Arrived At Destination</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Arrived At Destination"))
	{
%>
								<option selected>Out for Delivery</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Out for Delivery"))
	{
%>
								<option selected>Ready to Pickup</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Ready to Pickup"))
	{
%>
								<option selected>Delivered</option>	
								<option>Unsuccessfully Delivery Attempt</option>		
<%	
	}
	else if(pb.getOpstatus().equals("Delivered"))
	{
%>
								<option selected>Picked-up</option>			
<%	
	}
%>								
							</select>
					   </div>
					</div>
					<div class = "col-md-6">
						<div class="form-group">
		                	<label for="" class="control-label">Remark</label>
		                	<input type="text" name="remark" id="" class="form-control form-control-sm" placeholder="Remark" >
		              	</div>
					</div>
				</div>
			</div>
			<div class = "text-center mt-3">
                <!-- Button trigger modal -->
                <button type="submit" class="btn btn-primary form-control" style = "font-size: 12px;font-weight: bolder;" >Update Status</button>
            </div>
            
            </form>
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