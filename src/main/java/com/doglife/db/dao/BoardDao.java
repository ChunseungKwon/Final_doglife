package com.doglife.db.dao;

import java.util.List;

import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.ListDto;

public interface BoardDao {

	public List<BoardDto> boardListSelect(ListDto list);

	public int boardCountSelect(ListDto list);

	public BoardDto noticeContents(int anum);

	public void viewsUpdate(int anum);

	public String getPreviousPage(int pNum);

	public String getNextPage(int pNum);

	public Integer getPreviousPageNum(int pNum);

	public Integer getNextPageNum(int pNum);
	
	
}
