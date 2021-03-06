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
    <script src="./assets/js/staffsearch.js" ></script>
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
                                <a href="#" class="nav__link active">
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
                            <a href="SP_ManageAccount" class="nav__link">
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
        	<b>Edit Parcel</b>
        
        </div>
        <div class = "container-fluid form-container">
        	
        <form class = "form-body">
            <div class="row">
	          <div class="col-md-6">
	              <b>Sender Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name</label>
	                <input type="text" name="sender_name" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address</label>
	                <input type="text" name="sender_address" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #</label>
	                <input type="text" name="sender_contact" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	          </div>
	          <div class="col-md-6">
	              <b>Recipient Information</b>
	              <div class="form-group">
	                <label for="" class="control-label">Name</label>
	                <input type="text" name="recipient_name" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Address</label>
	                <input type="text" name="recipient_address" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	              <div class="form-group">
	                <label for="" class="control-label">Contact #</label>
	                <input type="text" name="recipient_contact" id="" class="form-control form-control-sm" value="" required="">
	              </div>
	          </div>
	        </div>
           	<hr>
           	<div class="row">
	          <div class="col-md-6">
	            <div class="form-group">
	              <label for="dtype">Type</label>
	              	<select name="category" class="form-control" style = "font-size: 12px;">
                    	<option selected>Choose Type...</option>
	                    <option>Deliver</option>
	                    <option>PickUp</option>
                    </select>
	            </div>
	          </div>
	          <div class="col-md-6" id="">
	             <div class="form-group" id="fbi-field">
	                <label for="" class="control-label">Branch Processed</label>
	              	<select name="category" class="form-control" style = "font-size: 12px;">
	                   <option selected>Choose Branch Processed...</option>
	                   <option>1</option>
	                   <option>2</option>
	                   <option>3</option>
                    </select>
	            </div>
	              
	            <div class="form-group" id="tbi-field">
	              	<label for="" class="control-label">Pickup Branch</label>
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
                    <input type="text" class="form-control" name="firstname" placeholder="Height">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Weight</label>
                    <input type="text" class="form-control" name="lastname" placeholder="Weight">
                </div>
            	<div class="form-group col-md-2">
                    <label for="productprice">Length</label>
                    <input type="text" class="form-control" name="firstname" placeholder="Length">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Width</label>
                    <input type="text" class="form-control" name="lastname" placeholder="Width">
                </div>
            	<div class="form-group col-md-2">
                    <label for="productprice">Price</label>
                    <input type="text" class="form-control" name="firstname" placeholder="Price">
                </div>
                <div class="form-group col-md-2">
                    <label for="productprice">Total</label>
                    <input type="text" class="form-control" name="lastname" placeholder="Total">
                </div>
            </div>
            <hr>
            
            <div class = "text-center">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#exampleModalCenter" style = "font-size: 12px;font-weight: bolder;" >Submit</button>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button> -->
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">No</button>
                        <button type="button" class="btn btn-primary" >Yes</button>
                    </div>
                </div>
                </div>
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