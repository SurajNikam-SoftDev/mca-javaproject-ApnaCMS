package com.apnacms.admin.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.apnacms.admin.bean.BranchBean;
import com.apnacms.dbconnection.DBConnection;
import com.apnacms.features.AES256;
import com.apnacms.features.RandomNumberGenerator;

public class BranchDao 
{
	public static int save(BranchBean bb)
	{
		int status = 0;
		int upperbound = 10000000;
		int lowerbound = 1000;
		try{
			 
			 Connection con = DBConnection.getConnection();
			 int branch_code = RandomNumberGenerator.getRandomNumber(upperbound, lowerbound);
			 while(validateRandomNo(branch_code) != 0) // 1 == true , 0 == false 
			 { 
				 branch_code = RandomNumberGenerator.getRandomNumber(upperbound, lowerbound);
				 
			 }
			  
			
			 PreparedStatement ps = con.prepareStatement("insert into branches(branch_code, street, country, state, city, zipcode, contact_no) values(?,?,?,?,?,?,?)");
//			 System.out.println("insert into branches(branch_code, street, country, state, city, zipcode, contact_no) values ('"+ branch_code + "','" + bb.getStreetbuilding() + "','" + bb.getCountry() + "','"+ bb.getState() + "','" + bb.getCity() + "','" + bb.getZipcode() + "','" + bb.getContactno() + "')");
			 
			 ps.setString(1, AES256.encrypt(String.valueOf(branch_code)));
			 ps.setString(2, bb.getStreetbuilding());
			 ps.setString(3, bb.getCountry());
			 ps.setString(4, bb.getState());
			 ps.setString(5, bb.getCity());
			 ps.setString(6, bb.getZipcode());
			 ps.setString(7, bb.getContactno());
			 
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
	
	@SuppressWarnings("unused")
	private static int validateRandomNo(int generated_no){
		int status = 0;

		try {
			
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from branches where branch_code = ?  AND type = 2 LIMIT 1");
			ps.setString(1, AES256.encrypt(String.valueOf(generated_no)));
			ResultSet rs = ps.executeQuery();

			if(rs.next())
			{
				++status;
			}	
			
//			System.out.println("BranchDao.validateRandomNo() " + status);
			ps.close();
			con.close();			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static List<BranchBean> getAllRecords()
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
		         bb.setCountry(rs.getString("country"));
		         bb.setContactno(rs.getString("contact_no"));
		         bb.setDate_created(rs.getString("date_created"));
		             
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
	
	public static BranchBean getAllRecordsById(String id)
	{
//		System.out.println("id ::"+id);
		BranchBean bb= new BranchBean();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from branches where bid = ? AND type = 2");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery(); 
			 
			while(rs.next())
			{
				 bb.setBid(rs.getString("bid"));
				 bb.setBranch_code(AES256.decrypt(rs.getString("branch_code")));  
		         bb.setStreetbuilding(rs.getString("street"));
		         bb.setState(rs.getString("state"));
		         bb.setCity(rs.getString("city"));
		         bb.setZipcode(rs.getString("zipcode")); 
		         bb.setCountry(rs.getString("country"));
		         bb.setContactno(rs.getString("contact_no"));
		         bb.setDate_created(rs.getString(""));
/*		         System.out.println(rs.getString("bid") +" :: "+AES256.decrypt(rs.getString("branch_code"))
		         +" :: "+rs.getString("street") +" :: "+rs.getString("state") +" :: "+rs.getString("city")
		         +" :: "+rs.getString("zipcode") +" :: "+rs.getString("contact_no") +" :: "+rs.getString("date_created"));
*/			} 
			 
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return bb;
	}
	
	public static int update(BranchBean bb)
	{
		 int status=0;  
		 
		 try{
			 
			 Connection con = DBConnection.getConnection();
			 PreparedStatement ps = con.prepareStatement("update branches set street = ?, country = ?, state = ?, city = ?, zipcode = ?, contact_no = ?  where bid = ?");
			 ps.setString(1, bb.getStreetbuilding());
			 ps.setString(2, bb.getCountry());
			 ps.setString(3, bb.getState());
			 ps.setString(4, bb.getCity());
			 ps.setString(5, bb.getZipcode());
			 ps.setString(6, bb.getContactno());
			 ps.setString(7, bb.getBid());
			 
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
			 PreparedStatement ps = con.prepareStatement("delete from branches where bid = ?");
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
	
	public static List<BranchBean> getAllBranches()
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
	
}
