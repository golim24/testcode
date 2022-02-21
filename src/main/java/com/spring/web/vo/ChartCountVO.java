package com.spring.web.vo;

public class ChartCountVO {
	private int upthree;
	private int uptwo;
	private int upone;
	private int downthree;
	private int downtwo;
	private int downone;
	
	public ChartCountVO() {
		// TODO Auto-generated constructor stub
	}

	public ChartCountVO(int upthree, int uptwo, int upone, int downthree, int downtwo, int downone) {
		super();
		this.upthree = upthree;
		this.uptwo = uptwo;
		this.upone = upone;
		this.downthree = downthree;
		this.downtwo = downtwo;
		this.downone = downone;
	}

	public int getUpthree() {
		return upthree;
	}

	public void setUpthree(int upthree) {
		this.upthree = upthree;
	}

	public int getUptwo() {
		return uptwo;
	}

	public void setUptwo(int uptwo) {
		this.uptwo = uptwo;
	}

	public int getUpone() {
		return upone;
	}

	public void setUpone(int upone) {
		this.upone = upone;
	}

	public int getDownthree() {
		return downthree;
	}

	public void setDownthree(int downthree) {
		this.downthree = downthree;
	}

	public int getDowntwo() {
		return downtwo;
	}

	public void setDowntwo(int downtwo) {
		this.downtwo = downtwo;
	}

	public int getDownone() {
		return downone;
	}

	public void setDownone(int downone) {
		this.downone = downone;
	}

	@Override
	public String toString() {
		return "chartCountVO [upthree=" + upthree + ", uptwo=" + uptwo + ", upone=" + upone + ", downthree=" + downthree
				+ ", downtwo=" + downtwo + ", downone=" + downone + "]";
	}
	
	
}
