package com.apnacms.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apnacms.bean.ParcelBean;
import com.apnacms.dao.ParcelDao;

/**
 * Servlet implementation class PreApprovalParcel
 */
@WebServlet("/PreApprovalParcel")
public class PreApprovalParcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreApprovalParcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Admin/preapprovalparcel.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parcel_id = request.getParameter("parcel_id") != null
				|| request.getParameter("parcel_id") != "" ? request.getParameter("parcel_id") : "undefined";
		parcel_id = parcel_id.isEmpty() ? "undefined" : parcel_id;
		
		
		String type = request.getParameter("type") != null
				|| request.getParameter("type") != "" ? request.getParameter("type") : "undefined";
		type = type.isEmpty() ? "undefined" : type;
		
		String branchprocess = request.getParameter("branchprocess") != null
				|| request.getParameter("branchprocess") != "" ? request.getParameter("branchprocess") : "undefined";
		branchprocess = branchprocess.isEmpty() ? "undefined" : branchprocess;
		
		String deliverybranch = request.getParameter("deliverybranch") != null
				|| request.getParameter("deliverybranch") != "" ? request.getParameter("deliverybranch") : "undefined";
		deliverybranch = deliverybranch.isEmpty() ? "undefined" : deliverybranch;
		
		String pickupbranch = request.getParameter("pickupbranch") != null
				|| request.getParameter("pickupbranch") != "" ? request.getParameter("pickupbranch") : "undefined";
		pickupbranch = pickupbranch.isEmpty() ? "undefined" : pickupbranch;
		
		String height = request.getParameter("height") != null
				|| request.getParameter("height") != "" ? request.getParameter("height") : "undefined";
		height = height.isEmpty() ? "undefined" : height;
		
		String weight = request.getParameter("weight") != null
				|| request.getParameter("weight") != "" ? request.getParameter("weight") : "undefined";
		weight = weight.isEmpty() ? "undefined" : weight;
		
		String length = request.getParameter("length") != null
				|| request.getParameter("length") != "" ? request.getParameter("length") : "undefined";
		length = length.isEmpty() ? "undefined" : length;
		
		String width = request.getParameter("width") != null
				|| request.getParameter("width") != "" ? request.getParameter("width") : "undefined";
		width = width.isEmpty() ? "undefined" : width;
		
		String qty = request.getParameter("qty") != null
				|| request.getParameter("qty") != "" ? request.getParameter("qty") : "undefined";
		qty = qty.isEmpty() ? "undefined" : qty;
		
		String price = request.getParameter("price") != null
				|| request.getParameter("price") != "" ? request.getParameter("price") : "undefined";
		price = price.isEmpty() ? "undefined" : price;
		
		System.out.println(parcel_id + " :: " + type + " :: " + branchprocess + " :: " + deliverybranch + " :: " + pickupbranch 
				+ " :: " + height + " :: " + weight + " :: " + length + " :: " + width + " :: " + qty + " :: " + price);
		
		ParcelBean pb = new ParcelBean();
		pb.setParcelid(parcel_id);
		pb.setType(type);
		pb.setFrombranchid(branchprocess);
		pb.setTobranchid(deliverybranch.equals("undefined")?pickupbranch:deliverybranch);
		pb.setProdheight(height);
		pb.setProdweight(weight);
		pb.setProdlength(length);
		pb.setProdwidth(width);
		pb.setQty(qty);
		pb.setPrice(price);
		
		int status = ParcelDao.updateParcelApprovedByCMS(pb);

		if (status == 1) {
			response.sendRedirect("./ParcelList");
		} else {
			response.sendRedirect("./PreApprovalParcel?key="+parcel_id);
		}
	}

}
