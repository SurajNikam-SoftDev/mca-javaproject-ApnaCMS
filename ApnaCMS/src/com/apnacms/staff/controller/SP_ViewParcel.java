package com.apnacms.staff.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.dao.ParcelDao;

/**
 * Servlet implementation class SP_ViewParcel
 */
@WebServlet("/SP_ViewParcel")
public class SP_ViewParcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SP_ViewParcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Staff/viewparcel.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parcel_id = request.getParameter("parcel_id") != null
				|| request.getParameter("parcel_id") != "" ? request.getParameter("parcel_id") : "undefined";
		parcel_id = parcel_id.isEmpty() ? "undefined" : parcel_id;
		
		
		String trackstatus = request.getParameter("trackstatus") != null
				|| request.getParameter("trackstatus") != "" ? request.getParameter("trackstatus") : "undefined";
		trackstatus = trackstatus.isEmpty() ? "undefined" : trackstatus;
		
		String remark = request.getParameter("remark") != null
				|| request.getParameter("remark") != "" ? request.getParameter("remark") : "undefined";
		remark = remark.isEmpty() ? "undefined" : remark;
		
		System.out.println(parcel_id + " :: " + trackstatus + " :: " + remark);
		
		int status = ParcelDao.updateTrackStatusById(parcel_id, trackstatus, remark);
		if (status == 1) {
			response.sendRedirect("./SP_ItemAcceptByCourier");
		} else {
			response.sendRedirect("./SP_ViewParcel?key="+parcel_id);
		}
	}

}
