package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DogReviewDto {
	private int drNum;
	private String drTitle;
	private String drContent;
	private Timestamp regDate;
	private Timestamp editDate;
	private String memberId;
	private int dogNum;
	private String thumbnail;
	private String thumbnailsys;
}
