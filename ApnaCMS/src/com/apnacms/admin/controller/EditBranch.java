package com.apnacms.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.admin.bean.BranchBean;
import com.apnacms.admin.dao.BranchDao;

/**
 * Servlet implementation class EditBranch
 */
@WebServlet("/EditBranch")
public class EditBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBranch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Admin/editbranch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String streetbuilding = request.getParameter("streetbuilding")!=null || request.getParameter("streetbuilding")!="" ? request.getParameter("streetbuilding") : "undefined" ;
		streetbuilding = streetbuilding.isEmpty()?"undefined":streetbuilding;
		
		String country = request.getParameter("country")!=null || request.getParameter("country")!="" ? request.getParameter("country") : "undefined" ;
		country = country.isEmpty()?"undefined":country;
		
		String state = request.getParameter("state")!=null || request.getParameter("state")!="" ? request.getParameter("state") : "undefined" ;
		state = state.isEmpty()?"undefined":state;
		
		String city = request.getParameter("city")!=null || request.getParameter("city")!="" ? request.getParameter("city") : "undefined" ;
		city = city.isEmpty()?"undefined":city;
		
		String zipcode = request.getParameter("zipcode")!=null || request.getParameter("zipcode")!="" ? request.getParameter("zipcode") : "undefined" ;
		zipcode = zipcode.isEmpty()?"undefined":zipcode;
		
		String contactno = request.getParameter("contactno")!=null || request.getParameter("contactno")!="" ? request.getParameter("contactno") : "undefined" ;
		contactno = contactno.isEmpty()?"undefined":contactno;
		
		String key = request.getParameter("key")!=null || request.getParameter("key")!="" ? request.getParameter("key") : "undefined" ;
		key = key.isEmpty()?"undefined":key;
		
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		System.out.println(key +" :: "+ streetbuilding +" :: "+ country +" :: "+ state +" :: "+ city +" :: "+ zipcode +" :: "+ contactno );
		BranchBean bb = new BranchBean();
		bb.setBid(key);
		bb.setStreetbuilding(streetbuilding);
		bb.setCountry(country);
		bb.setState(state);
		bb.setCity(city);
		bb.setZipcode(zipcode);
		bb.setContactno(contactno);
		
		int status = BranchDao.update(bb);

		if (status == 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Updated');");
			out.println("</script>");
			response.sendRedirect("./BranchList");
		} else { 
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Not Updated');");
			out.println("</script>");
			response.sendRedirect("./EditBranch?key="+key);
		}
		 
		
	}

}
