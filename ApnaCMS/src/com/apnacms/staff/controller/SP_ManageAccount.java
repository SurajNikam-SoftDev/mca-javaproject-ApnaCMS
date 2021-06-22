package com.apnacms.staff.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.dao.StaffDao;

/**
 * Servlet implementation class SP_ManageAccount
 */
@WebServlet("/SP_ManageAccount")
public class SP_ManageAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SP_ManageAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Staff/manageaccount.jsp").forward(request, response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name") != null || request.getParameter("name") != ""
				? request.getParameter("name")
				: "undefined";
				name = name.isEmpty() ? "undefined" : name;

		String password = request.getParameter("password") != null || request.getParameter("password") != ""
				? request.getParameter("password")
				: "undefined";
				password = password.isEmpty() ? "undefined" : password;
				
		String email = request.getParameter("email") != null || request.getParameter("email") != ""
				? request.getParameter("email")
				: "undefined";
				email = email.isEmpty() ? "undefined" : email;
				
		System.out.println(name + " :: " + password + " :: " + email);
		
		int status = StaffDao.update(name, password, email);
		
		if (status == 1) {
			response.sendRedirect("./SP_ManageAccount");
		} else {
			response.sendRedirect("./SP_ManageAccount");
		}
	}

}
