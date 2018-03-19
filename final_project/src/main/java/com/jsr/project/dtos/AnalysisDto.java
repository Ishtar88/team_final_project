package com.jsr.project.dtos;

import java.util.Date;

public class AnalysisDto {
	
	private int a_seq;
	private String a_code;
	private String a_name;
	private String a_img;
	
	private int ma_seq;
	private String id;
	private Date ma_regDate;
	
	public AnalysisDto() {
		super();
	}
	public AnalysisDto(int a_seq, String a_code, String a_name, String a_img, int ma_seq, String id, Date ma_regDate) {
		super();
		this.a_seq = a_seq;
		this.a_code = a_code;
		this.a_name = a_name;
		this.a_img = a_img;
		this.ma_seq = ma_seq;
		this.id = id;
		this.ma_regDate = ma_regDate;
	}
	public int getA_seq() {
		return a_seq;
	}
	public void setA_seq(int a_seq) {
		this.a_seq = a_seq;
	}
	public String getA_code() {
		return a_code;
	}
	public void setA_code(String a_code) {
		this.a_code = a_code;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_img() {
		return a_img;
	}
	public void setA_img(String a_img) {
		this.a_img = a_img;
	}
	public int getMa_seq() {
		return ma_seq;
	}
	public void setMa_seq(int ma_seq) {
		this.ma_seq = ma_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getMa_regDate() {
		return ma_regDate;
	}
	public void setMa_regDate(Date ma_regDate) {
		this.ma_regDate = ma_regDate;
	}
	@Override
	public String toString() {
		return "AnalysisDto [a_seq=" + a_seq + ", a_code=" + a_code + ", a_name=" + a_name + ", a_img=" + a_img
				+ ", ma_seq=" + ma_seq + ", id=" + id + ", ma_regDate=" + ma_regDate + "]";
	}
	
	

}
