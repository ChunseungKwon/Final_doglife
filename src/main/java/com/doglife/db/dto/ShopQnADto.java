package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class ShopQnADto {
	private int sqnum;
	private String sqquestion;
	private String sqanswer;
	private String sqstatus;
	private Timestamp qdate;
	private Timestamp adate;
	private int pnum;
	private String memberId;
	private String sellerID;
}
