package com.apnacms.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.apnacms.admin.bean.BranchBean;
import com.apnacms.dbconnection.DBConnection;
import com.apnacms.features.AES256;

public class BranchDao 
{
	public static List<BranchBean> getBranchProcessed()
	{
		List<BranchBean> lbb = new ArrayList<BranchBean>();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from branches where type = 2");
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next())
			{
				 BranchBean bb= new BranchBean();
				 bb.setBid(String.valueOf(rs.getInt("bid"))); 
				 bb.setBranch_code(AES256.decrypt(rs.getString("branch_code")));  
		         bb.setStreetbuilding(rs.getString("street"));
		         bb.setState(rs.getString("state"));
		         bb.setCity(rs.getString("city"));
		         bb.setZipcode(rs.getString("zipcode"));
		             
		         lbb.add(bb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return lbb;
	}
	
	public static List<BranchBean> getDeliveryBranch(String branchid)
	{
		List<BranchBean> lbb = new ArrayList<BranchBean>();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from branches where branch_code != ? AND type = 2");
			ps.setString(1, branchid);
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next())
			{
				 BranchBean bb= new BranchBean();
				 bb.setBid(String.valueOf(rs.getInt("bid"))); 
				 bb.setBranch_code(AES256.decrypt(rs.getString("branch_code")));  
		         bb.setStreetbuilding(rs.getString("street"));
		         bb.setState(rs.getString("state"));
		         bb.setCity(rs.getString("city"));
		         bb.setZipcode(rs.getString("zipcode"));
		             
		         lbb.add(bb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return lbb;
	}
	
	public static List<BranchBean> getPickUpBranch(String branchid)
	{
		List<BranchBean> lbb = new ArrayList<BranchBean>();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from branches where branch_code != ? AND type = 2");
			ps.setString(1, branchid);
			
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next())
			{
				 BranchBean bb= new BranchBean();
				 bb.setBid(String.valueOf(rs.getInt("bid"))); 
				 bb.setBranch_code(AES256.decrypt(rs.getString("branch_code")));  
		         bb.setStreetbuilding(rs.getString("street"));
		         bb.setState(rs.getString("state"));
		         bb.setCity(rs.getString("city"));
		         bb.setZipcode(rs.getString("zipcode"));
		             
		         lbb.add(bb);
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return lbb;
	}
	
	public static String getBranchAddressById(String branchid)
	{
		String branchaddress = null;
		try {
			Connection con = DBConnection.getConnection();
//			System.out.println("select * from branches where branch_code != '"+AES256.encrypt(branchid)+"' AND type = 2");
			PreparedStatement ps= con.prepareStatement("select * from branches where branch_code = ? AND type = 2");
			ps.setString(1, AES256.encrypt(branchid));
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next())
			{
				 
				 branchaddress = AES256.decrypt(rs.getString("branch_code")) + " - " + rs.getString("street") + ", " + rs.getString("state") + ", " + rs.getString("city") + ", " + rs.getString("zipcode");	
//		         System.out.println(branchaddress);
		         	             
		         
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return branchaddress;
	}
	
}
