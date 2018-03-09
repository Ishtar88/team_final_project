package com.jsr.project.dtos;

import java.util.Date;

public class IncomeDto {
	
	private int i_seq;
	
	private String id;
	
	private String i_name;
	
	private int i_money;
	
	private String i_fix;
	
	private String i_memo;
	
	private Date i_regdate;
	
	private Date i_modidate;

	public int getI_seq() {
		return i_seq;
	}

	public void setI_seq(int i_seq) {
		this.i_seq = i_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_money() {
		return i_money;
	}

	public void setI_money(int i_money) {
		this.i_money = i_money;
	}

	public String getI_fix() {
		return i_fix;
	}

	public void setI_fix(String i_fix) {
		this.i_fix = i_fix;
	}

	public String getI_memo() {
		return i_memo;
	}

	public void setI_memo(String i_memo) {
		this.i_memo = i_memo;
	}

	public Date getI_regdate() {
		return i_regdate;
	}

	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}

	public Date getI_modidate() {
		return i_modidate;
	}

	public void setI_modidate(Date i_modidate) {
		this.i_modidate = i_modidate;
	}

	public IncomeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public IncomeDto(int i_seq, String id, String i_name, int i_money, String i_fix, String i_memo, Date i_regdate,
			Date i_modidate) {
		super();
		this.i_seq = i_seq;
		this.id = id;
		this.i_name = i_name;
		this.i_money = i_money;
		this.i_fix = i_fix;
		this.i_memo = i_memo;
		this.i_regdate = i_regdate;
		this.i_modidate = i_modidate;
	}

	@Override
	public String toString() {
		return "IncomeDto [i_seq=" + i_seq + ", id=" + id + ", i_name=" + i_name + ", i_money=" + i_money + ", i_fix="
				+ i_fix + ", i_memo=" + i_memo + ", i_regdate=" + i_regdate + ", i_modidate=" + i_modidate + "]";
	}
	
	
	


}
