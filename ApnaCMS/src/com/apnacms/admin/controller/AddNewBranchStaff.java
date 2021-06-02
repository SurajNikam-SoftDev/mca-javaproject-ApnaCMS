package com.apnacms.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.apnacms.admin.bean.BranchStaffBean;
import com.apnacms.admin.dao.BranchStaffDao;

/**
 * Servlet implementation class AddNewBranchStaff
 */
@WebServlet("/AddNewBranchStaff")
public class AddNewBranchStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewBranchStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Admin/addnewbranchstaff.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Welcome");
		
		String firstname = request.getParameter("firstname")!=null || request.getParameter("firstname")!="" ? request.getParameter("firstname") : "undefined" ;
		firstname = firstname.isEmpty()?"undefined":firstname;
		
		String middlename = request.getParameter("middlename")!=null || request.getParameter("middlename")!="" ? request.getParameter("middlename") : "undefined" ;
		middlename = middlename.isEmpty()?"undefined":middlename;
		
		String lastname = request.getParameter("lastname")!=null || request.getParameter("lastname")!="" ? request.getParameter("lastname") : "undefined" ;
		lastname = lastname.isEmpty()?"undefined":lastname;
		
		String branchname = request.getParameter("branchname")!=null || request.getParameter("branchname")!="" ? request.getParameter("branchname") : "undefined" ;
		branchname = branchname.isEmpty()?"undefined":branchname;
		
		String email = request.getParameter("email")!=null || request.getParameter("email")!="" ? request.getParameter("email") : "undefined" ;
		email = email.isEmpty()?"undefined":email;
		
		String password = request.getParameter("password")!=null || request.getParameter("password")!="" ? request.getParameter("password") : "undefined" ;
		password = password.isEmpty()?"undefined":password;
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		BranchStaffBean bsb = new BranchStaffBean();
		bsb.setName(firstname +" "+ middlename +" "+ lastname);
		bsb.setBranch_id(branchname);
		bsb.setEmail(email);
		bsb.setPassword(password);
		
		
		int status = BranchStaffDao.save(bsb);

		if (status == 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Inserted');");
			out.println("</script>");
			response.sendRedirect("./BranchStaffList");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Not Inserted');");
			out.println("</script>");
			response.sendRedirect("./AddNewBranchStaff");
		}
		 
	}

}
