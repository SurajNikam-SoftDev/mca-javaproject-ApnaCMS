package com.apnacms.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.apnacms.admin.bean.BranchBean;
import com.apnacms.admin.bean.BranchStaffBean;
import com.apnacms.dbconnection.DBConnection;
import com.apnacms.features.AES256;

public class BranchStaffDao {
	public static int save(BranchStaffBean bsb)
	{
		int status = 0;
		
		try{
			 Connection con = DBConnection.getConnection();
			 PreparedStatement ps = con.prepareStatement("insert into courieruser(name, email, password, branch_id) values(?,?,?,?)");
			 System.out.println("insert into courieruser(name, email, password, branch_id) values ('" + bsb.getName()+ "','" + bsb.getEmail() + "','" + AES256.encrypt(bsb.getPassword()) + "','" + bsb.getBranch_id() + "')");

			 ps.setString(1, bsb.getName().toUpperCase());
			 ps.setString(2, bsb.getEmail());
			 ps.setString(3, AES256.encrypt(bsb.getPassword()));
			 ps.setString(4, bsb.getBranch_id());
			 
			 status = ps.executeUpdate();
//			 System.out.println("BranchDao.save() Insert Successfully");
			 ps.close();
			 con.close();			 
		}
		 catch (Exception e) {
			 e.printStackTrace();
		}
		
		
		return status;
	} 
	
	public static List<BranchStaffBean> getAllRecords()
	{
		List<BranchStaffBean> lbsb = new ArrayList<BranchStaffBean>();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from courieruser where type = 2");
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next())
			{
				 BranchStaffBean bsb= new BranchStaffBean();
				 bsb.setCuid(rs.getString("cuid")); 
				 bsb.setName(rs.getString("name"));  
		         bsb.setEmail(rs.getString("email"));
		         bsb.setBranch_id(rs.getString("branch_id"));
		             
		         lbsb.add(bsb); 
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return lbsb;
	}
	
	public static String getBranchById(String id)
	{
		String branchname = null;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from branches where bid = ?  AND type = 2");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery(); 
			 
			if(rs.next())
			{
				branchname = AES256.decrypt(rs.getString("branch_code")) +" - "+ rs.getString("street") +" - "+ rs.getString("state") +" - "+ rs.getString("city") +" - "+ rs.getString("zipcode");
//				System.out.println(branchname);
			} 
			
			ps.close(); 
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return branchname;
	}
	
	public static BranchStaffBean getAllRecordsById(String id)
	{
		BranchStaffBean bsb= new BranchStaffBean();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from courieruser where cuid = ?  AND type = 2");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery(); 
			 
			while(rs.next())
			{
				 bsb.setCuid(rs.getString("cuid"));
				 bsb.setName(rs.getString("name"));
				 bsb.setEmail(rs.getString("email"));
				 bsb.setBranch_id(rs.getString("branch_id"));
				 bsb.setPassword(AES256.decrypt(rs.getString("password")));
				 
				 System.out.println(rs.getString("cuid") +" :: "+rs.getString("name") +" :: "+rs.getString("email") +" :: "+rs.getString("branch_id") +" :: "+rs.getString("password"));
		    } 
			 
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return bsb;
	}
	
	public static int update(BranchStaffBean bsb)
	{
		 int status=0;  
		 
		 try{
			 Connection con = DBConnection.getConnection();
			 
			 PreparedStatement ps = con.prepareStatement("update courieruser set name = ?, email = ?, password = ?, branch_id = ?  where cuid = ?");
			 System.out.println("update courieruser set name = '"+bsb.getName()+"', email = '"+bsb.getEmail()+"', password = '"+AES256.encrypt(bsb.getPassword())+"', branch_id = '"+bsb.getBranch_id()+"'  where cuid = '"+bsb.getCuid()+"'");
			 ps.setString(1, bsb.getName());
			 ps.setString(2, bsb.getEmail());
			 ps.setString(3, AES256.encrypt(bsb.getPassword()));
			 ps.setString(4, bsb.getBranch_id());
			 ps.setString(5, bsb.getCuid());
			 
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
	
	public static int delete(int id)
	{
		 int status=0;  
		
		 try{
			 
			 Connection con = DBConnection.getConnection();
			 PreparedStatement ps = con.prepareStatement("delete from courieruser where cuid = ?");
			 ps.setInt(1, id);
			 
			 status = ps.executeUpdate();
			 //System.out.println("delete Successfully");
			 ps.close();
			 con.close();
		 }
		 catch (Exception e) {
			 e.printStackTrace();
		}
		 return status;
	}
}
