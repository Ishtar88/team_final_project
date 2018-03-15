package com.jsr.project.dtos;

import java.util.Date;

public class MembersDto {
	
	private String id;
	private String m_name;
	private String m_email;
	private String m_password;
	private String m_phone;
	private String m_birthDate;
	private String m_profile_img;
	private int m_age;
	private String m_gender;
	private String m_grade;
	private String m_address;
	private String m_job;
	private Date m_regDate;
	private Date m_goalDate;
	private String m_useable;
	private String m_mariable;
	private String m_favorite;
	private PointDto po_point;
	
	public PointDto getPo_point() {
		return po_point;
	}
	public void setPo_point(PointDto po_point) {
		this.po_point = po_point;
	}
	public MembersDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MembersDto(String id, String m_name, String m_email, String m_password, String m_phone, String m_birthDate,
			String m_profile_img, int m_age, String m_gender, String m_grade, String m_address, String m_job,
			Date m_regDate, Date m_goalDate, String m_useable, String m_mariable, String m_favorite) {
		super();
		this.id = id;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_password = m_password;
		this.m_phone = m_phone;
		this.m_birthDate = m_birthDate;
		this.m_profile_img = m_profile_img;
		this.m_age = m_age;
		this.m_gender = m_gender;
		this.m_grade = m_grade;
		this.m_address = m_address;
		this.m_job = m_job;
		this.m_regDate = m_regDate;
		this.m_goalDate = m_goalDate;
		this.m_useable = m_useable;
		this.m_mariable = m_mariable;
		this.m_favorite = m_favorite;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_birthDate() {
		return m_birthDate;
	}
	public void setM_birthDate(String m_birthDate) {
		this.m_birthDate = m_birthDate;
	}
	public String getM_profile_img() {
		return m_profile_img;
	}
	public void setM_profile_img(String m_profile_img) {
		this.m_profile_img = m_profile_img;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_job() {
		return m_job;
	}
	public void setM_job(String m_job) {
		this.m_job = m_job;
	}
	public Date getM_regDate() {
		return m_regDate;
	}
	public void setM_regDate(Date m_regDate) {
		this.m_regDate = m_regDate;
	}
	public Date getM_goalDate() {
		return m_goalDate;
	}
	public void setM_goalDate(Date m_goalDate) {
		this.m_goalDate = m_goalDate;
	}
	public String getM_useable() {
		return m_useable;
	}
	public void setM_useable(String m_useable) {
		this.m_useable = m_useable;
	}
	public String getM_mariable() {
		return m_mariable;
	}
	public void setM_mariable(String m_mariable) {
		this.m_mariable = m_mariable;
	}
	public String getM_favorite() {
		return m_favorite;
	}
	public void setM_favorite(String m_favorite) {
		this.m_favorite = m_favorite;
	}
	@Override
	public String toString() {
		return "MembersDto [id=" + id + ", m_name=" + m_name + ", m_email=" + m_email + ", m_password=" + m_password
				+ ", m_phone=" + m_phone + ", m_birthDate=" + m_birthDate + ", m_profile_img=" + m_profile_img
				+ ", m_age=" + m_age + ", m_gender=" + m_gender + ", m_grade=" + m_grade + ", m_address=" + m_address
				+ ", m_job=" + m_job + ", m_regDate=" + m_regDate + ", m_goalDate=" + m_goalDate + ", m_useable="
				+ m_useable + ", m_mariable=" + m_mariable + ", m_favorite=" + m_favorite + ", po_point=" + po_point
				+ "]";
	}

	
	

}
