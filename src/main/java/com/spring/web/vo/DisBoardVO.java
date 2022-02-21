package com.spring.web.vo;

public class DisBoardVO {
	private int seq;//0
	private String Id;
	private String content;
    private String succStory;
    private String recoStock;
    private int cnt;
    private int curPage;
    private int replyCnt;
    
    private int startList;
    private int listSize;
    
    private String key;  
    private String word;
    
    private String searchType;
    private String searchKeyword;

    
    public DisBoardVO() {
	}


	public DisBoardVO(int seq, String id, String content, String succStory, String recoStock, int cnt, int curPage,
			int replyCnt, int startList, int listSize, String key, String word, String searchType,
			String searchKeyword) {
		super();
		this.seq = seq;
		Id = id;
		this.content = content;
		this.succStory = succStory;
		this.recoStock = recoStock;
		this.cnt = cnt;
		this.curPage = curPage;
		this.replyCnt = replyCnt;
		this.startList = startList;
		this.listSize = listSize;
		this.key = key;
		this.word = word;
		this.searchType = searchType;
		this.searchKeyword = searchKeyword;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getId() {
		return Id;
	}


	public void setId(String id) {
		Id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSuccStory() {
		return succStory;
	}


	public void setSuccStory(String succStory) {
		this.succStory = succStory;
	}


	public String getRecoStock() {
		return recoStock;
	}


	public void setRecoStock(String recoStock) {
		this.recoStock = recoStock;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getReplyCnt() {
		return replyCnt;
	}


	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}


	public int getStartList() {
		return startList;
	}


	public void setStartList(int startList) {
		this.startList = startList;
	}


	public int getListSize() {
		return listSize;
	}


	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public String getWord() {
		return word;
	}


	public void setWord(String word) {
		this.word = word;
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	@Override
	public String toString() {
		return "DisBoardVO [seq=" + seq + ", Id=" + Id + ", content=" + content + ", succStory=" + succStory
				+ ", recoStock=" + recoStock + ", cnt=" + cnt + ", curPage=" + curPage + ", replyCnt=" + replyCnt
				+ ", startList=" + startList + ", listSize=" + listSize + ", key=" + key + ", word=" + word
				+ ", searchType=" + searchType + ", searchKeyword=" + searchKeyword + "]";
	}

    
}
