package com.doglife.db;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.service.AdminService;

import lombok.extern.java.Log;

@Controller
@Log
public class AdminController {

	private ModelAndView mv;

	@Autowired
	private AdminService adServ;
		
	@GetMapping("/adminCustomerList")
	public ModelAndView adminCustomerList() {
		
		mv = adServ.adminCustomerList();
		return mv;
	}

	@GetMapping("/mManagement")
	public ModelAndView mManagement(ListDto list, HttpSession session) {
		log.info("mManagement()");

		mv = adServ.mManagement(list, session);

		return mv;
	}

	@GetMapping("/memberDelete")
	public String memberDelete(MemberDto member, RedirectAttributes rttr) {
		log.info("memberDelete()");

		String view = adServ.customerDelete(member, rttr);

		return view;
	}

	@GetMapping("/adoptManagement")
	public ModelAndView adoptManagement(HttpSession session) {
		log.info("adoptManagement()");

		mv = adServ.adoptManagement(session);		

		return mv;
	}

	@GetMapping("/adoptionApplication")
	public ModelAndView adoptionApplication(int dogNum,HttpSession session, RedirectAttributes rttr) {
		log.info("adoptionApplication");

		mv = adServ.adoptionApplication(dogNum, session, rttr);

		return mv;
	}

	@GetMapping("/adoptionDecline")
	public String adoptionDecline(int dogNum, RedirectAttributes rttr) {
		log.info("adoptionDecline()");

		String view = adServ.adoptionDecline(dogNum, rttr);

		return view;
	}

	@GetMapping("/adoptionApprove")
	public String adoptionApprove(int dogNum, RedirectAttributes rttr) {
		log.info("adoptionDecline()");

		String view = adServ.adoptionApprove(dogNum, rttr);

		return view;
	}

	@GetMapping("/funeralManagement")
	public ModelAndView funeralManagement(HttpSession session) {
		log.info("funeralManagement()");

		mv = adServ.funeralManagement(session);

		return mv;
	}

	@GetMapping("/funeralUpdate")
	public ModelAndView funeralUpdate(int frNum) {
		log.info("funeralUpdate()");

		mv = adServ.funeralUpdate(frNum);

		return mv;
	}

	//adoptionReRegister (입양 등록 수정)
	@GetMapping("/adoptionReRegisterSel")
	public ModelAndView adoptionReRegisterSel(int dogNum) {
		mv = adServ.adoptionReRegisterSel(dogNum);
		return mv;
	}

	@PostMapping("/toAdoptionUpdate")
	public String toAdoptionUpdate(MultipartHttpServletRequest multi) {
		log.info("toAdoptionUpdate()");
		String view = adServ.AdoptionInfoUpdate(multi);

		return view;
	}

	@GetMapping("/adminApplicationList")
	public ModelAndView adminApplicationList(AdoptionAppDto appDto) {
		mv = adServ.adminApplicationList(appDto);

		return mv;
	}

	@GetMapping("/adminAdoptionAppInfo")
	public ModelAndView adminAdoptionAppInfo(int aaKey, int dogNum) {
		mv = adServ.adminAdoptionAppInfo(aaKey, dogNum);

		return mv;
	}
	@PostMapping("/adminApplicationOk")
	public String adminApplicationOk(AdoptionAppDto appDto) {
		String view = adServ.adminApplicationOk(appDto);
		return view;
	}

	@GetMapping("/delAdopList")
	public String delAdopList(int dogNum) {
		String view = adServ.deleteAdoptionList(dogNum);

		return view;
	}

	@PostMapping(value = "/delFile", 
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<DFilePicture>> delFile(String sysname, int dogNum,
			HttpSession session){
		log.info("delFile() - sysname : " + sysname);

		Map<String, List<DFilePicture>> fMap = 
				adServ.dogFileDelete(sysname, dogNum, session);

		return fMap;
	}

	@GetMapping("/adoptregi")
	public ModelAndView adopt() {
		mv= adServ.adoptregi();

		return mv;

	}

	@GetMapping("/faqRegister")
	public String faqRegister(FaqDto fDto) {
		String view = adServ.faqinsert(fDto);

		return view;
	}

	@GetMapping("/updatee")
	public String faqupdatee(FaqDto faqNum,RedirectAttributes rttr) {
		String view = null;
		view = adServ.faqupdate(faqNum,rttr);

		return view;
	}

	@GetMapping("/deletee")
	public String faqdeletee(FaqDto faqNum,RedirectAttributes rttr) {
		String view = null;
		view = adServ.faqdeletee(faqNum,rttr);

		return view;
	}
	
	@GetMapping("/indivsupport3_1")
	public ModelAndView indivsupport3_1() {
		mv = adServ.indivsupport3_1();
		return mv;
	}

	@GetMapping("/indivsupport5")
	public ModelAndView indivsupport5(int msNum,HttpSession session) {
		
		mv=adServ.indivsupport5(msNum,session);
		return mv;
	}
	
	@GetMapping("/addeletesupport")
	public String addeletesupport(MySupportDto sDto,RedirectAttributes rttr) {
		String view = adServ.adsupdelete(sDto,rttr);
		
		return view;
	}
	
	@GetMapping("/regianwer")
	public String regianwer(MySupportDto sDto,RedirectAttributes rttr) {
		String view = adServ.regianwer(sDto,rttr);
		
		
		return view;
	}
	
	@GetMapping("/adminNotice")
	public ModelAndView showAdminNotice(HttpSession session, BoardDto anDto) {
		log.info("showAdminNotice");
		mv = adServ.showAdminNotice(session, anDto);
		
		return mv;
	}
	
	@GetMapping("/adoptionRegister")
	public ModelAndView adoptionRegister(HttpSession session) {
		log.info("adoptionRegister");

		mv = adServ.adoptionRegister(session);

		return mv;
	}
	
	@PostMapping("/adminAnnouncementInsert")
	public String adminAnnouncementInsert (HttpSession session, BoardDto anDto) {
		log.info("adminAnnouncementInsert()");
		
		String view = adServ.adminAnnouncementInsert(session, anDto);
		
		return view;
	}

	@GetMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(HttpSession session, BoardDto anDto, int anum) {
		log.info("noticeUpdate");

		mv = adServ.noticeUpdate(session, anDto, anum);

		return mv;
	}

	@GetMapping("/adnotice")
	public ModelAndView notice() {
		log.info("notice");
		mv = adServ.selectNotice();
	
		return mv;
	}
	
	@GetMapping("/noticeRegister")
	public String noticeRegister() {
		return "noticeRegister";
	}
	
	@GetMapping("/noticeUpdateT")
	public String noticeUpdateT(HttpSession session, BoardDto anDto) {
		log.info("noticeUpdateT()");

		String view = adServ.noticeUpdateT(session, anDto);

		return view;
	}
	
	@PostMapping("/dogRegister")
	public String dogRegister(MultipartHttpServletRequest multi) {
      
		String view = adServ.dogRegister(multi);
		
		return view;
	}
	
	@GetMapping("/delNotice")
	public String delNotice(int anum) {
		String view = adServ.delNotice(anum);
		
		return view;
	}
	
	@GetMapping("/adminSellerList")
	public ModelAndView adminSellerList() {
		mv = adServ.adminSellerList();
		return mv;
	}
	
	
}
