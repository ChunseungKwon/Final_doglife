package com.doglife.db.service;

import java.io.File;
import java.io.IOException;
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

import com.doglife.db.dao.CartDao;
import com.doglife.db.dao.SellerPageDao;
import com.doglife.db.dao.ShopDao;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductOptionDto;
import com.doglife.db.dto.SellerOrderListDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.iamport.ExecApi;

import lombok.extern.java.Log;

@Service
@Log
public class SellerPageService {
	
	@Autowired
	private SellerPageDao sellpageDao;
	@Autowired
	private CartDao cartDao;
	
	private ModelAndView mv;
	
	private int listCnt = 5;//페이지 당 출력할 게시글 개수
	

	public ModelAndView showProductList(ProductDto product, HttpSession session) {
		mv = new ModelAndView();
		
		MemberDto seller = (MemberDto)session.getAttribute("sb");
		String sellerID = seller.getMemberId();
				
		List<ProductDto> pList = sellpageDao.selectProductList(sellerID);
		
		mv.addObject("pList", pList);
						
		mv.setViewName("sellerPage");
		
		return mv;
	}
	
	public ModelAndView showOrderedList(SellerOrderListDto order, HttpSession session) {
		mv = new ModelAndView();

		MemberDto seller = (MemberDto)session.getAttribute("sb");
		String sellerID = seller.getMemberId();

		List<SellerOrderListDto> oList = sellpageDao.selectOrderedList(sellerID);
		List<SellerOrderListDto> dList = sellpageDao.selectDeliveredList(sellerID);
		List<SellerOrderListDto> refundList = sellpageDao.selectRefundList(sellerID);

		mv.addObject("oList", oList);
		mv.addObject("dList", dList);
		mv.addObject("refundList", refundList);
		
		mv.setViewName("sellerOrders");

		return mv;
	}
	
	public ModelAndView showQnaList(ShopQnADto qna, HttpSession session) {
		mv = new ModelAndView();
		
		MemberDto seller = (MemberDto)session.getAttribute("sb");
		String sellerID = seller.getMemberId();
				
		List<ShopQnADto> qnaList = sellpageDao.selectQnaList(sellerID);
		
		mv.addObject("qnaList", qnaList);
						
		mv.setViewName("sellerQna");
		
		return mv;
	}

	@Transactional
	public String addNewProduct(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		HttpSession session = multi.getSession();

		//multi에서 데이터를 추출(게시글의 텍스트 부분)

		String fcheck = multi.getParameter("fileCheck");
		String sellerID = multi.getParameter("sellerID");
		String pname = multi.getParameter("pname");
		int pprice = Integer.parseInt(multi.getParameter("pprice"));
		int ppoint = Integer.parseInt(multi.getParameter("ppoint"));
		String pinfo = multi.getParameter("pinfo");
		int pquantity = Integer.parseInt(multi.getParameter("pquantity"));
		String pcategory = multi.getParameter("pcategory");


		System.out.println("sellerID=["+sellerID+"]");
		System.out.println("pname=["+pname+"]");
		System.out.println("pprice=["+pprice+"]");
		System.out.println("ppoint=["+ppoint+"]");

		try {
			//추출한 데이터를 dto에 삽입.
			ProductDto product = new ProductDto();
			product.setSellerID(sellerID);
			product.setPname(pname);
			product.setPprice(pprice);
			product.setPpoint(ppoint);
			product.setPinfo(pinfo);
			product.setPcategory(pcategory);
			product.setPquantity(pquantity);

			sellpageDao.insertProduct(product);

			System.out.println("pnum = "+product.getPnum());	

			if(product.getPnum()>0) {

				String[] poption = multi.getParameterValues("poption");
				String[] choiceA = multi.getParameterValues("choiceA");
				String[] choiceB = multi.getParameterValues("choiceB");
				String[] choiceC = multi.getParameterValues("choiceC");

				System.out.println("option=["+poption+"]");
				System.out.println("choiceA=["+choiceA+"]");
				System.out.println("choiceB=["+choiceB+"]");
				System.out.println("choiceC=["+choiceC+"]");


				for(int i=0; i<poption.length; i++) {
					ProductOptionDto productOption = new ProductOptionDto();	
					productOption.setPoption(poption[i]);
					productOption.setChoiceA(choiceA[i]);
					productOption.setChoiceB(choiceB[i]);
					productOption.setChoiceC(choiceC[i]);
					productOption.setPnum(product.getPnum());					
					sellpageDao.insertOption(productOption );
				}


			}
			if(fcheck.equals("1")) {
				fileUpload(multi, product.getPnum(), product, false);

		}	


		view= "redirect:/sellerPage";
		msg= "상품 등록 성공";
	}

	catch (Exception e) {
		e.printStackTrace();

		view = "redirect:addNewProduct";
		msg = "상품등록 실패";
	}

	rttr.addFlashAttribute("msg", msg);

	return view;


}	// method end

private void fileUpload(MultipartHttpServletRequest multi, int pnum, ProductDto product, boolean isDel) throws Exception {
	//request의 서버 정보에서 프로젝트 폴더의 절대 위치 정보 구하기.
	String realPath = multi.getServletContext()
			.getRealPath("/");

	//파일을 저장할 경로를 절대경로에 추가
	realPath += "resources/upload/";
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
	fmap.put("pnum", String.valueOf(pnum));

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
				sellpageDao.deleteProductImage(pnum);
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

			fmap.put("oriname", oriname);
			fmap.put("sysname", sysname);

			//upload 폴더 파일 저장
			File ff = new File(realPath + sysname);
			mf.transferTo(ff);
			
			//DB에 파일정보 저장
			sellpageDao.insertProductImage(fmap);
		}
		product.setThumbnail(a);
		product.setThumbsysname(b);

