package com.doglife.db.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.ShopDao;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.dto.ProductOptionDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.dto.ShopReplyDto;
import com.doglife.db.dto.ShopReviewDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class ShopService {

	@Autowired
	private ShopDao shopDao;

	private ModelAndView mv;

	private int listCnt = 5;//페이지 당 출력할 게시글 개수

	public ModelAndView toShopMain(ProductListDto productList, HttpSession session) {
		mv = new ModelAndView();

		int num = productList.getPageNum();
		productList.setPageNum((num) * listCnt);
		productList.setListCnt(listCnt);

		List<ProductDto> newList = shopDao.selectNewProductList(productList);
		List<ProductDto> bestList = shopDao.selectBestProductList(productList);


		mv.addObject("newList", newList);
		mv.addObject("bestList", bestList);

		//페이징 처리
		productList.setPageNum(num);
		String pageHtml = getPaging(productList);
		mv.addObject("paging", pageHtml);

		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", productList.getPageNum());
		if(productList.getCategory() != null) {
			session.setAttribute("productList", productList);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("productList");
		}

		mv.setViewName("shopMain");

		return mv;
	}


	public ModelAndView showProductList(ProductListDto productList, HttpSession session) {
		mv = new ModelAndView();

		//Dao에 보내는 데이터를 만들자. (검색 기능 추가로 코드 사용 안함)
		//Map<String, Integer> pmap = new HashMap<String, Integer>();
		//pmap.put("pnum", (pageNum - 1) * listCnt);
		//pmap.put("lcnt", listCnt);
		int num = productList.getPageNum();
		productList.setPageNum((num) * listCnt);
		productList.setListCnt(listCnt);

		List<ProductDto> pList = shopDao.selectProductList(productList);
		List<ProductDto> bestList = shopDao.selectBestProductList(productList);

		mv.addObject("pList", pList);
		mv.addObject("bestList", bestList);


		//페이징 처리
		productList.setPageNum(num);
		String pageHtml = getPaging(productList);
		mv.addObject("paging", pageHtml);

		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", productList.getPageNum());
		if(productList.getCategory() != null) {
			session.setAttribute("productList", productList);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("productList");
		}

		mv.setViewName("productList");

		return mv;
	}

	private String getPaging(ProductListDto productList) {
		String pageHtml = null;

		//전체 글개수 구하기
		int maxNum = shopDao.bcntSelect(productList);
		//한 페이지 당 보여질 페이지 번호의 개수
		int pageCnt = 5;
		String listName = "productList?";

		//검색용 컬럼명과 검색어를 추가
		if(productList.getCategory() != null) {
			listName += "category="+productList.getCategory()+"&";
		}

		PagingUtil paging = new PagingUtil(maxNum, productList.getPageNum(), 
				listCnt, pageCnt, listName);

		pageHtml = paging.makePaging();

		return pageHtml;
	}

	public ModelAndView showProductInfo(Integer pnum) {
		mv = new ModelAndView();

		//글 내용 가져오기
		ProductDto productInfo = shopDao.selectProductInfo(pnum);

		List<ProductOptionDto> optionlist = shopDao.selectProductOption(pnum);

		//파일 목록 가져오기
		List<ProductFileDto> pfList = shopDao.selectProductFile(pnum);


		//질문 목록 가져오기
		List<ShopQnADto> qnaList = shopDao.selectProductQnA(pnum); 


		//댓글 목록 가져오기
		List<ShopReplyDto> productReview = shopDao.selectProductReply(pnum);


		//가져온 데이터를 mv에 추가
		mv.addObject("productInfo", productInfo);
		mv.addObject("optionlist", optionlist);
		mv.addObject("pfList", pfList);
		mv.addObject("qnaList", qnaList);
		mv.addObject("productReview", productReview);


		//보여질 페이지(jsp) 이름 지정
		mv.setViewName("productInfo");

		return mv;
	}


	public void setRating(int pnum) {

		Float productRate = shopDao.getRatingAverage(pnum);	

		if(productRate == null) {
			productRate = 0.0f;
		}	

		ShopReviewDto review = new ShopReviewDto();
		review.setPnum(pnum);
		review.setSrRate(productRate);	

		shopDao.updateRating(review);		

	}




	//Q&A
	@Transactional
	public Map<String, List<ShopQnADto>> askQuestion(ShopQnADto qna, HttpSession session) {
		Map<String, List<ShopQnADto>> qmap = null;

		MemberDto customer = (MemberDto)session.getAttribute("mb");

		String memberId = customer.getMemberId();
		qna.setMemberId(memberId);

		String sellerID = shopDao.selectSeller(qna.getPnum());
		qna.setSellerID(sellerID);

		try {
			//질문 삽입
			shopDao.insertQuestion(qna);
			//질문 목록 불러오기 및 qmap에 추가
			List<ShopQnADto> qnaList = shopDao.selectProductQnA(qna.getPnum());

			ProductDto product = shopDao.selectProductInfo(qna.getPnum());
			String pname = product.getPname();


			qmap = new HashMap<String, List<ShopQnADto>>();
			qmap.put("qnaList", qnaList);

		} catch(Exception e) {
			e.printStackTrace();
			qmap = null;
		}

		return qmap;
	}






}