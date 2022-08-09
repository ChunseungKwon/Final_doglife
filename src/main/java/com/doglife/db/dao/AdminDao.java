package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.AdoptionListDto;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.DogRecommendDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;

public interface AdminDao {
	
	public List<MemberDto> adminCustomerList();

	public List<MemberDto> memberSelect(ListDto list);

	public void customerDelete(MemberDto member);

	public List<AdoptionListDto> getDoginform();

	public String getCustomerId(int dogNum);

	public List<DFilePicture> getDogPicture(int dogNum);

	public List<DogDto> getDogInfo(int dogNum);

	public List<MemberDto> getCustomerInfo(String memberId);

	public void adoptionDecline(int dogNum);

	public void adoptionApprove(int dogNum);

	public List<FueneralDto> frProgress(String frStatus);

	public List<FueneralDto> frOver(String frStatus);

	public FueneralDto frInfo(int frNum);
	
	public void adoptionReRegister(int dogNum);

	public DogDto adoptionReRegisterSel(int dogNum);

	public List<DFilePicture> adoptionReRegisterPic(int dogNum);

	public List<AdoptionListDto> adminApplicationList(AdoptionAppDto apDto);

	public AdoptionListDto adminAdoptionAppInfo(int aaKey);

	public AdoptionAppDto adminAdoptionAppInfo2(int aaKey);

	public List<DFilePicture> adminAdoptionAppInfo3(int dogNum);
	
	public void adminApplicationOk(AdoptionAppDto appDto);

	public void ListDelete(int dogNum);

	public void AdoptionInfoUpdate(DogDto dogDto);

	public void fileInsert(Map<String, String> fmap);

	public void dFileUpdate(DogDto dogDto);

	public void dFileReset(DogDto dogDto);

	public DFilePicture dPicSelect(DogDto dogDto);

	public void dFileUpload(DFilePicture dPic);

	public void dogFileDelete(String sysname);

	public List<DFilePicture> dogFileSelect(int dogNum);
	
	public void faqinsert(FaqDto fDto);
	//faq 업데이트
	public void faqupdate(FaqDto faqNum);
	//faq 삭제
	public void faqdeletee(FaqDto faqNum);

	public List<FaqDto> faqselect();
	//1대1 문의 - 삭제 (관리자)
	public void supdelete(MySupportDto sDto);
	//1대1 문의 - 개별 
	public MySupportDto anyindiselect(int msNum);
	//1대1 문의 - 등록 (관리자)
	public void regianwer(MySupportDto sDto);

	public List<BoardDto> showAdminNotice(BoardDto anDto);
	
	public List<DogRecommendDto> selectdogBreed();

	public void adminAnnouncementInsert(BoardDto anDto);

	public BoardDto showNoticeUpdate(int anum);

	public List<BoardDto> noticeSelect();

	public void noticeUpdateT(BoardDto anDto);

	public void dogRegisterInsert(DogDto dogRegister);

	public void NoticeDelete(int anum);

	public List<MySupportDto> indiselect();

	public List<MemberDto> adminSellerList();

	public void adminAppDog(AdoptionAppDto appDto);
	
}
