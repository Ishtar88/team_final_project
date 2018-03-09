package com.jsr.project.dtos;

import java.util.Date;

public class PointDto {
	
	private int po_seq; 
	
	private String id;
	
	private Date po_regdate;
	
	private String po_name;
	
	private String po_detail;
	
	private int po_point;
	
	public PointDto() {
		// TODO Auto-generated constructor stub
	}

	public int getPo_seq() {
		return po_seq;
	}

	public void setPo_seq(int po_seq) {
		this.po_seq = po_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getPo_regdate() {
		return po_regdate;
	}

	public void setPo_regdate(Date po_regdate) {
		this.po_regdate = po_regdate;
	}

	public String getPo_name() {
		return po_name;
	}

	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}

	public String getPo_detail() {
		return po_detail;
	}

	public void setPo_detail(String po_detail) {
		this.po_detail = po_detail;
	}

	public int getPo_point() {
		return po_point;
	}

	public void setPo_point(int po_point) {
		this.po_point = po_point;
	}

	@Override
	public String toString() {
		return "PointDto [po_seq=" + po_seq + ", id=" + id + ", po_regdate=" + po_regdate + ", po_name=" + po_name
				+ ", po_detail=" + po_detail + ", po_point=" + po_point + "]";
	}

	public PointDto(int po_seq, String id, Date po_regdate, String po_name, String po_detail, int po_point) {
		super();
		this.po_seq = po_seq;
		this.id = id;
		this.po_regdate = po_regdate;
		this.po_name = po_name;
		this.po_detail = po_detail;
		this.po_point = po_point;
	}

	
	

}
