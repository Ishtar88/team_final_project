//is this possible??
//why i can't write in Korean :( github you suck!!! 

package com.jsr.project.dtos;

import java.util.Date;

public class NoticeBoardDto {
	
	private int n_seq;
	private String id;
	private String n_title;
	private String n_content;
	private Date n_regDate;
	private int n_readcount;
	private String n_delflag;
	
	private String snum;
	private String ennum;
	
	
	public String getSnum() {
		return snum;
	}


	public void setSnum(String snum) {
		this.snum = snum;
	}


	public String getEnnum() {
		return ennum;
	}


	public void setEnnum(String ennum) {
		this.ennum = ennum;
	}


	public NoticeBoardDto() {
		super();
	}
	
	
	public NoticeBoardDto(int n_seq, String id, String n_title, String n_content, Date n_regDate, int n_readcount,
			String n_delflag) {
		super();
		this.n_seq = n_seq;
		this.id = id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regDate = n_regDate;
		this.n_readcount = n_readcount;
		this.n_delflag = n_delflag;
	}
	
	
	
	@Override
	public String toString() {
		return "NoticeBoardDto [n_seq=" + n_seq + ", id=" + id + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", n_regDate=" + n_regDate + ", n_readcount=" + n_readcount + ", n_delflag=" + n_delflag + "]";
	}
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getn_regDate() {
		return n_regDate;
	}
	public void setn_regDate(Date n_regDate) {
		this.n_regDate = n_regDate;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	public String getN_delflag() {
		return n_delflag;
	}
	public void setN_delflag(String n_delflag) {
		this.n_delflag = n_delflag;
	}
	
	
	

}
