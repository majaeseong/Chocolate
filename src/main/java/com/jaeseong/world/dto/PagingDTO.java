package com.jaeseong.world.dto;

public class PagingDTO {
	private int startNum, offset;
	private String keyword, sortby;

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getSortby() {
		return sortby;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
