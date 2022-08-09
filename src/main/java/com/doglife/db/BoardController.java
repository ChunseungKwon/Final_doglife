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

import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.service.BoardService;

import lombok.extern.java.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class BoardController {
	
	@Autowired
	private BoardService bServ;
	
	private ModelAndView mv;
	
	@GetMapping("/")
	public String toCenterMain(HttpSession session) {
		log.info("toCenterMain()");
		String view = "centermain";
		return view;
	}
	
	@GetMapping("/toAboutUs")
	public String toAboutUs(HttpSession session){
		log.info("toAboutUs()");
		String view = null;
		view = "siteinfo";
		return view;
	}
	
	@GetMapping("/toNotice")
	public String toNotice(HttpSession session){
		log.info("toNotice()");
		String view = null;
		view = "redirect:/notice?pageNum=1";
		
		return view;
	}

	//Have to finish
	@GetMapping("/notice")
	public ModelAndView showNotice(ListDto list, HttpSession session) {
		log.info("showNotice()");
		
		mv = bServ.getBoardList(list, session);
		
		return mv;
	}
	
	@GetMapping("/noticeContents")
	public ModelAndView noticeContents(int anum, HttpSession session) {
		log.info("noticeContents()");
		mv = bServ.noticeContents(anum, session);
		
		return mv;
	}
	
	@GetMapping(value = "/WaytoCome")
	public String toWaytoCome(HttpSession session, BoardDto board) {
		log.info("toWaytoCome()");
		
		String view = null;
		
		view = "centermap";
		
		return view;
	}
}
