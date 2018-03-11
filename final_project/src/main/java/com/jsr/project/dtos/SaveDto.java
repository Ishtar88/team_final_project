package com.jsr.project.dtos;

import java.util.Date;

public class SaveDto {
	
	private String id;
	
	private int s_seq;
	
	private String s_name;
	
	private String s_detail;
	
	private int s_money;
	
	private int s_add;
	
	private int s_tax;
	
	private int s_count;
	
	private Date s_regdate;
	
	private Date s_startdate;
	
	private Date s_enddate;
	
	private String s_endable;
	
	private String s_memo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_detail() {
		return s_detail;
	}

	public void setS_detail(String s_detail) {
		this.s_detail = s_detail;
	}

	public int getS_money() {
		return s_money;
	}

	public void setS_money(int s_money) {
		this.s_money = s_money;
	}

	public int getS_add() {
		return s_add;
	}

	public void setS_add(int s_add) {
		this.s_add = s_add;
	}

	public int getS_tax() {
		return s_tax;
	}

	public void setS_tax(int s_tax) {
		this.s_tax = s_tax;
	}

	public int getS_count() {
		return s_count;
	}

	public void setS_count(int s_count) {
		this.s_count = s_count;
	}

	public Date getS_regdate() {
		return s_regdate;
	}

	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}

	public Date getS_startdate() {
		return s_startdate;
	}

	public void setS_startdate(Date s_startdate) {
		this.s_startdate = s_startdate;
	}

	public Date getS_enddate() {
		return s_enddate;
	}

	public void setS_enddate(Date s_enddate) {
		this.s_enddate = s_enddate;
	}

	public String getS_endable() {
		return s_endable;
	}

	public void setS_endable(String s_endable) {
		this.s_endable = s_endable;
	}

	public String getS_memo() {
		return s_memo;
	}

	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}

	public SaveDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SaveDto(String id, int s_seq, String s_name, String s_detail, int s_money, int s_add, int s_tax, int s_count,
			Date s_regdate, Date s_startdate, Date s_enddate, String s_endable, String s_memo) {
		super();
		this.id = id;
		this.s_seq = s_seq;
		this.s_name = s_name;
		this.s_detail = s_detail;
		this.s_money = s_money;
		this.s_add = s_add;
		this.s_tax = s_tax;
		this.s_count = s_count;
		this.s_regdate = s_regdate;
		this.s_startdate = s_startdate;
		this.s_enddate = s_enddate;
		this.s_endable = s_endable;
		this.s_memo = s_memo;
	}

	@Override
	public String toString() {
		return "SaveDto [id=" + id + ", s_seq=" + s_seq + ", s_name=" + s_name + ", s_detail=" + s_detail + ", s_money="
				+ s_money + ", s_add=" + s_add + ", s_tax=" + s_tax + ", s_count=" + s_count + ", s_regdate="
				+ s_regdate + ", s_startdate=" + s_startdate + ", s_enddate=" + s_enddate + ", s_endable=" + s_endable
				+ ", s_memo=" + s_memo + "]";
	}


	

}
