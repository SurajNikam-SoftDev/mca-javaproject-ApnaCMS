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
 * Servlet implementation class EditBranchStaff
 */
@WebServlet("/EditBranchStaff")
public class EditBranchStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBranchStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Admin/editbranchstaff.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name")!=null || request.getParameter("name")!="" ? request.getParameter("name") : "undefined" ;
		name = name.isEmpty()?"undefined":name;
		
		String branchname = request.getParameter("branchname")!=null || request.getParameter("branchname")!="" ? request.getParameter("branchname") : "undefined" ;
		branchname = branchname.isEmpty()?"undefined":branchname;
		
		String email = request.getParameter("email")!=null || request.getParameter("email")!="" ? request.getParameter("email") : "undefined" ;
		email = email.isEmpty()?"undefined":email;
		
		String password = request.getParameter("password")!=null || request.getParameter("password")!="" ? request.getParameter("password") : "undefined" ;
		password = password.isEmpty()?"undefined":password;
		
		String key = request.getParameter("key")!=null || request.getParameter("key")!="" ? request.getParameter("key") : "undefined" ;
		key = key.isEmpty()?"undefined":key;
		
//		System.out.println(name +" :: "+ branchname +" :: "+ email +" :: "+ password +" :: "+ key);
		 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		BranchStaffBean bsb = new BranchStaffBean();
		bsb.setName(name);
		bsb.setBranch_id(branchname);
		bsb.setEmail(email);
		bsb.setPassword(password);
		bsb.setCuid(key);
		
		int status = BranchStaffDao.update(bsb);

		if (status == 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Updated');");
			out.println("</script>");
			response.sendRedirect("./BranchStaffList");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Not Updated');");
			out.println("</script>");
			response.sendRedirect("./EditBranchStaff?key="+key);
		}
	}

}
