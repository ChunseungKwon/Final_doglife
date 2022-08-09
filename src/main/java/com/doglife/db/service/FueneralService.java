package com.doglife.db.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.FueneralDao;
import com.doglife.db.dao.MemberDao;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.iamport.ExecApi;
import com.doglife.db.util.PagingUtil;
import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;

import lombok.extern.java.Log;

@Service
@Log
public class FueneralService {
	@Autowired
	private FueneralDao fDao;

	@Autowired
	private MemberDao mDao;
	private int listCnt = 5;
	private ModelAndView mv;

	public String fueneralInsert(FueneralDto fdto, HttpSession session, RedirectAttributes rttr, boolean isSaveNotPay) {

		String view = null;
		String msg = null;

		try {
			if (!isSaveNotPay) {
				fDao.fueneralInsert(fdto);
			}

			view = "redirect:/toReserverInfo?frNum=" + fdto.getFrNum();
			msg = "예약이 되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/toReservationFuneral2";
			msg = "예약 실패 입니다. 다시 예약해 주세요.";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;

	}

	public MemberDto customerSelect(String memberId) {
		MemberDto cDto = mDao.memberSelect(memberId);
		return cDto;
	}

	public ModelAndView getReserInfo(int frNum) {
		mv = new ModelAndView();

		FueneralDto fdto = fDao.selectReInfo(frNum);

		mv.addObject("fdto", fdto);
		mv.setViewName("toReservationFuneral3");

		return mv;
	}

	public ModelAndView getExistReserv(FueneralDto fdto, HttpSession session, RedirectAttributes rttr) {

		String memberId = (String) session.getAttribute("memberId");

		fdto = fDao.selectExistReserv(memberId);

		if (fdto != null) {
			mv = new ModelAndView();
			mv.addObject("fdto", fdto);
			mv.setViewName("toReservationFuneral3");
		} else {
			mv = null;
		}

		return mv;
	}

	@Transactional
	public String fueneralDelete(int frNum, RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		try {
			fDao.fueneralDelete(frNum);
			// mv.addObject("fdto", fdto);
			view = "redirect:/funeralinfo";
			msg = "예약이 취소되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/toReservationFuneral3";
			msg = "예약 취소가 실패되었습니다.";
		}

		rttr.addFlashAttribute("msg", msg);
		// mv.setViewName(view);

		return view;
	}



	public List<String> fr_time_select(String date) {
		List<String> frTimeList = fDao.fr_time_select(date);

		return frTimeList;
	}

	public ModelAndView fr_My_list(HttpSession session, ListDto list) {
		mv = new ModelAndView();

		String memberId = (String) session.getAttribute("memberId");
		int pageNum = list.getPageNum();
		list.setPageNum((pageNum - 1) * listCnt);
		list.setListCnt(listCnt);
		list.setMemberId(memberId);
		List<FueneralDto> fList = fDao.fr_My_list(list);
		
		list.setPageNum(pageNum);
		
	
		
		System.out.println("fList.count=[" + fList.size() + "]");

		String pageHtml = getPaging(list, memberId);

		mv.addObject("pageHtml", pageHtml);
		
		mv.addObject("fList", fList);

		mv.setViewName("toReservationFuneralList");

		return mv;
	}

	//Page Html Production algorithm
	public String getPaging(ListDto list, String memberId) {
		String pageHtml = null;
		
		int maxNum = fDao.boardCountSelect(memberId);
		
		int pageCnt = 5;
		
		String listName = "toReservationFuneralList?";
		
		if(list.getColname() != null) {
			listName =  "colname="+ list.getColname()
			+ "&keyword=" + list.getKeyword() + "&";
		}
		PagingUtil paging = new PagingUtil(maxNum, 
				list.getPageNum(),
				listCnt, pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}

	public String frPayUpdate(FueneralDto fdto, HttpSession session, RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		try {

			fDao.frPayUpdate(fdto);

			view = "redirect:/toReservationFuneralList?pageNum=1";
			msg = "결제 성공입니다.";
		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/toReservationFuneral2";
			msg = "결제 실패 입니다. 다시 결제해 주세요.";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public String refundProcessing(int frNum, String refundReason, RedirectAttributes rttr)
			throws IOException, InterruptedException {

		String view = "";
		String msg = "";
		FueneralDto fdto = fDao.selectReInfo(frNum);

		// 결제 취소용
		ExecApi execApi = new ExecApi();
		String refundResult = execApi.refundProcessing(fdto.getFrPayNo(), fdto.getFrPrice(), refundReason);

		if (refundResult.equals("REFUND_SUCCESS") || refundResult.equals("REFUND_I_MEY_CHE_SO_ZU_MUN")) {
			fDao.fueneralDelete(frNum);
			msg = "정상적으로 환불작업이 완료되었습니다.";
		} else if (refundResult.equals("REFUND_UNAUTH")) {
			msg = "인증 실패했습니다.(Unauthorized)";
		} else {
			msg = "카카오페이 환불작업을 실패하였습니다.";
		}

		rttr.addFlashAttribute("msg", msg);
		view = "redirect:/toReservationFuneralList?pageNum=1";
		return view;

	}

}// class end
