package com.jsr.project.dtos;

import java.util.Date;

public class ProductDto {
	
	private int pro_seq;
	private String id;
	private int pro_num;
	private int pro_count;
	private Date pro_regDate;
	private String pro_qr;
	private String pro_qruse;
	private RewardDto r_name;
	private RewardDto r_point;
	private RewardDto r_file;
	
	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDto(int pro_seq, String id, int pro_num, int pro_count, Date pro_regDate, String pro_qr,
			String pro_qruse, RewardDto r_name, RewardDto r_point, RewardDto r_file) {
		super();
		this.pro_seq = pro_seq;
		this.id = id;
		this.pro_num = pro_num;
		this.pro_count = pro_count;
		this.pro_regDate = pro_regDate;
		this.pro_qr = pro_qr;
		this.pro_qruse = pro_qruse;
		this.r_name = r_name;
		this.r_point = r_point;
		this.r_file = r_file;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getPro_count() {
		return pro_count;
	}
	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}
	public Date getPro_regDate() {
		return pro_regDate;
	}
	public void setPro_regDate(Date pro_regDate) {
		this.pro_regDate = pro_regDate;
	}
	public String getPro_qr() {
		return pro_qr;
	}
	public void setPro_qr(String pro_qr) {
		this.pro_qr = pro_qr;
	}
	public String getPro_qruse() {
		return pro_qruse;
	}
	public void setPro_qruse(String pro_qruse) {
		this.pro_qruse = pro_qruse;
	}
	public RewardDto getR_name() {
		return r_name;
	}
	public void setR_name(RewardDto r_name) {
		this.r_name = r_name;
	}
	public RewardDto getR_point() {
		return r_point;
	}
	public void setR_point(RewardDto r_point) {
		this.r_point = r_point;
	}
	public RewardDto getR_file() {
		return r_file;
	}
	public void setR_file(RewardDto r_file) {
		this.r_file = r_file;
	}
	@Override
	public String toString() {
		return "ProductDto [pro_seq=" + pro_seq + ", id=" + id + ", pro_num=" + pro_num + ", pro_count=" + pro_count
				+ ", pro_regDate=" + pro_regDate + ", pro_qr=" + pro_qr + ", pro_qruse=" + pro_qruse + ", r_name="
				+ r_name + ", r_point=" + r_point + ", r_file=" + r_file + "]";
	}
	
	
}
