package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.AdoptionListDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.DogReviewDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.dto.ShopReviewDto;

public interface MyPageDao {

	public List<AdoptionListDto> myadoptionSelect(String memberId);
	
	public void myAdoptionDelete(int aaKey);
	
	public void adoptionReviewRegister(DogReviewDto dogReview);
	
	public void reviewFileInsert(Map<String, String> fmap);
	
	public void pictureDelete(int drNum);
	
	public void reviewFileUpdate(DogReviewDto rDto);
	
	public DogReviewDto adoptionReviewWrite(int dogNum);
	
	public DogReviewDto myContentsUpdate(int drNum);
	
	public List<DFilePicture> pictureUpdate(int drNum);
	
	public List<DFilePicture> reviewFileSelect(int drNum);
	
	public List<DogReviewDto> adoptionreviewlist();
	
	public void reviewFileDelete(String sysname);
	
	public void adoptionReviewSetUpdate(DogReviewDto rDto);
	
	public void reviewDelete(int drNum);

	public List<DogReviewDto> mycontentslist(String memberId);

	public MemberDto getMemberInformation(String memberId);

	public void adoptionStatus(int dogNum);

	public List<ShopReviewDto> shopMyContentsList(String memberId);

	public ShopReviewDto productReviewUpdate(int srnum);

	public void productReviewUpdateProc(ShopReviewDto sDto);
}
