package com.spring.web.vo;

public class PagingVO {

    private int listSize = 15;  //한 페이지당 보여질 리스트 개수
    private int rangeSize = 5;  //한 페이지 범위에 보여질 페이지의 개수 
    private int page;  //현재 목록의 페이지 번호
    private int range;  //각 페이지 범위 시작 번호
    private int listCnt;  //전체 개시물의 개수
    private int rangeCnt;  //전체 페이지 범의의 개수
    private int startPage;  //각 페이지 범위 시작 번호
    private int startList;  //게시판 시작번호
    private int endPage;  //각 페이지 범위 끝 번호
    private boolean prev;  //이전 페이지 여부
    private boolean next;  //다음 페이지 여부

       
    public PagingVO() {
	}

	public PagingVO(int listSize, int rangeSize, int page, int range, int listCnt, int rangeCnt, int startPage,
			int startList, int endPage, boolean prev, boolean next) {
		super();
		this.listSize = listSize;
		this.rangeSize = rangeSize;
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.rangeCnt = rangeCnt;
		this.startPage = startPage;
		this.startList = startList;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
	}

	@Override
	public String toString() {
		return "PagingVO [listSize=" + listSize + ", rangeSize=" + rangeSize + ", page=" + page + ", range=" + range
				+ ", listCnt=" + listCnt + ", rangeCnt=" + rangeCnt + ", startPage=" + startPage + ", startList="
				+ startList + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public void setRangeCnt(int rangeCnt) {
		this.rangeCnt = rangeCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void pageInfo(int page, int range, int listCnt) {
        this.page = page;
        this.range = range;
        this.listCnt = listCnt;
        //전체 페이지수
        this.rangeCnt = (int) Math.ceil((double)listCnt/listSize);
        //시작 페이지
        this.startPage = (range - 1) * rangeSize + 1 ;
        //끝 페이지
        this.endPage = range * rangeSize;
        //게시판 시작번호
        this.startList = (page - 1) * listSize;

        //이전 버튼 상태
        this.prev = range == 1 ? false : true;
        //다음 버튼 상태
        System.out.println("pageCnt>>>"+rangeCnt);
        System.out.println("endPage>>>"+endPage);
        this.next = endPage >= rangeCnt ? false : true;

        if (this.endPage >= this.rangeCnt) {

            this.endPage = this.rangeCnt;

            this.next = false;

        }

    }
	
}
