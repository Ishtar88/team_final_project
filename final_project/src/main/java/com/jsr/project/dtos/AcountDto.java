package com.jsr.project.dtos;

public class AcountDto {
	
	private int ac_money;
	
	private int f_seq;
	
	private int s_seq;
	
	private int l_seq;
	
	private int st_seq;
	
	private String id;

	public int getAc_money() {
		return ac_money;
	}

	public void setAc_money(int ac_money) {
		this.ac_money = ac_money;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getL_seq() {
		return l_seq;
	}

	public void setL_seq(int l_seq) {
		this.l_seq = l_seq;
	}

	public int getSt_seq() {
		return st_seq;
	}

	public void setSt_seq(int st_seq) {
		this.st_seq = st_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AcountDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AcountDto(int ac_money, int f_seq, int s_seq, int l_seq, int st_seq, String id) {
		super();
		this.ac_money = ac_money;
		this.f_seq = f_seq;
		this.s_seq = s_seq;
		this.l_seq = l_seq;
		this.st_seq = st_seq;
		this.id = id;
	}

	@Override
	public String toString() {
		return "AcountDto [ac_money=" + ac_money + ", f_seq=" + f_seq + ", s_seq=" + s_seq + ", l_seq=" + l_seq
				+ ", st_seq=" + st_seq + ", id=" + id + "]";
	}

	
	
	
}
