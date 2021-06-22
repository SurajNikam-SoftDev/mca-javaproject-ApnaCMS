		function search()
    	{
    		var search = document.getElementById("browser").value;
    		//alert(search);
    		switch(search) {
    		  case 'Home':
    		      	window.location.href = 'AdminPanel';
    		    	break;
    		    	
    		  case 'Add New Branch':
    		    	window.location.href = 'AddNewBranch';
    		    	break;
    		  
    		  case 'Branch List':
  		      		window.location.href = 'BranchList';
  		    		break;
  		    	
    		  case 'Add New Branch Staff':
  		      		window.location.href = 'AddNewBranchStaff';
  		    		break;
  		    	
    		  case 'Branch Staff List':
  		      		window.location.href = 'BranchStaffList';
  		    		break;
  		    	
    		  case 'Parcel List':
  		      		window.location.href = 'ParcelList';
  		    		break;
  		    	
    		  case 'Item Accept By Courier':
  		      		window.location.href = 'ItemAcceptByCourier';
  		    		break;
  		    	
    		  case 'Collected':
    		      	window.location.href = 'Collected';
    		    	break;
    		    	
      		  case 'Shipped':
    		      	window.location.href = 'Shipped';
    		    	break;
    		    	
      		  case 'In-Transit':
    		      	window.location.href = 'InTransit';
    		    	break;
    		    	
      		  case 'Arrived At Destination':
    		      	window.location.href = 'ArrivedAtDestination';
    		    	break;
    		    	
      		  case 'Out For Delivery':
    		      	window.location.href = 'OutForDelivery';
    		    	break;
    		    	
      		  case 'Ready To PickUp':
  		      		window.location.href = 'ReadyToPickUp';
  		    		break;
  		   
    		  case 'Delivery':
  		      		window.location.href = 'Delivered';
  		    		break;
  		    	
    		  case 'PickUp':
  		      		window.location.href = 'PickUp';
  		    		break;
  		    	
    		  case 'Unsuccessfully Delivery Attempt':
  		      		window.location.href = 'UnsuccessfullyDelivery';
  		    		break;
  		    	
    		  case 'Track Order':
  		      		window.location.href = 'TrackOrder';
  		    		break;
  		    	
    		  case 'Reports':
    		      	window.location.href = 'Reports';
    		    	break;
    		    	
    		  case 'Manage Account':
    		      	window.location.href = 'ManageAccount';
    		    	break;
    		    	
    		  default:
    			  	
    			  	return false;
    		    	// when all the other values not covered with cases above
    		    	// other code ...
    		}		  
    	}