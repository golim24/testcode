package com.spring.web.vo;

public class CommentVO {

	private int cseq;
    private String title;
    private String writer;
    private String regDate;
    private int bseq;
    
    public CommentVO() {
	}

	public CommentVO(int cseq, String title, String writer, String regDate, int bseq) {
		super();
		this.cseq = cseq;
		this.title = title;
		this.writer = writer;
		this.regDate = regDate;
		this.bseq = bseq;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	@Override
	public String toString() {
		return "CommentVO [cseq=" + cseq + ", title=" + title + ", writer=" + writer + ", regDate=" + regDate
				+ ", bseq=" + bseq + "]";
	}
    
    
	
}
