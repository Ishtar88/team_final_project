package com.jsr.project.dtos;

public class AcountPatternDto {
	
	private String id;
	
	private String name;
	
	private String detail;
	
	private int money;
	
	private float rate;
	
	private float re;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public float getRe() {
		return re;
	}

	public void setRe(float re) {
		this.re = re;
	}

	public AcountPatternDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AcountPatternDto(String id, String name, String detail, int money, float rate, float re) {
		super();
		this.id = id;
		this.name = name;
		this.detail = detail;
		this.money = money;
		this.rate = rate;
		this.re = re;
	}

	@Override
	public String toString() {
		return "AcountPatternDto [id=" + id + ", name=" + name + ", detail=" + detail + ", money=" + money + ", rate="
				+ rate + ", re=" + re + "]";
	}
	
	

}
