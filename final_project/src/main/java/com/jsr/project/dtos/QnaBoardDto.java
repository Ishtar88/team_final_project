package com.jsr.project.dtos;

import java.util.Date;

public class QnaBoardDto {
	
	private int q_seq;
	private String id; 
	private String q_name;
	private String q_title; 
	private String q_content; 
	private Date q_regDate; 
	private int q_refer; 
	private int q_step;
	private int q_depth; 
	private int q_readcount; 
	private String q_delflag; 
	private String q_viewable;
	
	
	public QnaBoardDto() {
		super();
	}
	
	
	public QnaBoardDto(int q_seq, String id, String q_name, String q_title, String q_content, Date q_regDate,
			int q_refer, int q_step, int q_depth, int q_readcount, String q_delflag, String q_viewable) {
		super();
		this.q_seq = q_seq;
		this.id = id;
		this.q_name = q_name;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_regDate = q_regDate;
		this.q_refer = q_refer;
		this.q_step = q_step;
		this.q_depth = q_depth;
		this.q_readcount = q_readcount;
		this.q_delflag = q_delflag;
		this.q_viewable = q_viewable;
	}
	@Override
	public String toString() {
		return "qnaBoardDto [q_seq=" + q_seq + ", id=" + id + ", q_name=" + q_name + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", q_regDate=" + q_regDate + ", q_refer=" + q_refer + ", q_step=" + q_step
				+ ", q_depth=" + q_depth + ", q_readcount=" + q_readcount + ", q_delflag=" + q_delflag + ", q_viewable="
				+ q_viewable + "]";
	}
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_regDate() {
		return q_regDate;
	}
	public void setQ_regDate(Date q_regDate) {
		this.q_regDate = q_regDate;
	}
	public int getQ_refer() {
		return q_refer;
	}
	public void setQ_refer(int q_refer) {
		this.q_refer = q_refer;
	}
	public int getQ_step() {
		return q_step;
	}
	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}
	public int getQ_depth() {
		return q_depth;
	}
	public void setQ_depth(int q_depth) {
		this.q_depth = q_depth;
	}
	public int getQ_readcount() {
		return q_readcount;
	}
	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}
	public String getQ_delflag() {
		return q_delflag;
	}
	public void setQ_delflag(String q_delflag) {
		this.q_delflag = q_delflag;
	}
	public String getQ_viewable() {
		return q_viewable;
	}
	public void setQ_viewable(String q_viewable) {
		this.q_viewable = q_viewable;
	} 

	
	
	
}
