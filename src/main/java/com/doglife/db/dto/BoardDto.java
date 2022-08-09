package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int anum;
	private String memberId;
	private String atitle;
	private String acontent;
	private Timestamp regdate; 
	private Timestamp editdate;
	private String atype;
	private int views;
}
