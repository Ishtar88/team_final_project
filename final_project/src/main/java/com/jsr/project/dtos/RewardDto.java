package com.jsr.project.dtos;

import java.util.Date;

public class RewardDto {
	
	private int r_seq;
	private String r_name;
	private String b_seq;
	private int r_point;
	private String r_sell;
	private String r_location;
	private String r_file;
	private Date r_regDate;
	private Date r_modiDate;
	private CompanyDto b_name;
	private PointDto po_point;
	
	public PointDto getPo_point() {
		return po_point;
	}

	public void setPo_point(PointDto po_point) {
		this.po_point = po_point;
	}

	public CompanyDto getB_name() {
		return b_name;
	}

	public void setB_name(CompanyDto b_name) {
		this.b_name = b_name;
	}

	public RewardDto() {
		super();
		
	}

	public RewardDto(int r_seq, String r_name, String b_seq, int r_point, String r_sell, String r_location,
			String r_file, Date r_regDate, Date r_modiDate) {
		super();
		this.r_seq = r_seq;
		this.r_name = r_name;
		this.b_seq = b_seq;
		this.r_point = r_point;
		this.r_sell = r_sell;
		this.r_location = r_location;
		this.r_file = r_file;
		this.r_regDate = r_regDate;
		this.r_modiDate = r_modiDate;
	}

	public int getR_seq() {
		return r_seq;
	}

	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getB_seq() {
		return b_seq;
	}

	public void setB_seq(String b_seq) {
		this.b_seq = b_seq;
	}

	public int getR_point() {
		return r_point;
	}

	public void setR_point(int r_point) {
		this.r_point = r_point;
	}

	public String getR_sell() {
		return r_sell;
	}

	public void setR_sell(String r_sell) {
		this.r_sell = r_sell;
	}

	public String getR_location() {
		return r_location;
	}

	public void setR_location(String r_location) {
		this.r_location = r_location;
	}

	public String getR_file() {
		return r_file;
	}

	public void setR_file(String r_file) {
		this.r_file = r_file;
	}

	public Date getR_regDate() {
		return r_regDate;
	}

	public void setR_regDate(Date r_regDate) {
		this.r_regDate = r_regDate;
	}

	public Date getR_modiDate() {
		return r_modiDate;
	}

	public void setR_modiDate(Date r_modiDate) {
		this.r_modiDate = r_modiDate;
	}

	@Override
	public String toString() {
		return "RewardDto [r_seq=" + r_seq + ", r_name=" + r_name + ", b_seq=" + b_seq + ", r_point=" + r_point
				+ ", r_sell=" + r_sell + ", r_location=" + r_location + ", r_file=" + r_file + ", r_regDate="
				+ r_regDate + ", r_modiDate=" + r_modiDate + "]";
	}
	

	

}
