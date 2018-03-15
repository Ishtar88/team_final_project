package com.jsr.project.dtos;

import java.util.Date;

public class SpendingDto {
	
	private int p_seq;
	
	private String id;
	
	private String p_name;
	
	private String p_detail;
	
	private String p_location;
	
	private Date p_regdate;
	
	private int p_money;
	
	private String p_some;
	
	private String p_cashable;
	
	private int p_card;

	private int p_sat;
	
	private int p_need;
	
	private int p_count;
	
	private int p_step;

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public String getP_location() {
		return p_location;
	}

	public void setP_location(String p_location) {
		this.p_location = p_location;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public int getP_money() {
		return p_money;
	}

	public void setP_money(int p_money) {
		this.p_money = p_money;
	}

	public String getP_some() {
		return p_some;
	}

	public void setP_some(String p_some) {
		this.p_some = p_some;
	}

	public String getP_cashable() {
		return p_cashable;
	}

	public void setP_cashable(String p_cashable) {
		this.p_cashable = p_cashable;
	}

	public int getP_card() {
		return p_card;
	}

	public void setP_card(int p_card) {
		this.p_card = p_card;
	}

	public int getP_sat() {
		return p_sat;
	}

	public void setP_sat(int p_sat) {
		this.p_sat = p_sat;
	}

	public int getP_need() {
		return p_need;
	}

	public void setP_need(int p_need) {
		this.p_need = p_need;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getP_step() {
		return p_step;
	}

	public void setP_step(int p_step) {
		this.p_step = p_step;
	}

	public SpendingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SpendingDto(int p_seq, String id, String p_name, String p_detail, String p_location, Date p_regdate,
			int p_money, String p_some, String p_cashable, int p_card, int p_sat, int p_need, int p_count, int p_step) {
		super();
		this.p_seq = p_seq;
		this.id = id;
		this.p_name = p_name;
		this.p_detail = p_detail;
		this.p_location = p_location;
		this.p_regdate = p_regdate;
		this.p_money = p_money;
		this.p_some = p_some;
		this.p_cashable = p_cashable;
		this.p_card = p_card;
		this.p_sat = p_sat;
		this.p_need = p_need;
		this.p_count = p_count;
		this.p_step = p_step;
	}

	@Override
	public String toString() {
		return "SpendingDto [p_seq=" + p_seq + ", id=" + id + ", p_name=" + p_name + ", p_detail=" + p_detail
				+ ", p_location=" + p_location + ", p_regdate=" + p_regdate + ", p_money=" + p_money + ", p_some="
				+ p_some + ", p_cashable=" + p_cashable + ", p_card=" + p_card + ", p_sat=" + p_sat + ", p_need="
				+ p_need + ", p_count=" + p_count + ", p_step=" + p_step + "]";
	}


	
}
