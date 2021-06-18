			
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.apnacms.bean.TrackOrderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.apnacms.dao.TrackOrderDao"%>
<%
	String key  = request.getParameter("key") != null || request.getParameter("key") != ""
	? request.getParameter("key")
	: "undefined";
	key = key.isEmpty() ? "undefined" : key;
	
	System.out.println("key :: " + key);
	
	List<TrackOrderBean> list = TrackOrderDao.getTrackOrderByReferenceNo(key);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

%>			
			<div class = "trackorder-container" id="ajaxResponse" >
           		<div class="row justify-content-center">
				    <div class="col-10">
<%
if(list.size() == 0)
{
%>
						<b>0 Results</b>
<%
}		
else if(list.size() == 1)
{		
		
%>				    
				    	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>		            	
		            	
<%
}		
else if(list.size() == 2)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(1).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
		            	
<%
}		
else if(list.size() == 3)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(2).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
<%
}		
else if(list.size() == 4)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(3).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
		            	
<%
}		
else if(list.size() == 5)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(4).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
<%
}		
else if(list.size() == 6)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(5).getStatus() %></b><small><%= format.parse(list.get(5).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(5).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
<%
}		
else if(list.size() == 7)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(5).getStatus() %></b><small><%= format.parse(list.get(5).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text">Ready To PickUp</b><small><%= format.parse(list.get(6).getDate_created()) %></small> 
		            	</p>
		            	<% if(list.get(6).getStatus().equals("Unsuccessfully Delivery Attempt")) {}
		            	else{
		            	%>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line-process"></span>
		            	</div>
		            	<%
		            	}
		            	%>
<%
}		
else if(list.size() == 8)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(5).getStatus() %></b><small><%= format.parse(list.get(5).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(6).getStatus() %></b><small><%= format.parse(list.get(6).getDate_created()) %></small> 
		            	</p>
<%
}		
else if(list.size() == 9)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(5).getStatus() %></b><small><%= format.parse(list.get(5).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(6).getStatus() %></b><small><%= format.parse(list.get(6).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text">PickUp</b><small><%= format.parse(list.get(7).getDate_created()) %></small> 
		            	</p>
<%
}		
else if(list.size() == 10)
{		
%>		            	
						<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(0).getStatus() %></b><small><%= format.parse(list.get(0).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(1).getStatus() %></b><small><%= format.parse(list.get(1).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(2).getStatus() %></b><small><%= format.parse(list.get(2).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(3).getStatus() %></b><small><%= format.parse(list.get(3).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(4).getStatus() %></b><small><%= format.parse(list.get(4).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(5).getStatus() %></b><small><%= format.parse(list.get(5).getDate_created()) %></small> 
		            	</p>
						<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(6).getStatus() %></b><small><%= format.parse(list.get(6).getDate_created()) %></small> 
		            	</p>
		            	<div class = "vertical text-center">
		            		<span class = "vertical-line"></span>
		            	</div>
		            	<p class="paragraph">
		            			<i class="bx bx-search trackorder-icon"></i>
		            			<b class = "trackorder-text"><%= list.get(7).getStatus() %></b><small><%= format.parse(list.get(7).getDate_created()) %></small> 
		            	</p>
<%
	}
%>  		            	
				    </div>
				</div>
           	</div>
          
        

