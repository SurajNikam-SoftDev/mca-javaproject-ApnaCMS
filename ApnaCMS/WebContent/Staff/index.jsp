<%@page import="com.apnacms.dao.HomeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
   	<title>ApnaCMS :: Staff Panel</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<!--========== BOX ICONS ==========-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/home.css">
    
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="./assets/js/staffsearch.js" ></script>
</head>
<style>
[list]::-webkit-calendar-picker-indicator {
    display: none;
  }

datalist{
	max-height: 100px;
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
    						<a href="StaffPanel" class="nav__link active">
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
        <div class = "container-fluid">
        	<div class="row">
        		<div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Total Parcel">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Total Parcel</div>
							  <div class="card-body">
							   	<b class="card-image"><i class='bx bx-box header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getTotalParcel() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Shipped">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Decline By Seller</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-trip header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelDeclineBySeller() %></p>
							  </div>
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row"> 
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="In-Transit">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">PreApproval From CMS</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxs-truck header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelPreApprovalFromCMS() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Item Accept By Courier">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Item Accept By C.</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-abacus header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelItemAcceptedBySeller() %></p>
							  </div> 
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Collected">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Collected</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-donate-blood header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelCollected() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Shipped">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Shipped</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-trip header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelShipped() %></p>
							  </div>
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="In-Transit">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">In-Transit</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxs-truck header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelInTransit() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Arrived At Destination">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Arrived Destinat'n</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxs-diamond header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelArrivedByDestination() %></p>
							  </div>
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Out For Delivery">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Out For Delivery</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-archive-out header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelOutForDelivery() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Ready For PickUp">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Ready For PickUp</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bx-layer-plus header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelOutForDelivery() %></p>
							  </div>
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Delivered">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Delivered</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxs-arrow-to-bottom header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelDelivery() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Picked-Up">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Picked-Up</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxs-arrow-to-top header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelPickUp() %></p>
							  </div>
							</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="row">
	                    <div class="col" style="padding:5px;">
	               			<div class="card" data-toggle="tooltip" data-placement="bottom" title="Unsuccessfully Delivery Arrived">
							  <div class="card-header text-center" style = "border-radius:18px 18px 0px 0px;">Unsuccessfully Delivery</div>
							  <div class="card-body">
							    <b class="card-image"><i class='bx bxl-firebase header__icon' style = "color:#002060;"></i></b>
							    <p class="card-text" style = "color:#002060;"><%= HomeDao.getParcelUnsuccessfullyDelivery() %></p>
							  </div>
							</div>
	                    </div>
	                    <div class="col" style="padding:5px;"> 
	               			
	                    </div>
	                </div>
	            </div>
	            
	            
	            
	         </div>
        </div>
        
	
	

	<script src="./assets/js/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    
    <script src="./assets/js/main.js"></script>
    
    <script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>