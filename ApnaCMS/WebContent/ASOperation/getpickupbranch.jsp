<%@page import="com.apnacms.dao.BranchDao"%>
<%@page import="com.apnacms.admin.bean.BranchBean"%>
<%@page import="java.util.List"%>
<label for="" class="control-label">Pickup Branch<small style = "font-size:9px;font-weight:bolder;">(If Type Is Pickup)</small><span style = "color:red;font-size:14px;font-weight:bolder;">*</span></label>
<select name="deliverybranch" id = "ajaxDeliveryBranch" class="form-control" style = "font-size: 12px;">
<option value = "undefined" selected>Choose PickUp Branch...</option>	 
<%
	 	List<BranchBean> list = BranchDao.getPickUpBranch("");
	 	for (BranchBean branch : list) {
	 %>            
	<option value = "<%=branch.getBranch_code() %>"><%= branch.getBranch_code() +" - "+ branch.getStreetbuilding() +", "+ branch.getState() +", "+ branch.getCity() +", "+ branch.getZipcode() %> </option>            	
<%
	} 
%>              

</select>      