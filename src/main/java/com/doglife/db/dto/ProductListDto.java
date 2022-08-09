package com.doglife.db.dto;

import lombok.Data;

@Data
public class ProductListDto {
	private String category;
	private int pageNum;
	private int listCnt;
}
