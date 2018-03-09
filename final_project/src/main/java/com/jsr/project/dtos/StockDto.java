package com.jsr.project.dtos;

import java.util.Date;

public class StockDto {
	
	private String id;
	
	private int st_seq;
	
	private String st_name;
	
	private int st_count;
	
	private int st_money;
	
	private int st_inter;
	
	private int st_add;
	
	private Date st_buydate;
	
	private Date st_modidate;
	
	private Date st_selldate;
	
	private String st_sellable;
	
	private String st_memo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSt_seq() {
		return st_seq;
	}

	public void setSt_seq(int st_seq) {
		this.st_seq = st_seq;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public int getSt_count() {
		return st_count;
	}

	public void setSt_count(int st_count) {
		this.st_count = st_count;
	}

	public int getSt_money() {
		return st_money;
	}

	public void setSt_money(int st_money) {
		this.st_money = st_money;
	}

	public int getSt_inter() {
		return st_inter;
	}

	public void setSt_inter(int st_inter) {
		this.st_inter = st_inter;
	}

	public int getSt_add() {
		return st_add;
	}

	public void setSt_add(int st_add) {
		this.st_add = st_add;
	}

	public Date getSt_buydate() {
		return st_buydate;
	}

	public void setSt_buydate(Date st_buydate) {
		this.st_buydate = st_buydate;
	}

	public Date getSt_modidate() {
		return st_modidate;
	}

	public void setSt_modidate(Date st_modidate) {
		this.st_modidate = st_modidate;
	}

	public Date getSt_selldate() {
		return st_selldate;
	}

	public void setSt_selldate(Date st_selldate) {
		this.st_selldate = st_selldate;
	}

	public String getSt_sellable() {
		return st_sellable;
	}

	public void setSt_sellable(String st_sellable) {
		this.st_sellable = st_sellable;
	}

	public String getSt_memo() {
		return st_memo;
	}

	public void setSt_memo(String st_memo) {
		this.st_memo = st_memo;
	}

	public StockDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StockDto(String id, int st_seq, String st_name, int st_count, int st_money, int st_inter, int st_add,
			Date st_buydate, Date st_modidate, Date st_selldate, String st_sellable, String st_memo) {
		super();
		this.id = id;
		this.st_seq = st_seq;
		this.st_name = st_name;
		this.st_count = st_count;
		this.st_money = st_money;
		this.st_inter = st_inter;
		this.st_add = st_add;
		this.st_buydate = st_buydate;
		this.st_modidate = st_modidate;
		this.st_selldate = st_selldate;
		this.st_sellable = st_sellable;
		this.st_memo = st_memo;
	}

	@Override
	public String toString() {
		return "StockDto [id=" + id + ", st_seq=" + st_seq + ", st_name=" + st_name + ", st_count=" + st_count
				+ ", st_money=" + st_money + ", st_inter=" + st_inter + ", st_add=" + st_add + ", st_buydate="
				+ st_buydate + ", st_modidate=" + st_modidate + ", st_selldate=" + st_selldate + ", st_sellable="
				+ st_sellable + ", st_memo=" + st_memo + "]";
	}

	
	

}
