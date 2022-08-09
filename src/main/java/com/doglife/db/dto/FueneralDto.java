package com.doglife.db.dto;

import lombok.Data;

@Data
public class FueneralDto {
	private int frNum;
	private String frDate;
	private String frTime;
	private String frDogName;
	private String frGuardian;
	private String frPnum;
	private String frAddr;
	private int frWeight;
	private int frPeople;
	private int frPrice;
	private String frServiceName;
	private String frPayDate;
	private String frPayNo;
	private String memberId;
	
	private String frState;	// 출력일 기준 예약일이 이전이면 THE_END 이고 , 이후이면 FR_END
		
	
}
