package com.doglife.db.dto;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class MyCartDto {

	private int orderNum;
	private String orderStatus;
	private String productName;
	private String orderOption;
	private int orderQuantity;
	private int orderPrice;
	private int earnedPoint;
	private Timestamp orderDate;
	private int pnum;
	private String memberId;
	private String thumbnail;
	private String thumbsysname;
}
