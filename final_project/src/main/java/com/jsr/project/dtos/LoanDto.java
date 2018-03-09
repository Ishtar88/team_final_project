package com.jsr.project.dtos;

import java.util.Date;

public class LoanDto {
	
	private String id;
	
	private int l_seq;
	
	private String l_name;
	
	private int l_money;
	
	private int l_remane;
	
	private int l_bal;
	
	private Date l_startdate;
	
	private Date l_modidate;
	
	private Date l_enddate;
	
	private String l_endable;
	
	private String l_memo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getL_seq() {
		return l_seq;
	}

	public void setL_seq(int l_seq) {
		this.l_seq = l_seq;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public int getL_money() {
		return l_money;
	}

	public void setL_money(int l_money) {
		this.l_money = l_money;
	}

	public int getL_remane() {
		return l_remane;
	}

	public void setL_remane(int l_remane) {
		this.l_remane = l_remane;
	}

	public int getL_bal() {
		return l_bal;
	}

	public void setL_bal(int l_bal) {
		this.l_bal = l_bal;
	}

	public Date getL_startdate() {
		return l_startdate;
	}

	public void setL_startdate(Date l_startdate) {
		this.l_startdate = l_startdate;
	}

	public Date getL_modidate() {
		return l_modidate;
	}

	public void setL_modidate(Date l_modidate) {
		this.l_modidate = l_modidate;
	}

	public Date getL_enddate() {
		return l_enddate;
	}

	public void setL_enddate(Date l_enddate) {
		this.l_enddate = l_enddate;
	}

	public String getL_endable() {
		return l_endable;
	}

	public void setL_endable(String l_endable) {
		this.l_endable = l_endable;
	}

	public String getL_memo() {
		return l_memo;
	}

	public void setL_memo(String l_memo) {
		this.l_memo = l_memo;
	}

	public LoanDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoanDto(String id, int l_seq, String l_name, int l_money, int l_remane, int _bal, Date l_startdate,
			Date l_modidate, Date l_enddate, String l_endable, String l_memo) {
		super();
		this.id = id;
		this.l_seq = l_seq;
		this.l_name = l_name;
		this.l_money = l_money;
		this.l_remane = l_remane;
		this.l_bal = _bal;
		this.l_startdate = l_startdate;
		this.l_modidate = l_modidate;
		this.l_enddate = l_enddate;
		this.l_endable = l_endable;
		this.l_memo = l_memo;
	}

	@Override
	public String toString() {
		return "LoanDto [id=" + id + ", l_seq=" + l_seq + ", l_name=" + l_name + ", l_money=" + l_money + ", l_remane="
				+ l_remane + ", l_bal=" + l_bal + ", l_startdate=" + l_startdate + ", l_modidate=" + l_modidate
				+ ", l_enddate=" + l_enddate + ", l_endable=" + l_endable + ", l_memo=" + l_memo + "]";
	}
	

}
