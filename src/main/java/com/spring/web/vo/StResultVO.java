package com.spring.web.vo;

import java.sql.Date;

public class StResultVO {
	private int seq;
	private String symbol;
	private String name;
	private String sector;
	private int startprice;
	private int endprice;
	private double percent;
	private String fluctuate;
	private Date date;
	
	public StResultVO() {
		// TODO Auto-generated constructor stub
	}

	public StResultVO(int seq, String symbol, String name, String sector, int startprice, int endprice, double percent,
			String fluctuate, Date date) {
		super();
		this.seq = seq;
		this.symbol = symbol;
		this.name = name;
		this.sector = sector;
		this.startprice = startprice;
		this.endprice = endprice;
		this.percent = percent;
		this.fluctuate = fluctuate;
		this.date = date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public int getStartprice() {
		return startprice;
	}

	public void setStartprice(int startprice) {
		this.startprice = startprice;
	}

	public int getEndprice() {
		return endprice;
	}

	public void setEndprice(int endprice) {
		this.endprice = endprice;
	}

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public String getFluctuate() {
		return fluctuate;
	}

	public void setFluctuate(String fluctuate) {
		this.fluctuate = fluctuate;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "StResultVO [seq=" + seq + ", symbol=" + symbol + ", name=" + name + ", sector=" + sector
				+ ", startprice=" + startprice + ", endprice=" + endprice + ", percent=" + percent + ", fluctuate="
				+ fluctuate + ", date=" + date + "]";
	}
	
}
