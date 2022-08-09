package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DogRecommendDto {
	private int dogrecNum;
	private int fur;
	private int size;
	private int action;
	private String breed;
	private String oriname;
}
