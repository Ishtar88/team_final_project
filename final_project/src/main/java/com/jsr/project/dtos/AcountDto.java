package com.jsr.project.dtos;

public class AcountDto {
	
	private int g_seq;
	private String id;
	private String g_name;
	private int g_money;
	private String g_memo;
	
	public AcountDto() {
		// TODO Auto-generated constructor stub
	}
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_money() {
		return g_money;
	}
	public void setG_money(int g_money) {
		this.g_money = g_money;
	}
	public String getG_memo() {
		return g_memo;
	}
	public void setG_memo(String g_memo) {
		this.g_memo = g_memo;
	}
	@Override
	public String toString() {
		return "AcountDto [g_seq=" + g_seq + ", id=" + id + ", g_name=" + g_name + ", g_money=" + g_money + ", g_memo="
				+ g_memo + "]";
	}
	public AcountDto(int g_seq, String id, String g_name, int g_money, String g_memo) {
		super();
		this.g_seq = g_seq;
		this.id = id;
		this.g_name = g_name;
		this.g_money = g_money;
		this.g_memo = g_memo;
	}
	
	

}
