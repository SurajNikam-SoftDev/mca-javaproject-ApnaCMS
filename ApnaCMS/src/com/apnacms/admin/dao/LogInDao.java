package com.apnacms.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.apnacms.dbconnection.DBConnection;
import com.apnacms.features.AES256;


public class LogInDao {
	public static int login(String emailid, String password)
	{
		int status = 0;
			
		try{
			 
			 Connection con = DBConnection.getConnection();

			 PreparedStatement ps = con.prepareStatement("select password from courieruser where email = ? AND type = 2 AND status = 1");
//			 System.out.println("select password from courieruser where email = '"+emailid+"' AND type = 2 AND status = 1");
			 ps.setString(1, emailid);
			 
			 
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) 
			 {	
//				 System.out.println("Staff :: "+AES256.decrypt(rs.getString("password")).equals(password));
				 if(AES256.decrypt(rs.getString("password")).equals(password)) {
					 status = 2;
				 }
				 else {
					 status = 0;
				 }
			 }
			 else if(status != 2) {
				 ps = con.prepareStatement("select password from courieruser where email = ? AND type = 1 AND status = 1");
//				 System.out.println("select password from courieruser where email = '"+emailid+"' AND type = 1 AND status = 1");
				 ps.setString(1, emailid);
				  
				 
				 rs = ps.executeQuery();
				 if(rs.next()) 
				 {	
//					 System.out.println("Admin :: "+AES256.decrypt(rs.getString("password")).equals(password));
					 if(AES256.decrypt(rs.getString("password")).equals(password)) {
						 status = 1;
					 }
					 else {
						 status = 0;
					 }
				 }
				 else {
					 status = 0;
				 }
			 }
			 
			  
			 rs.close();
			 ps.close();
			 con.close();
		 }
		 catch (Exception e) {
			 e.printStackTrace();
		}
		
		return status;
	}
}
