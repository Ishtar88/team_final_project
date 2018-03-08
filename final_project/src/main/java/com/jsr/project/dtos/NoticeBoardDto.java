package com.jsr.project.dtos;

import java.util.Date;

public class NoticeBoardDto {
	
	private int n_seq;
	private String id;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private int n_readcount;
	private String n_delflag;
	
	public NoticeBoardDto() {
		super();
	}
	
	
	public NoticeBoardDto(int n_seq, String id, String n_title, String n_content, Date n_regdate, int n_readcount,
			String n_delflag) {
		super();
		this.n_seq = n_seq;
		this.id = id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regdate = n_regdate;
		this.n_readcount = n_readcount;
		this.n_delflag = n_delflag;
	}
	
	
	
	@Override
	public String toString() {
		return "NoticeBoardDto [n_seq=" + n_seq + ", id=" + id + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", n_regdate=" + n_regdate + ", n_readcount=" + n_readcount + ", n_delflag=" + n_delflag + "]";
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
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
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
