package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MySupportDto {
	private int msNum;
	private String msTitle;
	private String msQuestion;
	private String msType;
	private Timestamp qdate;
	private Timestamp aDate;
	private String msAnswer;
	private String memberId;
	private String memberPnum;
	private String memberName;	
	private String msStatus;
}
