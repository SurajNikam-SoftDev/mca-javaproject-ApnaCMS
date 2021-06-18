package com.apnacms.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.admin.dao.BranchDao;
import com.apnacms.bean.ParcelBean;
import com.apnacms.dao.ParcelDao;

/**
 * Servlet implementation class EditParcel
 */
@WebServlet("/EditParcel")
public class EditParcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditParcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Admin/editparcel.jsp").forward(request, response); 
		
		/*
		 * String sender_name = request.getParameter("sender_name") != null ||
		 * request.getParameter("sender_name") != "" ?
		 * request.getParameter("sender_name") : "undefined"; sender_name =
		 * sender_name.isEmpty() ? "undefined" : sender_name;
		 * 
		 * String sender_address = request.getParameter("sender_address") != null ||
		 * request.getParameter("sender_address") != "" ?
		 * request.getParameter("sender_address") : "undefined"; sender_address =
		 * sender_address.isEmpty() ? "undefined" : sender_address;
		 * 
		 * String sender_contact = request.getParameter("sender_contact") != null ||
		 * request.getParameter("sender_contact") != "" ?
		 * request.getParameter("sender_contact") : "undefined"; sender_contact =
		 * sender_contact.isEmpty() ? "undefined" : sender_contact;
		 * 
		 * String recipient_name = request.getParameter("recipient_name") != null ||
		 * request.getParameter("recipient_name") != "" ?
		 * request.getParameter("recipient_name") : "undefined"; recipient_name =
		 * recipient_name.isEmpty() ? "undefined" : recipient_name;
		 * 
		 * String recipient_address = request.getParameter("recipient_address") != null
		 * || request.getParameter("recipient_address") != "" ?
		 * request.getParameter("recipient_address") : "undefined"; recipient_address =
		 * recipient_address.isEmpty() ? "undefined" : recipient_address;
		 * 
		 * String recipient_contact = request.getParameter("recipient_contact") != null
		 * || request.getParameter("recipient_contact") != "" ?
		 * request.getParameter("recipient_contact") : "undefined"; recipient_contact =
		 * recipient_contact.isEmpty() ? "undefined" : recipient_contact;
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
			sender_name sender_address sender_contact recipient_name recipient_address recipient_contact
			type branchprocess deliverybranch pickupbranch height weight length width qty total
			
		*/
		
		
	}

}
