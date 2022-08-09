package com.doglife.db.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ShopReplyDto {
	private int rrNum;
	private String rrContent;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp rrDate;
	private String memberId;
	private int srNum;
}
