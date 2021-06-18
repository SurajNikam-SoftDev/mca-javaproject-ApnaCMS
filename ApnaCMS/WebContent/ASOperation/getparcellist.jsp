<%@page import="com.apnacms.dao.ParcelDao"%>
<%@page import="com.apnacms.bean.ParcelBean"%>
<%@page import="java.util.List"%>
<%
	String status  = request.getParameter("status") != null || request.getParameter("status") != ""
			? request.getParameter("status")
			: "undefined";
	status = status.isEmpty() ? "undefined" : status;

	System.out.println("status :: " + status);

	List<ParcelBean> list = ParcelDao.getAllParcelListByStatus(status);
	int i = 1;
%>
		<table class="table table-striped table-bordered myDataTable" style = "width: 100%;">
            <thead>
                <tr>
                    <th class = "search-col">#</th>
                    <th class = "search-col">Reference Number</th>
                    <th class = "search-col">Sender Name</th>
                    <th class = "search-col">Recipient Name</th>
                    <th class = "search-col">Status</th>
                    <th class = "search-col" >Action</th>
                </tr>
            </thead>
            <tbody> 
<%
	for(ParcelBean parcel: list)
	{
%>            
              	<tr>
                   	<td><%= i++ %></td>
                    <td><%= parcel.getReferenceno()%></td>
                    <td><%= parcel.getSendername()%></td>
                    <td><%= parcel.getReceipantname()%></td>
                    <td><%= parcel.getOpstatus()%></td>
                    <td class = "text-center">
                    	<a href="javascript:void(0)" class = "btn btn-success" data-toggle="tooltip" data-placement="top" title="Parcel Approval" onclick="location.href='PreApprovalParcel?key=<%= parcel.getParcelid() %>'" style = "padding:0px;text-decoration: none;"><i class="material-icons p-1" style = "font-size:20px;color:white;">done</i></a>	
                    	<a href="javascript:void(0)" class = "btn btn-danger" data-toggle="tooltip" data-placement="top" title="Delete Parcel" onclick="location.href='DeleteParcel?key=<%= parcel.getParcelid() %>'" style = "padding:0px;text-decoration: none;"><i class="material-icons p-1" style = "font-size:20px;color:white;">delete_forever</i></a>
                    </td>
                </tr>
<%
	}
%>              
            </tbody>
            <tfoot>
                <tr>
                    <th class = "search-col">#</th>
                    <th class = "search-col">Reference Number</th>
                    <th class = "search-col">Sender Name</th>
                    <th class = "search-col">Recipient Name</th>
                    <th class = "search-col">Status</th>
                    <th class = "search-col" >Action</th>
                </tr>
            </tfoot>
        </table>
