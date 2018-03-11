package com.jsr.project.dtos;

import java.sql.Date;

public class FundDto {
	
	private String id;
	
	private int f_seq;
	
	private String f_name;
	
	private int f_money;
	
	private int f_add;
	
	private int f_inter;
	
	private Date f_buydate;
	
	private Date f_modidate;
	
	private Date f_enddate;
	
	private String f_endable;
	
	private String f_memo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public int getF_money() {
		return f_money;
	}

	public void setF_money(int f_money) {
		this.f_money = f_money;
	}

	public int getF_add() {
		return f_add;
	}

	public void setF_add(int f_add) {
		this.f_add = f_add;
	}

	public int getF_inter() {
		return f_inter;
	}

	public void setF_inter(int f_inter) {
		this.f_inter = f_inter;
	}

	public Date getF_buydate() {
		return f_buydate;
	}

	public void setF_buydate(Date f_buydate) {
		this.f_buydate = f_buydate;
	}

	public Date getF_modidate() {
		return f_modidate;
	}

	public void setF_modidate(Date f_modidate) {
		this.f_modidate = f_modidate;
	}

	public Date getF_enddate() {
		return f_enddate;
	}

	public void setF_enddate(Date f_enddate) {
		this.f_enddate = f_enddate;
	}

	public String getF_endable() {
		return f_endable;
	}

	public void setF_endable(String f_endable) {
		this.f_endable = f_endable;
	}

	public String getF_memo() {
		return f_memo;
	}

	public void setF_memo(String f_memo) {
		this.f_memo = f_memo;
	}

	public FundDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FundDto(String id, int f_seq, String f_name, int f_money, int f_add, int f_inter, Date f_buydate,
			Date f_modidate, Date f_enddate, String f_endable, String f_memo) {
		super();
		this.id = id;
		this.f_seq = f_seq;
		this.f_name = f_name;
		this.f_money = f_money;
		this.f_add = f_add;
		this.f_inter = f_inter;
		this.f_buydate = f_buydate;
		this.f_modidate = f_modidate;
		this.f_enddate = f_enddate;
		this.f_endable = f_endable;
		this.f_memo = f_memo;
	}

	@Override
	public String toString() {
		return "FundDto [id=" + id + ", f_seq=" + f_seq + ", f_name=" + f_name + ", f_money=" + f_money + ", f_add="
				+ f_add + ", f_inter=" + f_inter + ", f_buydate=" + f_buydate + ", f_modidate=" + f_modidate
				+ ", f_enddate=" + f_enddate + ", f_endable=" + f_endable + ", f_memo=" + f_memo + "]";
	}
	
	
}
