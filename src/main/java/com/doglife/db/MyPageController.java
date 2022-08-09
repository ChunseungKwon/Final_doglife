package com.doglife.db;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogReviewDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.dto.ShopReviewDto;
import com.doglife.db.service.BoardService;
import com.doglife.db.service.CartService;
import com.doglife.db.service.MyPageService;

import lombok.extern.java.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class MyPageController {

	private ModelAndView mv;

	@Autowired
	private MyPageService mpServ;
	
	@Autowired
	private CartService cartServ;

	@GetMapping("/mypage_update2")
	public ModelAndView mypageupdate2(HttpSession session) {
		mv = mpServ.mypageupdate2(session);
		return mv;
	}

	@GetMapping("/myadoption")
	public ModelAndView myadoption(String memberId) {
		log.info("myadoption");
		mv = mpServ.myadoptionSelect(memberId);
		return mv;
	}

	@GetMapping("/deleteMyAdoption")
	public String deleteMyAdoption(int aaKey) {
		log.info("deleteMyAdoption()");
		String view = mpServ.deleteMyAdoption(aaKey);
		return view;
	}

	@GetMapping("/adoptionReviewupdatelogoff")
	public ModelAndView adoptionReviewupdatelogoff(int drNum) {
		mv = mpServ.adoptionReviewupdatelogoff(drNum);
		return mv;
	}

	// MyorderPage
	@GetMapping("/toMyOrder")
	public ModelAndView toMyOrder(MyOrderDto orderlist, HttpSession session, RedirectAttributes rttr,ListDto list) {
		log.info("toMyOrder()");

		// DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = cartServ.showOrderList(orderlist, session, rttr,list);

		return mv;
	}

	// 후기 등록
	@PostMapping("/adoptionReviewRegister")
	public String adoptionReviewRegister(MultipartHttpServletRequest multi, RedirectAttributes rttr, boolean isDel) {
		log.info("adoptionReviewRegister()");

		String view = mpServ.adoptionReviewRegister(multi, rttr, isDel);

		return view;
	}

	// 후기 작성
	@GetMapping("/adoptionReviewWrite")
	public ModelAndView adoptionReviewWrite(HttpSession session, int dogNum) {
		log.info("adoptionReveiwWrite()");

		mv = mpServ.adoptionReviewWrite(session, dogNum);

		return mv;
	}

	// 후기 등록 후 페이지 이동
	@GetMapping("/adoptionReviewList")
	public ModelAndView adoptionReviewList() {
		mv = mpServ.adoptionReviewList();
		return mv;
	}

	// 입양 후기 리스트에서 상세보기
	@GetMapping("/adoptionReviewUpdate")
	public ModelAndView adoptionReviewUpdate(int drNum) {
		log.info("adoptionReviewUpdate() : drNum - " + drNum);

		mv = mpServ.adoptionReviewUpdate(drNum);

		return mv;
	}

	// 입양 상세보기에서 사진 삭제
	@PostMapping(value = "/ReviewPicdelFile", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<DFilePicture>> ReviewPicdelFile(String sysname, int drNum, HttpSession session) {
		log.info("ReviewPicdelFile() - sysname : " + sysname);

		Map<String, List<DFilePicture>> fMap = mpServ.reviewFileDelete(sysname, drNum, session);

		return fMap;
	}

	// 입양 후기 수정
	@PostMapping("/adoptionReviewSetUpdate")
	public String adoptionReviewSetUpdate(DogReviewDto rDto, RedirectAttributes rttr, MultipartHttpServletRequest multi,
			int dogNum, int drNum, boolean isDel) {
		String view = mpServ.adoptionReviewSetUpdate(rDto, rttr, dogNum, drNum, multi, isDel);

		return view;
	}

	// 입양후기 삭제
	@PostMapping("/deleteReview")
	public String deleteReview(int drNum, RedirectAttributes rttr) {
		String view = mpServ.deleteReview(drNum, rttr);

		return view;
	}

	@GetMapping("/mycontentslist")
	public ModelAndView mycontentslist(HttpSession session, String memberId) {
		mv = mpServ.mycontentslist(memberId, session);
		return mv;
	}
	
	@GetMapping("/productReviewUpdate")
	public ModelAndView productReviewUpdate(int srnum) {
		
		mv = mpServ.productReviewUpdate(srnum);
		
		return mv;
		
	}
	
	@PostMapping("/productReviewUpdateProc")
	public String productReviewUpdateProc(ShopReviewDto sDto,RedirectAttributes rttr) {
		String view = null;
		
		view = mpServ.productReviewUpdateProc(sDto, rttr);
		
		return view;
	}
}
