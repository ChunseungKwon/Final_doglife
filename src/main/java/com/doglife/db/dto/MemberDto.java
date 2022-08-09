package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberAddr;
	private String memberPnum;
	private String memberBdate;
	private String memberType;
	private Timestamp regDate;
	private int memberPoint;
	private String licenseNum;
}

