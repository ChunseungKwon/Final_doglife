package com.doglife.db;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.service.FueneralService;

import lombok.extern.java.Log;

@Controller
@Log
public class FuneralinfoController {
	
	@Autowired
	private FueneralService fServ;
	
	private ModelAndView mv;

	//회원가입 주소검색이랑 중복 나중에 확인
//	@RequestMapping("/jusoPopup")
//	public String jusoPopup() {
//		log.info("jusoPopup()");
//		
//		return "jusoPopup";
//	}
	
	@GetMapping("/funeralinfo")
	public String funeralinfo() {
		log.info("funeralinfo()");
		
		return "funeralinfo";
	}
	
	@GetMapping("/toReservationFuneral1")
	public String toReservationFuneral1(FueneralDto fdto , HttpSession session, RedirectAttributes rttr) {
		log.info("toReservationFuneral1()");

		return "toReservationFuneral1";
	}	
	
	@PostMapping("/toReservationFuneral2")	
	public ModelAndView toReservationFuneral2(FueneralDto fdto , HttpSession session, RedirectAttributes rttr) {
		log.info("toReservationFuneral2");
		
		mv = new ModelAndView();
		
		String memberId = (String) session.getAttribute("memberId");	

		MemberDto cDto = fServ.customerSelect(memberId);
		
		mv.addObject("cdto", cDto);
		mv.addObject("fdto", fdto);
		mv.addObject("memberId", memberId);
		
		mv.setViewName("toReservationFuneral2");
		
		return mv;
	}
	
	// boolean isSaveNotPay
	@PostMapping("/toReservationFuneral3")	
	public String toReservationFuneral3(FueneralDto fdto, HttpSession session, RedirectAttributes rttr, boolean isSaveNotPay) {	
		log.info("toReservationFuneral3");
		
		String view = fServ.fueneralInsert(fdto, session, rttr, isSaveNotPay);		
		
		return view;
	}
	
	@GetMapping("/toReserverInfo")
	public ModelAndView toReserverInfo(int frNum) {
		log.info("toReserverInfo() frNum : " + frNum);
		mv = fServ.getReserInfo(frNum);
		
		return mv;
	}
	
	@GetMapping("/delReserverInfo")
	public String delReserverInfo(int frNum, RedirectAttributes rttr) {
		String view = fServ.fueneralDelete(frNum, rttr);
		return view;
	}
		
	@GetMapping("/toReservationFuneralList")
	public ModelAndView fr_My_list (HttpSession session, ListDto list) {
		
		log.info("fr_My_list()");
		
		mv = fServ.fr_My_list( session, list);
		
		return mv;
	}
	
	@GetMapping("/frPayInsert")	
	public String frPayUpdate(FueneralDto fdto, String mcuid, HttpSession session, RedirectAttributes rttr) {	
		log.info("frPayInsert" + fdto.getFrNum());
		
		fdto.setFrPayNo(mcuid);
		String view = fServ.frPayUpdate(fdto, session, rttr);		
		
		return view;
	}
	
	@GetMapping("/refundProcessing")
	public String refundProcessing(int frNum, String refundReason, RedirectAttributes rttr) throws IOException, InterruptedException {
				
		System.out.println("############### refundProcessing. frnum=" + frNum);
				
		String view = fServ.refundProcessing(frNum, refundReason, rttr);		
		
		return view;
		
	}
}//class end





