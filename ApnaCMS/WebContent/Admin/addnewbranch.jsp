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
</head>
<body>
	<!--========== HEADER ==========-->
        <header class="header">
            <div class="header__container">
				
                <a href="#" class="header__logo" style = "text-decoration:none;">Apna Courier Management System - Admin Panel</a>
    
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
                    <a href="#" class="nav__link nav__logo" >
                        <i class='bx bx-mask nav__icon' ></i>
                        <span class="nav__logo-name">AdminPanel</span>
                    </a>
    				<div class="nav__list">
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Menu</h3> 
    						<a href="#" class="nav__link ">
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
                                        <a href="#" class="nav__dropdown-item active">Add New</a>
                                        <a href="#" class="nav__dropdown-item">List</a>
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
                                        <a href="#" class="nav__dropdown-item">Add New</a>
                                        <a href="#" class="nav__dropdown-item">List</a>
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
                                        <a href="#" class="nav__dropdown-item">Add New</a>
                                        <a href="#" class="nav__dropdown-item">List All</a>
                                        <a href="#" class="nav__dropdown-item">Item Accepted by courier</a>
                                        <a href="#" class="nav__dropdown-item">Collected</a>
                                        <a href="#" class="nav__dropdown-item">Shipped</a>
                                        <a href="#" class="nav__dropdown-item">In-Transit</a>
                                        <a href="#" class="nav__dropdown-item">Arrived At Destination</a>
                                        <a href="#" class="nav__dropdown-item">Out Of Delivery</a>
                                        <a href="#" class="nav__dropdown-item">Ready To PickUp</a>
                                        <a href="#" class="nav__dropdown-item">Delivered</a>
                                        <a href="#" class="nav__dropdown-item">PickUp</a>
                                        <a href="#" class="nav__dropdown-item">Unsuccessfully Delivery Attempt</a>
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="nav__link ">
                                <i class='bx bx-current-location nav__icon' ></i>
                                <span class="nav__name">Track Order</span>
                            </a>
                            <a href="#" class="nav__link">
                                <i class='bx bxs-report nav__icon' ></i>
                                <span class="nav__name">Reports</span>
                            </a>
                        </div>
    
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Profile</h3>
                            <a href="#" class="nav__link">
                                <i class='bx bx-compass nav__icon' ></i>
                                <span class="nav__name">Manage Account</span>
                            </a>
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
        	<b>Add New Branch</b>
        
        </div>
        <div class = "container-fluid form-container">
        	
        <form class = "form-body">
            <div class="form-group">
                <label for="inputAddress">Street/Building</label>
                <input type="text" class="form-control" name="streetbuilding" placeholder="Street/Building">
            </div>
           
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="productprice">Country</label>
                    <select name="category" class="form-control" style = "font-size: 12px;">
                    <option selected>Choose Country...</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="productprice">State</label>
                    <select name="category" class="form-control" style = "font-size: 12px;">
                    <option selected>Choose State...</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    </select>
                </div>
            </div>
			<div class="form-row">
                <div class="form-group col-md-4">
                    <label for="productprice">City</label>
                    <select name="category" class="form-control" style = "font-size: 12px;">
                    <option selected>Choose City...</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="productprice">ZipCode</label>
                    <input type="text" class="form-control" name="productprice" placeholder="ZipCode">
                </div>
                <div class="form-group col-md-4">
                    <label for="productprice">Contact No</label>
                    <input type="text" class="form-control" name="productprice" placeholder="Contact No">
                </div>
            </div>
            
            
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