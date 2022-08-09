package com.doglife.db.dto;

import lombok.Data;

@Data
public class ListDto {
	private String colname;//board title or board contents save
	private String keyword;//Keyword for searching
	private int pageNum; //Page Number
	private int listCnt; //Number of posts per page
	private String memberId;
}
