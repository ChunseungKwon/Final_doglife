package com.doglife.db.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.doglife.db.dao.BoardDao;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {

	private ModelAndView mv;
	
	@Autowired
	private BoardDao bDao;
	
	private int listCnt = 5;
	
	// Paging + 
	public ModelAndView getBoardList(ListDto list, HttpSession session) {
		log.info("getBoardList()");
		
		mv = new ModelAndView();
		
		int pageNum = list.getPageNum();
		list.setPageNum((pageNum-1)*listCnt);
		list.setListCnt(listCnt);
		
		System.out.println(list);
		
		List<BoardDto> bList = bDao.boardListSelect(list);
		
		log.info("blist()");
		
		mv.addObject("bList", bList);
		System.out.println("*********"+bList);
		
		list.setPageNum(pageNum);
		
		String pageHtml = getPaging(list);
		
		mv.addObject("pageHtml", pageHtml);
		
		session.setAttribute("pageNum", list.getPageNum());
		
		if(list.getColname() != null) {
			session.setAttribute("list", list);
		}
		else {
			session.removeAttribute("list");
		}
		
		mv.setViewName("notice");
		
		return mv;
	}
	
	//Page Html Production algorithm
	public String getPaging(ListDto list) {
		String pageHtml = null;
		
		int maxNum = bDao.boardCountSelect(list);
		
		int pageCnt = 5;
		
		String listName = "notice?";
		
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

	public ModelAndView noticeContents(int anum, HttpSession session) {
		mv = new ModelAndView();
		
		BoardDto bDto = bDao.noticeContents(anum);
		
		String memberId = null;
		
		memberId = (String) session.getAttribute("memberId");
		
		if(memberId != bDto.getMemberId()) {
			bDao.viewsUpdate(anum);
		}
		
		String previousPage = previousPage(anum);
		
		String nextPage = nextPage(anum);
		
		mv.addObject("bDto", bDto);
		mv.addObject("pPage", previousPage);
		mv.addObject("nPage", nextPage);
		
		System.out.println(previousPage);
		System.out.println(nextPage);
		
		mv.setViewName("noticeContents");
		
		return mv;
	}

	private String previousPage(int anum) {
		String previousHtml = null;
		
		Integer pNum = anum;
		
		String pId = bDao.getPreviousPage(pNum);
		
		pNum = bDao.getPreviousPageNum(pNum);
		
		System.out.println("previous" + pId);
		
		if(pId != null) {
			previousHtml = "<div class = 'previous'><a href = './noticeContents?anum="+pNum+"'><i class='bi bi-chevron-left'></i><strong>이전<strong></a></div>";
		}
		
		return previousHtml;
	}

	private String nextPage(int anum) {
		String nextHtml = null;
		
		Integer pNum = anum;
		
		String nId = bDao.getNextPage(pNum);
		
		pNum = bDao.getNextPageNum(pNum);
		
		
		System.out.println("NextPage" + nId);
		
		if(nId != null) {
			nextHtml = "<div class = 'next'><a href = './noticeContents?anum="+pNum+"'><strong>다음</strong><i class='bi bi-chevron-right'></i></a></div>";
		}
		
		return nextHtml;
	}

}
