package com.doglife.db;

import java.io.IOException;
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

import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.service.AdoptionService;

import lombok.extern.java.Log;

@Controller
@Log
public class AdoptionController {

	private ModelAndView mv;

	@Autowired
	private AdoptionService aServ;

	@GetMapping("/toAdoptionPreTest")
	public String toAdoptionPreTest() {
		log.info("toAdoptionPreTest()");
		String view = null;

		view = "AdoptionPreTest";

		return view;
	}
	
	@GetMapping("/breedRecommend")
	public ModelAndView toBreedRecommend(HttpSession session) {
		log.info("toBreedRecommend()");

		mv = aServ.showBreedRecommend(session);

		return mv;
	}
	
	@GetMapping("/adoptionReview")
	public ModelAndView showAdoptionReview(ListDto list, HttpSession session) {
		log.info("showAdoptionReview()");
		
		mv = aServ.showAdoptionReview(list, session);
		
		return mv;
	}
	

	@PostMapping("/update")
	public String update(MultipartHttpServletRequest multi) {
		log.info("update()");

		String view = aServ.boardUpdate(multi);

		return view;
	} 

	@GetMapping("/toAdoptionList")
	public ModelAndView toAdoptionList(ListDto list) {
		mv = aServ.toAdoptionList(list);

		return mv;
	}
	@GetMapping("/adoptionList")
	public ModelAndView adoptionList(HttpSession session) {
		log.info("adoptionList()");

		mv = aServ.getDogList(session);

		return mv;
	}

	@GetMapping("/adoptionapp2")
	public ModelAndView adoptionapp(HttpSession session, int dogNum) {
		log.info("adoptionapp2()");

		mv = aServ.getAppList(session, dogNum);

		return mv;
	}

	//Check if it the admin part or adoption part
	@GetMapping("/adoptionInfo")
	public ModelAndView adoptionInfo(HttpSession session, int dogNum) {
		log.info("adoptionInfo");
		mv = aServ.adoptionInfo(session, dogNum);
		return mv;
	}
	
	@GetMapping("/userDogRegister")
	public String userDogRegister(HttpSession session, AdoptionAppDto appDto) {
	log.info("userDogRegister");
		String view = aServ.userDogRegister(session, appDto);
		return view;
	}
	
	@PostMapping("/adoptionapp3")
	public ModelAndView adoptionapp3(AdoptionAppDto aDto, HttpSession session) {
		log.info("adoptionapp3()");
		
		mv = aServ.adoptionapp3(aDto, session);
		
		return mv;
	}
	
	@GetMapping("/delAdoptionInfo")
	public String delAdoptionInfo(int aaKey, int rType, RedirectAttributes rttr) throws IOException, InterruptedException {
		log.info("delAdoptionInfo()");
		String view = null;
		
		view = aServ.delAdoptionInfo(aaKey, rType, rttr);
		
		return view;
		
		
	}
	
	
	
}
