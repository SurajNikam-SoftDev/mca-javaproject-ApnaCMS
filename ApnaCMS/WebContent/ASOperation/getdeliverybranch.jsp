<%@page import="com.apnacms.dao.BranchDao"%>
<%@page import="com.apnacms.admin.bean.BranchBean"%>
<%@page import="java.util.List"%>
<select name="deliverybranch" id = "ajaxDeliveryBranch" class="form-control" style = "font-size: 12px;">
<option value = "undefined" selected>Choose Delivery Branch...</option>	 
<%
	 	List<BranchBean> list = BranchDao.getDeliveryBranch("");
	 	for (BranchBean branch : list) {
	 %>            
	<option value = "<%=branch.getBranch_code() %>"><%= branch.getBranch_code() +" - "+ branch.getStreetbuilding() +", "+ branch.getState() +", "+ branch.getCity() +", "+ branch.getZipcode() %> </option>            	
<%
	} 
%>              
</select>      