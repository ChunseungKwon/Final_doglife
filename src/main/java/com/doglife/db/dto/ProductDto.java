package com.doglife.db.dto;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class ProductDto {
	private int pnum;
	private String pname;
	private int pprice;
	private int ppoint;
	private String pinfo;
	private int pquantity;
	private double pavg;
	private String pcategory;
	private int soldCnt;
	private String sellerID;
	private int reviewCnt;
	private Timestamp regDate;
	private String thumbnail;
	private String thumbsysname;
	
}
