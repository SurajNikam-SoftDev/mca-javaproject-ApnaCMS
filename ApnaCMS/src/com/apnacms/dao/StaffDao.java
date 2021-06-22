package com.apnacms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.apnacms.admin.bean.BranchStaffBean;
import com.apnacms.dbconnection.DBConnection;
import com.apnacms.features.AES256;

public class StaffDao {
	
	public static BranchStaffBean getStaffAccountByEmailId(String emailid)
	{
		BranchStaffBean bsb= new BranchStaffBean();
		try {
			Connection con = DBConnection.getConnection();	
			PreparedStatement ps= con.prepareStatement("select cuid, name, password from courieruser where email = ?  AND type = 2");
			ps.setString(1, emailid);
			ResultSet rs = ps.executeQuery(); 
			 
			while(rs.next())
			{
				 bsb.setCuid(rs.getString("cuid"));
				 bsb.setName(rs.getString("name"));
				 bsb.setPassword(AES256.decrypt(rs.getString("password")));
				 
//				 System.out.println(rs.getString("cuid") +" :: "+rs.getString("name") + " :: " + AES256.decrypt(rs.getString("password")));
		    } 
			 
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return bsb;
	}
	
	public static BranchStaffBean getAdminAccountByEmailId(String emailid)
	{
		BranchStaffBean bsb= new BranchStaffBean();
		try {
			Connection con = DBConnection.getConnection();	
			PreparedStatement ps= con.prepareStatement("select cuid, name, password from courieruser where email = ?  AND type = 1");
			ps.setString(1, emailid);
			ResultSet rs = ps.executeQuery(); 
			 
			while(rs.next())
			{
				 bsb.setCuid(rs.getString("cuid"));
				 bsb.setName(rs.getString("name"));
				 bsb.setPassword(AES256.decrypt(rs.getString("password")));
				 
//				 System.out.println(rs.getString("cuid") +" :: "+rs.getString("name") + " :: " + AES256.decrypt(rs.getString("password")));
		    } 
			 
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return bsb;
	}
	
	public static int update(String name, String password, String emailid)
	{
		 int status=0;  
		 
		 try{
			 Connection con = DBConnection.getConnection();
			 
			 PreparedStatement ps = con.prepareStatement("update courieruser set name = ?, password = ? where email = ?");
			 
			 ps.setString(1, name);
			 ps.setString(2, AES256.encrypt(password));
			 ps.setString(3, emailid);
			 
			 status = ps.executeUpdate();
			 // System.out.println(status);
			 ps.close();
			 con.close(); 
		 }
		 catch (Exception e) {
			 e.printStackTrace();
		}
		 return status;
	} 

}
