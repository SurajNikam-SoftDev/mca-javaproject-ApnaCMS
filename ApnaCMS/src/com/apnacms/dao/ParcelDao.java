package com.apnacms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.apnacms.bean.ParcelBean;
import com.apnacms.dbconnection.DBConnection;

public class ParcelDao {
	public static List<ParcelBean> getAllParcelList()
	{
		List<ParcelBean> lpb = new ArrayList<ParcelBean>();
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select parcelid, referenceno, sendername, receipantname, opstatus from orderparcel where opstatus = 'Approved By Seller'");
			ResultSet rs = ps.executeQuery();  
			
			while(rs.next())
			{
				 ParcelBean pb= new ParcelBean();
				 pb.setParcelid(rs.getString("parcelid"));
				 pb.setReferenceno(rs.getString("referenceno"));
				 pb.setSendername(rs.getString("sendername"));
				 pb.setReceipantname(rs.getString("receipantname"));
				 pb.setOpstatus(rs.getString("opstatus"));
				 
		         lpb.add(pb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return lpb;
	}
	
	public static List<ParcelBean> getAllParcelReport(String productcategory, String dateFrom, String dateTo)
	{ 
		List<ParcelBean> lpb = new ArrayList<ParcelBean>();
		
//		System.out.println(productcategory + " :: " + dateFrom + " :: " + dateTo);
		
		String query = null;
		if(productcategory.equals("All") && dateFrom.equals("undefined") && dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE orderparcel.pid = products.pid";
		}	
		else if(productcategory.equals("All") && !dateFrom.equals("undefined") && dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE orderparcel.date_created > '"+dateFrom+"' AND orderparcel.pid = products.pid";
		}
		else if(productcategory.equals("All") && dateFrom.equals("undefined") && !dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE orderparcel.date_created < '"+dateTo+"' AND orderparcel.pid = products.pid";
		}
		else if(productcategory.equals("All") && dateFrom.length() != 0 && dateTo.length() != 0)
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE orderparcel.date_created BETWEEN '"+dateFrom+"' AND '"+dateTo+"' AND orderparcel.pid = products.pid";
		}
		else if(!productcategory.equals("All") && dateFrom.equals("undefined") && dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE products.category = '"+productcategory+"' AND orderparcel.pid = products.pid";
		}	
		else if(!productcategory.equals("All") && !dateFrom.equals("undefined") && dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE products.category = '"+productcategory+"' AND orderparcel.date_created > '"+dateFrom+"' AND orderparcel.pid = products.pid";
		}
		else if(!productcategory.equals("All") && dateFrom.equals("undefined") && !dateTo.equals("undefined"))
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE products.category = '"+productcategory+"' AND orderparcel.date_created < '"+dateTo+"' AND orderparcel.pid = products.pid";
		}
		else if(!productcategory.equals("All") && dateFrom.length() != 0 && dateTo.length() != 0)
		{
			query = "SELECT orderparcel.date_created, orderparcel.sendername, orderparcel.receipantname, orderparcel.price, orderparcel.opstatus FROM orderparcel, products WHERE products.category = '"+productcategory+"' AND orderparcel.date_created BETWEEN '"+dateFrom+"' AND '"+dateTo+"' AND orderparcel.pid = products.pid";
		}
		
		
		
		try {
			Connection con = DBConnection.getConnection();
//			System.out.println("Query :: \n"+query);
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();  
			
			while(rs.next())
			{
				 ParcelBean pb= new ParcelBean();
				 pb.setDate_created(rs.getString("orderparcel.date_created"));
				 pb.setPrice(rs.getString("orderparcel.price")); 
				 pb.setSendername(rs.getString("orderparcel.sendername"));
				 pb.setReceipantname(rs.getString("orderparcel.receipantname"));
				 pb.setOpstatus(rs.getString("orderparcel.opstatus"));
				 
		         lpb.add(pb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return lpb;
	}
	
	public static List<ParcelBean> getAllParcelListByStatus(String status)
	{
		List<ParcelBean> lpb = new ArrayList<ParcelBean>();
		
		String query = null;
		
		
		if(status.equals("Approved By Seller"))
		{ 
			 query = "select parcelid, referenceno, sendername, receipantname, opstatus from orderparcel where opstatus = '"+status+"' OR opstatus = 'Picked-up'";
		}	
		else
		{
			 query = "select parcelid, referenceno, sendername, receipantname, opstatus from orderparcel where opstatus = '"+status+"'";
		}
		 
		
		try {
			Connection con = DBConnection.getConnection();
//			System.out.println(query);
			PreparedStatement ps= con.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();  
			
			while(rs.next())
			{
				ParcelBean pb= new ParcelBean();
				
				pb.setParcelid(rs.getString("parcelid"));
				pb.setReferenceno(rs.getString("referenceno"));
				pb.setSendername(rs.getString("sendername"));
				pb.setReceipantname(rs.getString("receipantname"));
				pb.setOpstatus(rs.getString("opstatus"));
				
				
				 
		        lpb.add(pb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return lpb;
	}
	
	public static ParcelBean getParcelById(String parcelid)
	{
		ParcelBean pb = new ParcelBean();
		
		try {
			Connection con = DBConnection.getConnection();
			
//			System.out.println("select sendername, senderaddress, sendercontact, receipantname, receipantaddress, receipantcontact, prodweight, prodheight, prodwidth, prodlength, qty from orderparcel where parcelid = '"+parcelid+"'");
			PreparedStatement ps= con.prepareStatement("select sendername, senderaddress, sendercontact, receipantname, receipantaddress, receipantcontact, prodweight, prodheight, prodwidth, prodlength, qty, price, opstatus, referenceno, frombranchid, tobranchid from orderparcel where parcelid = ?");
			ps.setString(1, parcelid);
			ResultSet rs = ps.executeQuery();  
			
			while(rs.next())
			{
				 pb.setSendername(rs.getString("sendername"));
				 pb.setSenderaddress(rs.getString("senderaddress"));
				 pb.setSendercontact(rs.getString("sendercontact"));
				 pb.setReceipantname(rs.getString("receipantname"));
				 pb.setReceipantaddress(rs.getString("receipantaddress"));
				 pb.setReceipantcontact(rs.getString("receipantcontact"));
				 pb.setProdheight(rs.getString("prodheight"));
				 pb.setProdlength(rs.getString("prodlength"));
				 pb.setProdweight(rs.getString("prodweight"));
				 pb.setProdwidth(rs.getString("prodwidth"));
		         pb.setQty(rs.getString("qty"));
		         pb.setPrice(rs.getString("price"));
		         pb.setOpstatus(rs.getString("opstatus"));
		         pb.setReferenceno(rs.getString("referenceno"));
		         pb.setFrombranchid(rs.getString("frombranchid"));
		         pb.setTobranchid(rs.getString("tobranchid"));
			}

			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return pb;
	}
	
	public static int updateParcelApprovedByCMS(ParcelBean pb)
	{
		int status = 0;
		
		try {
			Connection con = DBConnection.getConnection();
			
//			System.out.println("select sendername, senderaddress, sendercontact, receipantname, receipantaddress, receipantcontact, prodweight, prodheight, prodwidth, prodlength, qty from orderparcel where parcelid = '"+parcelid+"'");
			PreparedStatement ps= con.prepareStatement("update orderparcel set type = ?, frombranchid = ?, tobranchid = ?, prodweight = ?, prodheight = ?, prodwidth = ?, prodlength = ?, price = ?, qty = ?, opstatus = 'PreApproval From CMS' where parcelid = ?");
			ps.setString(1, pb.getType());
			ps.setString(2, pb.getFrombranchid());
			ps.setString(3, pb.getTobranchid());
			ps.setString(4, pb.getProdweight());
			ps.setString(5, pb.getProdheight());
			ps.setString(6, pb.getProdwidth());
			ps.setString(7, pb.getProdlength());
			ps.setString(8, pb.getPrice());
			ps.setString(9, pb.getQty());
			ps.setString(10, pb.getParcelid());

			status = ps.executeUpdate();
			
			
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return status;
	}
	
	public static int updateTrackStatusById(String parcel_id, String track_status, String remark)
	{
		int status = 0;
		
		try {
			Connection con = DBConnection.getConnection();
			
//			System.out.println("insert into parceltrack(status, remark, parcelid) values('"+track_status+"', '"+remark+"', '"+parcel_id+"')");
			
			PreparedStatement ps= con.prepareStatement("insert into parceltrack(status, remark, parcelid) values(?,?,?)");
			ps.setString(1, track_status);
			ps.setString(2, remark);
			ps.setString(3, parcel_id);

			status = ps.executeUpdate();
			
			
			if(status == 1)
			{
//				System.out.println("update orderparcel set opstatus = '"+track_status+"' where parcelid = '"+parcel_id+"'");
				PreparedStatement ps2= con.prepareStatement("update orderparcel set opstatus = ? where parcelid = ?");
				ps2.setString(1, track_status);
				ps2.setString(2, parcel_id);
				
				status = ps2.executeUpdate();
				
				ps2.close();
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		return status;
	}
}
