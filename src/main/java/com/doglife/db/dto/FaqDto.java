package com.doglife.db.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FaqDto {
	private int faqNum;
	private String faqType;
	private String faqQuestion;
	private String faqAnswer;
	private Timestamp regDate;
	private Timestamp editDate;
}