		sellpageDao.addThumbnail(product);
	}
}
	
	
	
	
	


	public ModelAndView toUpdateProduct(int pnum) {
		mv = new ModelAndView();
		
	
		
		//상품 목록 가져오기
		ProductDto product = sellpageDao.getProductList(pnum);
		//파일 목록 가져오기
		List<ProductFileDto> pfList = sellpageDao.getProductImage(pnum);
		//옵션 목록 가져오기
		List<ProductOptionDto> poList = sellpageDao.getProductOption(pnum);
		
		
		
		//가져온 데이터를 mv에 추가
		mv.addObject("product", product);
		mv.addObject("pfList", pfList);
		mv.addObject("poList", poList);
		
		//보여질 페이지(jsp) 이름 지정
		mv.setViewName("productUpdate");
		
		return mv;
	}


	public String updateProduct(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		int pnum = Integer.parseInt(multi.getParameter("pnum"));	
		
		String pname = multi.getParameter("pname");
		int pprice = Integer.parseInt(multi.getParameter("pprice"));
		int ppoint = Integer.parseInt(multi.getParameter("ppoint"));
		String pinfo = multi.getParameter("pinfo");
		System.out.println("pinfo="+pinfo);
		int pquantity = Integer.parseInt(multi.getParameter("pquantity"));
		String pcategory = multi.getParameter("pcategory");
		
		
		//int optionnum = Integer.parseInt(multi.getParameter("optionnum"));
		String[] poption = multi.getParameterValues("poption");
		String[] choiceA = multi.getParameterValues("choiceA");
		String[] choiceB = multi.getParameterValues("choiceB");
		String[] choiceC = multi.getParameterValues("choiceC");
		String[] optionnum = multi.getParameterValues("optionnum");
		
		for(int i=0; i<poption.length; i++) {
			ProductOptionDto poupdate = new ProductOptionDto();
			poupdate.setPoption(poption[i]);
			poupdate.setChoiceA(choiceA[i]);
			poupdate.setChoiceB(choiceB[i]);
			poupdate.setChoiceC(choiceC[i]);
			poupdate.setOptionnum(Integer.parseInt(optionnum[i]));
			poupdate.setPnum(pnum);
			
			sellpageDao.updateProductOption(poupdate);
		}

		
		String oriname = multi.getParameter("oriname");
		String sysname = multi.getParameter("sysname");
		
		
		
		//multi에서 데이터 추출 및 Dto에 삽입
		ProductDto product = new ProductDto();
		
		ProductFileDto pImage = new ProductFileDto();
		
		product.setPnum(pnum);
		product.setPname(pname);
		product.setPprice(pprice);
		product.setPpoint(ppoint);
		product.setPinfo(pinfo);
		product.setPquantity(pquantity);
		product.setPcategory(pcategory);
		
		/*
		product.setPoption(poption);
		product.setChoiceA(choiceA);
		poupdate.setChoiceB(choiceB);
		poupdate.setChoiceC(choiceC);
		*/
		
		/*
		pfupdate.setPfnum(pfnum);
		pfupdate.setOriname(oriname);
		pfupdate.setSysname(sysname);
		*/
		
		String check = multi.getParameter("fileCheck");
		
		
		try {
			sellpageDao.updateProductInfo(product);
		
		//	smDao.productFileUpdate(pfupdate);
			
			if(check.equals("1")) {
				fileUpload(multi, pnum, product, true);
			}
			
			view = "redirect:/sellerPage";
			msg = "수정 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/productUpdate?pnum=" + pnum;
			msg = "수정 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	
	
	
	
	
	
	
	
	@Transactional
	public String productDelete(int pnum, RedirectAttributes rttr) {
			
		String view = null;
		String msg = null;
		
		try {		
			sellpageDao.deleteProductOption(pnum);			
			sellpageDao.deleteProductImage(pnum);
			sellpageDao.deleteProduct(pnum);	
			
			view= "redirect:/sellerPage";
			msg= "상품 등록 성공";
		}catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/sellerPage";
			msg = "상품등록 실패";
		}
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}
	
	
	
	//Q&A
	@Transactional
	public Map<String, ShopQnADto> answerQuestion(ShopQnADto qna, HttpSession session) {
		Map<String, ShopQnADto> qmap = null;
		
		MemberDto seller = (MemberDto)session.getAttribute("sb");
		String sellerID = seller.getMemberId();
		qna.setSellerID(sellerID);
		
		try {
			//질문 삽입
			sellpageDao.insertAnswer(qna);
			//질문 목록 불러오기 및 qmap에 추가
			ShopQnADto answers = sellpageDao.selectQnaAnswer(qna.getSqnum());
			
			qmap = new HashMap<String, ShopQnADto>();
			qmap.put("answers", answers);
			
		} catch(Exception e) {
			e.printStackTrace();
			qmap = null;
		}
		
		return qmap;
	}

	@Transactional
	public String deleteProduct(int pnum, RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		try {		
			sellpageDao.deleteProductOption(pnum);			
			sellpageDao.deleteProductImage(pnum);
			sellpageDao.deleteProductQnA(pnum);
			sellpageDao.deleteProductReview(pnum);
			sellpageDao.deleteProduct(pnum);	

			view = "redirect:/sellerPage";
			msg = "상품 삭제 성공";
		}catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/sellerPage";
			msg = "상품 삭제 실패";
		}
		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	//주문 수정(주문 상태)
		@Transactional
		public String deliverOrder(int orderNum, RedirectAttributes rttr) {
			log.info("deliverOrder()");
			
			String view = null;
			String msg = null;
			
			try {
				//댓글 삭제
				sellpageDao.deliverProduct(orderNum);

				view = "redirect:/toSellerOrders";
				msg = "배송처리 되었습니다.";
				
			} catch(Exception e) {
				e.printStackTrace();
				view = "redirect:/toSellerOrders";
				msg = "배송처리 실패";
			}
			
			rttr.addFlashAttribute("msg", msg);
			
			return view;
		}	

		public String refundProcessing(int orderNum, String refundReason, HttpSession session, RedirectAttributes rttr) 
				throws IOException, InterruptedException {
					
			String view = "";
			String msg = "";		
			MyOrderDto order = cartDao.selectOrderInfo(orderNum);
			String customerId = order.getMemberId();
			
			MemberDto customer  = cartDao.selectMemberInfo(customerId);
			
			
			// 결제 취소용
			ExecApi execApi = new ExecApi();
			String refundResult = execApi.refundProcessing(order.getPaymentId(), order.getOrderPrice(), refundReason); 
			
			if(refundResult.equals("REFUND_SUCCESS") || refundResult.equals("REFUND_I_MEY_CHE_SO_ZU_MUN")) {
				cartDao.refundOrder(orderNum);
				sellpageDao.refundProduct(orderNum);
				
				int newPoint = customer.getMemberPoint() - order.getEarnedPoint();
				customer.setMemberPoint(newPoint);
				
				//받은 포인트 차감
				cartDao.subtractPoint(customer);
				
				msg = "정상적으로 환불작업이 완료되었습니다.";
				
			}
			else if(refundResult.equals("REFUND_UNAUTH")){
				msg = "인증 실패했습니다.(Unauthorized)";
			}
			else {
				msg = "카카오페이 환불작업을 실패하였습니다.";
			}
			
			rttr.addFlashAttribute("msg", msg);
			view = "redirect:toSellerOrders";
			return view;
			
		}
	
	
	
	
}//class end
