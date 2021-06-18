package com.apnacms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.apnacms.bean.TrackOrderBean;
import com.apnacms.dbconnection.DBConnection;

public class TrackOrderDao {
	public static List<TrackOrderBean> getTrackOrderByReferenceNo(String referenceno)
	{
		List<TrackOrderBean> ltob = new ArrayList<TrackOrderBean>();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select parcelid from orderparcel where referenceno = ?");
			ps.setString(1, referenceno);
			ResultSet rs = ps.executeQuery(); 
			
			if(rs.next())
			{
				
				
				PreparedStatement ps2 = con.prepareStatement("select status, date_created from parceltrack where parcelid = ?");
				ps2.setString(1, rs.getString("parcelid"));
				
				ResultSet rs2 = ps2.executeQuery(); 
				
				while(rs2.next())
				{
					TrackOrderBean tob= new TrackOrderBean();
					
					tob.setStatus(rs2.getString("status"));
					tob.setDate_created(rs2.getString("date_created"));
					
//					System.out.println(rs2.getString("status") + " :: "+ rs2.getString("date_created"));
					ltob.add(tob);
				}
				
				
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return ltob;
	}

}
