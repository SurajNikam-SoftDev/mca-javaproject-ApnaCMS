package com.apnacms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apnacms.admin.dao.LogInDao;


/**
 * Servlet implementation class LogIn
 */
@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("login.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String email_id = request.getParameter("email_id")!=null || request.getParameter("email_id")!="" ? request.getParameter("email_id") : "undefined" ;
		email_id = email_id.isEmpty()?"undefined":email_id;
		
		String password = request.getParameter("password")!=null || request.getParameter("password")!="" ? request.getParameter("password") : "undefined" ;
		password = password.isEmpty()?"undefined":password;
			
//		System.out.println(email_id +" :: "+ password);
		
		int status = LogInDao.login(email_id, password);

		if (status == 2) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Successfully');");
			out.println("</script>");
			HttpSession session = request.getSession();
			session.setAttribute("emailid", email_id);
			response.sendRedirect("./StaffPanel");

		}
		else if (status == 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Successfully');");
			out.println("</script>");
			HttpSession session = request.getSession();
			session.setAttribute("emailid", email_id);
			response.sendRedirect("./AdminPanel");

		}
		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Is Invalid');");
			out.println("</script>");
			response.sendRedirect("./LogIn");
		}
		
		
	}

}
