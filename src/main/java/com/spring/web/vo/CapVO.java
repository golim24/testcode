package com.spring.web.vo;

public class CapVO {
	private String symbol;
	private String name;
	private String sector;
	private String market;
	private long cap;
	private int endprice;
	
	public CapVO() {
		// TODO Auto-generated constructor stub
	}

	public CapVO(String symbol, String name, String sector, String market, long cap, int endprice) {
		super();
		this.symbol = symbol;
		this.name = name;
		this.sector = sector;
		this.market = market;
		this.cap = cap;
		this.endprice = endprice;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public long getCap() {
		return cap;
	}

	public void setCap(long cap) {
		this.cap = cap;
	}

	public int getEndprice() {
		return endprice;
	}

	public void setEndprice(int endprice) {
		this.endprice = endprice;
	}

	@Override
	public String toString() {
		return "CapVO [symbol=" + symbol + ", name=" + name + ", sector=" + sector + ", market=" + market + ", cap="
				+ cap + ", endprice=" + endprice + "]";
	}
	
	

}
