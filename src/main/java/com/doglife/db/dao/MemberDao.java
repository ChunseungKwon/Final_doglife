package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

public interface MemberDao {
	//회원가입
		public void memberInsert(MemberDto member);
		//ID중복체크
		public int idCheck(String memberId);
		//ID 찾기(로그인)
		public String idsearch(MemberDto member);
		//로그인
		public String pwdSelect(String memberId);
		//회원정보 불러오기
		public MemberDto memberSelect(String memberId);
		//ID찾기(ID찾기위함)
		@Select("select IFNULL(memberId,0) from memberTable where memberName=#{memberName} and memberPnum=#{memberPnum}")
		public String find_id(@Param("memberName") String memberName, @Param("memberPnum") String memberPnum);
		//회원조회
		public MemberDto find_pwd(String memberId);
		//비밀번호 재설정
		public int updatePwd(MemberDto mDto); 
		//재설정한 비밀번호 넣기
		public void updateinPwd(String memberPwd);
		//수정-아이디에 맞는 정보 가져오기
		public MemberDto upmemberSelect(String memberId);
		//수정-회원정보 수정
		public int updateadm(MemberDto mDto);
		//수정-회원정보 수정2
		public void updateinadm1(MemberDto mDto);
		//탈퇴-회원탈퇴
		public void deletead(String memberId);
		//타입 구분
		public String typecheck(String memberId);


	
}
