package com.doglife.db.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ShopReviewDto {
	private int srnum;
	private String srtitle;
	private String srcontent;
	private float srRate;
	private String sysname;
	private String oriname;
	private int pnum;
	private String memberId;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regDate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp editDate;	
}
