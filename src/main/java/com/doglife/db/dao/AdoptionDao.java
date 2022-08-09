package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.doglife.db.dto.DogRecommendDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.DogReviewDto;


public interface AdoptionDao {

	public List<DogRecommendDto> getBreedRecommend();
	
	public List<DogDto> adoptionListSelect(ListDto list);
	
	public int adoptionCountSelect(ListDto list);
	
	public List<DogReviewDto> getAdoptionReview(ListDto list);
	
	public int reviewCountSelect(ListDto list);

	public void adoptionReviewRegister(DogReviewDto dogReview);
	
	public void deleteAdoptionFile(Integer drNum);
	
	public void boardDelete(Integer drNum);

	public void fileInsert(Map<String, String> fmap);

	public DogReviewDto reviewSelect(Integer drNum);

	public void ReviewUpdate(DogReviewDto dReview);
	
	public List<DFilePicture> fileSelect(Integer drNum);

	public void fileDelete(String sysname);

	public List<DogRecommendDto> getbList();

	public List<DogDto> getdList(ListDto list);
	
	public List<DogDto> dogListSelect();

	public DogDto showDogInfo(int dogNum);

	public List<DFilePicture> dogpicSelect(int dogNum);

	public DogDto dogdSelect(int dogNum);
	
	public void dogStatusUpdate(int dogNum);

	public void userDogRegister(AdoptionAppDto appDto);

	public AdoptionAppDto selectAdoptionAppInfo(int aaKey);

	public void deleteAdoptionProc(int aaKey);

	public void updateDogStatus(int dogNum);
	
}
