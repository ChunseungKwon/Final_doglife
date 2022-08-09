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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.MyPageDao;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.service.BoardService;
import com.doglife.db.service.SupportService;

import lombok.extern.java.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class SupportController {

	private ModelAndView mv;

	@Autowired
	SupportService sServ;

	@GetMapping("/faq")
	public ModelAndView faq() {
		log.info("faq()");
		mv = sServ.faqselect();
		return mv;

	}

	@PostMapping("/sendSupport")
	public String sendSupport(MySupportDto msDto,RedirectAttributes rttr) {

		String view = sServ.supportInsert(msDto,rttr);

		return view;

	}

	@GetMapping("/indivsupport2")
	public ModelAndView indivsupport2(HttpSession session) {
		log.info("indivsupport2()");
		mv = sServ.indivsup(session);

		return mv;
	}
	

	@GetMapping("/indivsupport3")
	public ModelAndView indivsupport3(String memberId) {
		mv = sServ.indivsupport3(memberId);
		return mv;
	}

	@GetMapping("/indivsupport4")
	public ModelAndView indivsupport4(int msNum,HttpSession session) {

		mv = sServ.indivsupport4(msNum,session);
		return mv;
	}

	@GetMapping("/deletesupport")
	public String deletesupport(MySupportDto sDto,RedirectAttributes rttr) {
		String view = sServ.supdelete(sDto,rttr);

		return view;
	}

	
}
