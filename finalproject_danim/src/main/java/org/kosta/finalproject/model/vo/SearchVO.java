package org.kosta.finalproject.model.vo;

public class SearchVO {
	private int rownum;
	private String searchWord;
	public SearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchVO(int rownum, String searchWord) {
		super();
		this.rownum = rownum;
		this.searchWord = searchWord;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return "SearchVO [rownum=" + rownum + ", searchWord=" + searchWord
				+ "]";
	}
	
}
