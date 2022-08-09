package com.doglife.db.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.BoardDao;
import com.doglife.db.dao.SupportDao;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class SupportService {

	private ModelAndView mv;
	
	@Autowired
	private SupportDao sDao;

	public ModelAndView faqselect() {
		log.info("serv.faq()");
		mv = new ModelAndView();

		List<FaqDto> flist = sDao.faqselect();

		System.out.println(flist);
		mv.addObject("flist", flist);
		mv.setViewName("faq");

		return mv;

	}
	public String supportInsert(MySupportDto msDto,RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		try {
			sDao.mysupportInsert(msDto);
			log.info("삽입 후 msDto : " + msDto);

			view = "redirect:/indivsupport2";
			msg = "정상적으로 등록되었습니다";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/indivsupport2";
			msg = "입력실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		return view;
	}

	public ModelAndView indivsup(HttpSession session) {
		mv = new ModelAndView();

		MemberDto mDto = (MemberDto) session.getAttribute("mb");

		mv.addObject("m", mDto);

		mv.setViewName("indivsupport2");
		return mv;
	}
	public ModelAndView indivsupport3(String memberId) {
		mv = new ModelAndView();

		List<MySupportDto> sList = sDao.indiselect(memberId);

		mv.addObject("sList", sList);
		mv.setViewName("indivsupport3");
		return mv;
	}

	public ModelAndView indivsupport4(int msNum, HttpSession session) {
		mv = new ModelAndView();

		MemberDto mDto = (MemberDto) session.getAttribute("mb");

		MySupportDto tDto = sDao.anyindiselect(msNum);

		mv.addObject("m", mDto);
		mv.addObject("sList", tDto);
		
		mv.setViewName("indivsupport4");
		return mv;
	}

	public String supdelete(MySupportDto sDto, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			sDao.supdelete(sDto);
			view = "redirect:/indivsupport3";
			msg = "삭제 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/indivsupport3";
			msg = "삭제 실패";
		}
		rttr.addFlashAttribute("msg", msg);
		return view;
	}
}
