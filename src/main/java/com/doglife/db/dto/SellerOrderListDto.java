package com.doglife.db.dto;

import java.sql.Date;

import com.google.protobuf.Timestamp;

import lombok.Data;



@Data
public class SellerOrderListDto {

	private String sellerID;
	private int orderNum;
	private String memberId;
	private int pnum;
	private String productName;
	private int orderPrice;
	private int earnedPoint;
	private int orderQuantity;
	private String orderOption;
	private String orderStatus;
	private Date orderDate;
	private String thumbnail;
	private String thumbsysname;
}