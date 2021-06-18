<%@page import="com.apnacms.dao.BranchDao"%>
<%@page import="com.apnacms.admin.bean.BranchBean"%>
<%@page import="java.util.List"%>
<select name="branchprocess" id = "ajaxBranchProcess" class="form-control" onchange = "return loadProcessBranch()" style = "font-size: 12px;">
<option value = "-1" selected>Choose Branch Processed...</option>	 
<%
	
	List<BranchBean> list = BranchDao.getBranchProcessed();
	for(BranchBean branch: list)
	{
%>             
	<option value = "<%=branch.getBranch_code() %>"><%= branch.getBranch_code() +" - "+ branch.getStreetbuilding() +", "+ branch.getState() +", "+ branch.getCity() +", "+ branch.getZipcode() %> </option>                   	
<%
	}
%>              

</select>       