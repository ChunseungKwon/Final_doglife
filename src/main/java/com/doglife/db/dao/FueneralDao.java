package com.doglife.db.dao;

import java.util.List;

import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;

public interface FueneralDao {
	public void fueneralInsert(FueneralDto fdto);

	public FueneralDto selectReInfo(int frNum);
	
	public FueneralDto selectExistReserv(String memberId);
	//예약번호로 예약내역조회
//	public FueneralDto selectR_F_List(String memberId);
	
	public void fueneralDelete(int frNum);
	
	public List<String> fr_time_select(String date);
	
	public List<FueneralDto> fr_My_list(ListDto list);

	public void frPayUpdate(FueneralDto fdto);

	public int boardCountSelect(String memberId);


}
