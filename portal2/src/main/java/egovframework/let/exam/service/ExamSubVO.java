package egovframework.let.exam.service;

import java.io.Serializable;

public class ExamSubVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	/** 현재 페이지*/
	private int pageIndex = 1;
	
	/** 페이지 갯수*/
	private int pageUnit = 10;
	
	/** 페이지 사이즈*/
	private int pageSize = 10;
	
	/** firstIndex*/
	private int firstIndex = 1;
	
	/** lastIndex*/
	private int lastIndex = 1;
	
	/** recordCountPerPage*/
	private int recordCountPerPage = 10;
	
	/** 검색조건*/
	private String searchCondition = "";
	
	/** 검색 키워드*/
	private String searchKeyword = "";
	
	/** 검색 사용여부*/
	private String searchUseYn = "";
	

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
}
