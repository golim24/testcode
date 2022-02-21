package com.spring.web.vo;

public class StBoardVO {
	private int seq;
    private String date;
    private String symbol;
    private String name;
    private String industry;
    private int sprice;
    private int eprice;
    private String techind;
    private int corppos;
    private String cnt;
    private int replycnt;
        
    public StBoardVO() {
	}


	public StBoardVO(int seq, String date, String symbol, String name, String industry, int sprice, int eprice,
			String techind, int corppos, String cnt, int replycnt) {
		super();
		this.seq = seq;
		this.date = date;
		this.symbol = symbol;
		this.name = name;
		this.industry = industry;
		this.sprice = sprice;
		this.eprice = eprice;
		this.techind = techind;
		this.corppos = corppos;
		this.cnt = cnt;
		this.replycnt = replycnt;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
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


	public String getIndustry() {
		return industry;
	}


	public void setIndustry(String industry) {
		this.industry = industry;
	}


	public int getSprice() {
		return sprice;
	}


	public void setSprice(int sprice) {
		this.sprice = sprice;
	}


	public int getEprice() {
		return eprice;
	}


	public void setEprice(int eprice) {
		this.eprice = eprice;
	}


	public String getTechind() {
		return techind;
	}


	public void setTechind(String techind) {
		this.techind = techind;
	}


	public int getCorppos() {
		return corppos;
	}


	public void setCorppos(int corppos) {
		this.corppos = corppos;
	}


	public String getCnt() {
		return cnt;
	}


	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	public int getReplycnt() {
		return replycnt;
	}


	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}


	@Override
	public String toString() {
		return "StBoardVO [seq=" + seq + ", date=" + date + ", symbol=" + symbol + ", name=" + name + ", industry="
				+ industry + ", sprice=" + sprice + ", eprice=" + eprice + ", techind=" + techind + ", corppos="
				+ corppos + ", cnt=" + cnt + ", replycnt=" + replycnt + "]";
	}
    
}
