package com.apnacms.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.admin.dao.BranchDao;

/**
 * Servlet implementation class DeleteBranch
 */
@WebServlet("/DeleteBranch")
public class DeleteBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBranch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String key = request.getParameter("key")!=null || request.getParameter("key")!="" ? request.getParameter("key") : "undefined" ;
		key = key.isEmpty()?"undefined":key;
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int status = BranchDao.delete(Integer.parseInt(key));

		if (status == 1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Inserted');");
			out.println("</script>");
			response.sendRedirect("./BranchList"); 
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Is Not Inserted');");
			out.println("</script>");
			response.sendRedirect("./AddNewBranch");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
