package com.doglife.db.dto;

import lombok.Data;

@Data
public class AdoptionListDto {
	private int aaKey;
	private String aaStatus;
	private String memberId;
	private int dogNum;
	private String dogName;
	private int dogAge;
	private String dogGender;
	private String dogBreed;
	private String dogVaccine;
	private int dogPrice;
	private String thumbnail;
	private String thumbnailsys;
	private String drStatus;
}
