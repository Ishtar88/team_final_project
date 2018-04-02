package com.jsr.project.dtos;

import java.util.Date;

public class CompanyDto {
	
	private int b_seq;
	private String b_name;
	private String b_num;
	private String b_address;
	private String b_tel;
	private Date b_regDate;
	private String deal;
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public CompanyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompanyDto(int b_seq, String b_name, String b_num, String b_address, String b_tel, Date b_regDate) {
		super();
		this.b_seq = b_seq;
		this.b_name = b_name;
		this.b_num = b_num;
		this.b_address = b_address;
		this.b_tel = b_tel;
		this.b_regDate = b_regDate;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_num() {
		return b_num;
	}
	public void setB_num(String b_num) {
		this.b_num = b_num;
	}
	public String getB_address() {
		return b_address;
	}
	public void setB_address(String b_address) {
		this.b_address = b_address;
	}
	public String getB_tel() {
		return b_tel;
	}
	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}
	public Date getB_regDate() {
		return b_regDate;
	}
	public void setB_regDate(Date b_regDate) {
		this.b_regDate = b_regDate;
	}
	@Override
	public String toString() {
		return "CompanyDto [b_seq=" + b_seq + ", b_name=" + b_name + ", b_num=" + b_num + ", b_address=" + b_address
				+ ", b_tel=" + b_tel + ", b_regDate=" + b_regDate + ", deal=" + deal + "]";
	}
	
	
	

}
