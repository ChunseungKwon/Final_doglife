package com.doglife.db.service;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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

import com.doglife.db.dao.CustomerPageDao;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.SellerOrderListDto;
import com.doglife.db.dto.ShopReviewDto;

import lombok.extern.java.Log;

@Service
@Log
public class CustomerPageService {

	@Autowired
	CustomerPageDao custpageDao;

	private ModelAndView mv;
	
	
	public ModelAndView customerOrderList(MyOrderDto order, HttpSession session) {
		mv = new ModelAndView();
		
		MemberDto customer = (MemberDto)session.getAttribute("mb");
		String memberId = customer.getMemberId();
				
		List<MyOrderDto> oList = custpageDao.selectOrderedList(memberId);
		
	
		
		mv.addObject("oList", oList);

								
		mv.setViewName("sellerOrders");
		
		return mv;
	}
	
	
	
	
	public ModelAndView productReview(int pnum, HttpSession session) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("pnum", pnum);
		MemberDto customer = (MemberDto)session.getAttribute("mb");
		mv.addObject("memberId", customer.getMemberId());
		mv.setViewName("productReview");
		return mv;
	}

	@Transactional
	public String productReviewRegister(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		HttpSession session = multi.getSession();

		//multi에서 데이터를 추출(게시글의 텍스트 부분)

		String fcheck = multi.getParameter("fileCheck");
		String memberId = multi.getParameter("memberId");
		int pnum = Integer.parseInt(multi.getParameter("pnum"));

		String srtitle = multi.getParameter("srTitle");
		String srcontent = multi.getParameter("srContent");

		int productRate = Integer.parseInt(multi.getParameter("rate"));
		//int pquantity = Integer.parseInt(multi.getParameter("pquantity"));



		try {
			//추출한 데이터를 dto에 삽입.
			ShopReviewDto review = new ShopReviewDto();
			review.setMemberId(memberId);
			review.setSrtitle(srtitle);
			review.setSrcontent(srcontent);
			review.setSrRate((float) productRate);
			review.setPnum(pnum);

			Timestamp ts = Timestamp.valueOf(LocalDateTime.now());
			review.setRegDate(ts);

			if(fcheck.equals("1")) {
				Map<String, String> fmap = fileUpload(multi, pnum, false);
				review.setOriname(fmap.get("oriname"));
				review.setSysname(fmap.get("sysname"));
			}

			custpageDao.productReviewRegister(review);
			updateProductAverage(review);
			
			System.out.println("pnum = "+review.getPnum());	

			view= "redirect:/mycontentslist";
			msg= "상품후기 등록 성공";

		}

		catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/productReview";
			msg = "상품후기 등록 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;


	}

	private Map<String, String> fileUpload(MultipartHttpServletRequest multi, int pnum, boolean isDel) throws Exception {
		//request의 서버 정보에서 프로젝트 폴더의 절대 위치 정보 구하기.
		String realPath = multi.getServletContext()
				.getRealPath("/");

		//파일을 저장할 경로를 절대경로에 추가
		realPath += "resources/review_img/";
		log.info(realPath);

		//upload 폴더가 없을 경우 새로 생성.
		File folder = new File(realPath);
		if(folder.isDirectory() == false) {
			//isDirectory() : 폴더의 존재 유무 및 
			//				폴더인지 파일인지의 여부 확인 메소드
			folder.mkdir();//폴더 생성 메소드
		}

		//1. 파일 정보를 DB(boardfile) 테이블에 저장(글번호, 원래이름, 변경이름)
		//파일 정보는 HashMap을 사용하여 저장.
		Map<String, String> fmap = new HashMap<String, String>();

		//multi에서 file 태그의 name 값 꺼내기
		Iterator<String> files = multi.getFileNames();

		while(files.hasNext()) {
			String fn = files.next();
			String a = null;
			String b = null;

			//multiple 선택 파일 처리 -> 파일 목록 가져오기
			List<MultipartFile> fList = multi.getFiles(fn);

			//각각의 파일을 처리(파일명 추출, 파일을 폴더에 저장)
			for(int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);

				//상품 수정일 경우 파일을 새로 등록할때 기존 파일은 삭제함
				if(isDel) {
					custpageDao.deleteProductImage(pnum);
				}

				//파일명 추출
				String oriname = mf.getOriginalFilename();

				//변경할 이름 생성
				String sysname = System.currentTimeMillis()
						+ oriname.substring(oriname.lastIndexOf("."));

				if(i==0) {
					a = oriname;
					b = sysname;
				}

				//upload 폴더 파일 저장
				File ff = new File(realPath + sysname);
				mf.transferTo(ff);

				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);
			}
		}

		return fmap;
	}
	
	/*
	public void setRating(int bookId) {
		
		Double ratingAvg = replyMapper.getRatingAverage(bookId);	
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}	
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10
				
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setBookId(bookId);
		urd.setRatingAvg(ratingAvg);	
		
		
		
		//평균 보여줄때...
		newRate = (float) (Math.round(newRate*10));
		newRate = newRate / 10;
		
	}
	
*/
	
	
	
	public void updateProductAverage(ShopReviewDto review) {
		
		float productRate = review.getSrRate();
		int pnum = review.getPnum();
		
		Double pavg = custpageDao.getRatingAverage(pnum);	
		int totalreview = custpageDao.getTotalReviews(pnum);
		
		if(pavg == null) {
			pavg = 0.0;
		}	
		
		double newRate = 0;
		newRate = ((pavg * totalreview) + productRate)/(totalreview + 1);
		
		ProductDto product = new ProductDto();
		product.setPnum(pnum);
		product.setPavg(newRate);
		
		
		custpageDao.updateRating(product);		
		
	}




}//class end
