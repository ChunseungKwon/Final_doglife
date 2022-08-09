package com.doglife.db.dto;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class MyOrderDto {
	private int orderNum;
	private String orderStatus;
	private String productName;
	private String orderOption;
	private int orderQuantity;
	private int orderPrice;
	private int earnedPoint;
	private String paymentId;
	private Timestamp orderDate;
	private int pnum;
	private String memberId;
}
