package com.doglife.db.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.BoardDao;
import com.doglife.db.dao.MyPageDao;
import com.doglife.db.dto.AdoptionListDto;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogReviewDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.dto.ShopReviewDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class MyPageService {

	private ModelAndView mv;
	@Autowired
	private MyPageDao mpDao;
	
	public ModelAndView mypageupdate2(HttpSession session) {
		mv = new ModelAndView();
		
		String memberId = (String) session.getAttribute("memberId");
		
		MemberDto mDto = mpDao.getMemberInformation(memberId);
		
		mv.addObject("mDto", mDto);
		
		mv.setViewName("mypage_update2");
		
		return mv;
	}

	// my페이지(입양신청현황)
	public ModelAndView myadoptionSelect(String memberId) {
		mv = new ModelAndView();

		List<AdoptionListDto> adList = mpDao.myadoptionSelect(memberId);

		mv.addObject("adList", adList);

		mv.setViewName("myadoption");

		return mv;
	}

	// myAdoption(입양 취소)
	public String deleteMyAdoption(int aaKey) {
		String view = null;

		try {
			// 신청 삭제
			mpDao.myAdoptionDelete(aaKey);
			view = "redirect:/myadoption";

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/myadoption";
		}
		return view;
	}

	// 입양 후기 처음 등록
	public String adoptionReviewRegister(MultipartHttpServletRequest multi, RedirectAttributes rttr, boolean isDel) {
		log.info("serv.adoptionReviewRegister()");

		HttpSession session = multi.getSession();

		String view = null;
		String msg = null;

		String memberId = multi.getParameter("memberId");
		String title = multi.getParameter("drTitle");
		String contents = multi.getParameter("drContent");
		String fileCheck = multi.getParameter("fileCheck");
		
		
		int dogNum = Integer.parseInt(multi.getParameter("dogNum"));
		
		contents = contents.trim();

		DogReviewDto dogReview = new DogReviewDto();
		dogReview.setMemberId(memberId);
		dogReview.setDrTitle(title);
		dogReview.setDrContent(contents);
		dogReview.setDogNum(dogNum);

		try {

			mpDao.adoptionReviewRegister(dogReview);
			mpDao.adoptionStatus(dogNum);
			if (fileCheck.equals("1")) {
				ReviewSetFileUpload(multi, dogReview.getDogNum(), dogReview.getDrNum(), dogReview, false);

			}

			view = "redirect:/adoptionReview?pageNum=1";
			msg = "작성 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/";
			msg = "작성 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	private void ReviewSetFileUpload(MultipartHttpServletRequest multi, int dogNum, int drNum, DogReviewDto rDto,
			boolean isDel) throws IllegalStateException, IOException {
		String realPath = multi.getServletContext().getRealPath("/");

		realPath += "resources/upload/";
		log.info(realPath);

		File folder = new File(realPath);
		if (folder.isDirectory() == false) {
			folder.mkdir();
		}

		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("drNum", String.valueOf(drNum));
		fmap.put("dogNum", String.valueOf(dogNum));

		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String fn = files.next();
			String a = null;
			String b = null;

			List<MultipartFile> fList = multi.getFiles(fn);
			if (isDel == true) {
				mpDao.pictureDelete(drNum);
			}

			for (int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);
				String oriname = mf.getOriginalFilename();

				String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));
				if (i == 0) {
					a = oriname;
					b = sysname;
				}
				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);

				File ff = new File(realPath + sysname);
				mf.transferTo(ff);

				mpDao.reviewFileInsert(fmap);

			}

			rDto.setThumbnail(a);
			rDto.setThumbnailsys(b);

			mpDao.reviewFileUpdate(rDto);

		}

	}

	// 후기작성 페이지 이동
	public ModelAndView adoptionReviewWrite(HttpSession session, int dogNum) {
		mv = new ModelAndView();

		DogReviewDto drDto = mpDao.adoptionReviewWrite(dogNum);

		mv.addObject("drDto", drDto);

		mv.setViewName("adoptionReviewWrite");

		return mv;
	}

	// 후기 등록 후 페이지 이동
	public ModelAndView adoptionReviewList() {
		mv = new ModelAndView();

		List<DogReviewDto> rList = mpDao.adoptionreviewlist();
		mv.addObject("rList", rList);

		mv.setViewName("adoptionReviewList");

		return mv;

	}

	public ModelAndView adoptionReviewUpdate(int drNum) {
		mv = new ModelAndView();

		DogReviewDto Rdto = mpDao.myContentsUpdate(drNum);
		List<DFilePicture> fDto = mpDao.pictureUpdate(drNum);
		
		mv.addObject("rList", Rdto);
		mv.addObject("pList", fDto);

		mv.setViewName("adoptionReviewUpdate");

		return mv;
	}

	public Map<String, List<DFilePicture>> reviewFileDelete(String sysname, int drNum, HttpSession session) {
		Map<String, List<DFilePicture>> fMap = null;

		String realPath = session.getServletContext().getRealPath("/");
		realPath += "resources/upload/" + sysname;
		log.info(realPath);

		try {
			mpDao.reviewFileDelete(sysname);

			File file = new File(realPath);

			if (file.exists()) {
				if (file.delete()) {

					List<DFilePicture> fList = mpDao.reviewFileSelect(drNum);
					fMap = new HashMap<String, List<DFilePicture>>();
					fMap.put("AList", fList);
				} else {
					fMap = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			fMap = null;
		}

		return fMap;
	}

	// 후기 상세보기에서 사진 수정
	public String adoptionReviewSetUpdate(DogReviewDto rDto, RedirectAttributes rttr, int drNum, int dogNum,
			MultipartHttpServletRequest multi, boolean isDel) {
		String view = null;
		String msg = null;
		
		
		drNum = Integer.parseInt(multi.getParameter("drNum"));
		dogNum = Integer.parseInt(multi.getParameter("dogNum"));
		String drTitle = multi.getParameter("drTitle");
		String drContent = multi.getParameter("drContent");
		String check = multi.getParameter("fileCheck");

		rDto = new DogReviewDto();
		rDto.setDrTitle(drTitle);
		rDto.setDrContent(drContent);
		rDto.setDrNum(drNum);
		rDto.setDogNum(dogNum);

		try {
			mpDao.adoptionReviewSetUpdate(rDto);
			if (check.equals("1")) {
				ReviewSetFileUpload(multi, dogNum, drNum, rDto, true);
			}
			

			view = "redirect:/adoptionReview?pageNum=1";
			msg = "수정성공";

		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/adoptionReviewUpdate";
			msg = "수정실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	//입양 후기 삭제
	public String deleteReview(int drNum, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			mpDao.pictureDelete(drNum);
			mpDao.reviewDelete(drNum);
			view = "redirect:/myadoption";
			msg = "삭제 성공";
		} catch (Exception e) {
			view = "redirect:/adoptionReviewList";
			msg = "삭제 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public ModelAndView mycontentslist(String memberId, HttpSession session) {
		mv = new ModelAndView();

		if (memberId == null) {
			memberId = (String) session.getAttribute("memberId");
		}
		List<ShopReviewDto> Sdto = mpDao.shopMyContentsList(memberId);
		List<DogReviewDto> Rdto = mpDao.mycontentslist(memberId);

		mv.addObject("rList", Rdto);
		mv.addObject("pList", Sdto);
		mv.setViewName("mycontentslist");

		return mv;
	}
	
	public ModelAndView adoptionReviewupdatelogoff(int drNum) {
		mv = new ModelAndView();

		DogReviewDto Rdto = mpDao.myContentsUpdate(drNum);
		List<DFilePicture> dDto = mpDao.pictureUpdate(drNum);

		mv.addObject("rList", Rdto);
		mv.addObject("pList", dDto);

		mv.setViewName("adoptionReviewupdatelogoff");

		return mv;
	}
	
	public ModelAndView adoptionReviewListoff() {
		mv = new ModelAndView();

		List<DogReviewDto> rList = mpDao.adoptionreviewlist();
		mv.addObject("rList", rList);

		mv.setViewName("adoptionReviewListlogoff");

		return mv;
	}

	public ModelAndView productReviewUpdate(int srnum) {
		mv = new ModelAndView();
		ShopReviewDto rDto = mpDao.productReviewUpdate(srnum);
		mv.addObject("rDto", rDto);
		
		mv.setViewName("productReviewUpdate");
		
		return mv;
	}

	public String productReviewUpdateProc(ShopReviewDto sDto, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		int srNum = sDto.getSrnum();
		try {
			mpDao.productReviewUpdateProc(sDto);
			
			
			view = "redirect:/mycontentslist";			
		} catch(Exception e) {
			view = "redirect:/productReviewUpdate?srNum="+ srNum;
			msg = "수정 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		
		return view;
	}

}
