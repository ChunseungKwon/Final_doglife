package com.doglife.db.dao;

import java.util.List;

import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MySupportDto;

public interface SupportDao {

	public List<FaqDto> faqselect();

	// 1대1 문의-삽입
	public void mysupportInsert(MySupportDto msDto);

	// 1대1 문의 - 불러오기
	public List<MySupportDto> indiselect(String memberId);

	// 1대1 문의 - 관리자 리스트보기 (관리자)
	public MySupportDto anyindiselect(int msNum);

	public void supdelete(MySupportDto sDto);
}
