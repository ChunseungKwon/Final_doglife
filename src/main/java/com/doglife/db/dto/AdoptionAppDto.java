package com.doglife.db.dto;

import lombok.Data;

@Data
public class AdoptionAppDto {
	private int aaKey;
	private String aaName;
	private String aaAddress;
	private String aaPnum;
	private String aaStatus;
	private int dogNum;
	private String aaPayDate;
	private String aaPayNo;
	private String memberId;
	private int dogPrice;
	private String drStatus;
}
