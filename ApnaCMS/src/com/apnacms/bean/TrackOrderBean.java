package com.apnacms.bean;

import java.io.Serializable;
public class TrackOrderBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String parcelid, referenceno, status, date_created;

	public String getParcelid() {
		return parcelid;
	}

	public void setParcelid(String parcelid) {
		this.parcelid = parcelid;
	}

	public String getReferenceno() {
		return referenceno;
	}

	public void setReferenceno(String referenceno) {
		this.referenceno = referenceno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate_created() {
		return date_created;
	}

	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}

	

}
