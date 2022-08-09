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

import com.doglife.db.dao.AdoptionDao;
import com.doglife.db.dto.DogRecommendDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.iamport.ExecApi;
import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.DogReviewDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class AdoptionService {

	private ModelAndView mv;

	@Autowired
	private AdoptionDao aDao;

	int listCnt = 8;

	public ModelAndView showBreedRecommend(HttpSession session) {
		log.info("serv.showBreedRecommend");
		mv = new ModelAndView();

		List<DogRecommendDto> breedList = aDao.getBreedRecommend();

		mv.addObject("breedList", breedList);

		mv.setViewName("breedRecommend");

		return mv;
	}

	public ModelAndView showAdoptionlist(ListDto list, HttpSession session) {
		log.info("serv.showAdoption()");
		mv = new ModelAndView();

		int pageNum = list.getPageNum();
		list.setPageNum((pageNum - 1) * listCnt);
		list.setListCnt(listCnt);

		List<DogDto> bList = aDao.adoptionListSelect(list);

		mv.addObject("bList", bList);

		list.setPageNum(pageNum);

		String pageHtml = getAdoptionPaging(list);

		mv.addObject("pageHtml", pageHtml);

		session.setAttribute("pageNum", list.getPageNum());

		if (list.getColname() != null) {
			session.setAttribute("list", list);
		} else {
			session.removeAttribute("list");
		}

		mv.setViewName("adoptionlist");

		return mv;
	}

	// Review Page Html Production algorithm


	public ModelAndView showAdoptionReview(ListDto list, HttpSession session) {
		log.info("serv.showAdoptionReview()");

		mv = new ModelAndView();

		int pageNum = list.getPageNum();
		list.setPageNum((pageNum - 1) * listCnt);
		list.setListCnt(listCnt);

		System.out.println(list);

		List<DogReviewDto> reviewList = aDao.getAdoptionReview(list);
		list.setPageNum(pageNum);
		
		String pageHtml = getReviewPaging(list);
		

	

		mv.addObject("pageHtml", pageHtml);
		mv.addObject("rList", reviewList);
		session.setAttribute("pageNum", list.getPageNum());


		System.out.println(reviewList);
		mv.setViewName("adoptionReviewList");

		return mv;
	}
	
	
	
	

	// Review Page Html Production algorithm
	public String getReviewPaging(ListDto list) {
		log.info("serv.getPaging()");

		String pageHtml = null;

		int maxNum = aDao.reviewCountSelect(list); // all post #

		int pageCnt = 5; // post per page

		String listName = "adoptionReview?";

		if (list.getColname() != null) {
			listName = "colname=" + list.getColname() + "&keyword=" + list.getKeyword() + "&";
		}
		PagingUtil paging = new PagingUtil(maxNum, list.getPageNum(), listCnt, pageCnt, listName);

		pageHtml = paging.makePaging();

		return pageHtml;
	}

	public String adoptionReviewRegister(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		log.info("serv.adoptionReviewRegister()");

		HttpSession session = multi.getSession();

		String view = null;
		String msg = null;

		String id = multi.getParameter("memberId");
		String title = multi.getParameter("drTitle");
		String contents = multi.getParameter("drContents");
		String fileCheck = multi.getParameter("fileCheck");
		int dogNum = Integer.parseInt(multi.getParameter("dogNum"));

		contents = contents.trim();

		DogReviewDto dogReview = new DogReviewDto();
		dogReview.setMemberId(id);
		dogReview.setDrTitle(title);
		dogReview.setDrContent(contents);
		dogReview.setDogNum(dogNum);

		try {
			aDao.adoptionReviewRegister(dogReview);

			if (fileCheck.equals("1")) {
				fileUpload(multi, dogReview.getDogNum(), dogReview.getDrNum());
			}

			view = "redirect:/toAboutUs";
			msg = "작성 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/";
			msg = "작성 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	private void fileUpload(MultipartHttpServletRequest multi, int dogNum, int drNum)
			throws IllegalStateException, IOException {
		String realPath = multi.getServletContext().getRealPath("/");

		realPath += "resources/upload/";
		log.info(realPath);

		File folder = new File(realPath);
		if (folder.isDirectory() == false) {
			folder.mkdir();
		}

		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("drNum", String.valueOf(drNum));
		fmap.put("dogNum", String.valueOf(dogNum));

		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String fn = files.next();

			List<MultipartFile> fList = multi.getFiles(fn);

			for (int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);

				String oriname = mf.getOriginalFilename();

				String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));

				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);

				File ff = new File(realPath + sysname);
				mf.transferTo(ff);

				aDao.fileInsert(fmap);
			}
		}

	}

	public ModelAndView updateFrm(int drNum) {
		mv = new ModelAndView();

		DogReviewDto drReview = aDao.reviewSelect(drNum);
		List<DFilePicture> fList = aDao.fileSelect(drNum);

		mv.addObject("drReview", drReview);
		mv.addObject("fList", fList);

		mv.setViewName("adoptionReviewUpdate");

		return mv;
	}

	@Transactional
	public String boardUpdate(MultipartHttpServletRequest multi) {
		String view = null;

		int dogNum = Integer.parseInt(multi.getParameter("dogNum").trim());
		int drNum = Integer.parseInt(multi.getParameter("drNum").trim());
		log.info("############# : " + drNum);

		DogReviewDto dReview = new DogReviewDto();

		dReview.setDrNum(drNum);
		dReview.setDogNum(dogNum);
		dReview.setDrTitle(multi.getParameter("title"));
		dReview.setDrContent(multi.getParameter("contents"));
		String check = multi.getParameter("fileCheck");

		try {
			aDao.ReviewUpdate(dReview);
			System.out.println("review : " + dReview);
			System.out.println("check : " + check);
			if (check.equals("1")) {
				System.out.println("check : " + check);
				fileUpload(multi, dogNum, drNum);
				System.out.println("fileUpload : " + dogNum + "—" + drNum);
			}
			view = "redirect:/adoptionReviewUpdate?drNum=" + drNum;
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/home2";
		}

		return view;
	}

	public String deleteAdoptionFile(int drNum, RedirectAttributes rttr) {
		log.info("deleteAdoptionFile()");

		String view = null;
		String msg = null;

		try {
			aDao.deleteAdoptionFile(drNum);

			aDao.boardDelete(drNum);

			view = "redirect:/adoptionlist?pageNum=1";
			msg = "게시글 삭제 성공";
		} catch (Exception e) {
			view = "redirect:/adoptionlist?drNum=" + drNum;
			msg = "게시글 삭제 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public Map<String, List<DFilePicture>> fileDelete(String sysname, int drNum, HttpSession session) {
		Map<String, List<DFilePicture>> dFMap = null;

		String realPath = session.getServletContext().getRealPath("/");
		realPath += "resources/upload/" + sysname;
		log.info(realPath);

		try {
			aDao.fileDelete(sysname);
			File file = new File(realPath);

			if (file.exists()) {
				if (file.delete()) {
					List<DFilePicture> dfList = aDao.fileSelect(drNum);
					dFMap = new HashMap<String, List<DFilePicture>>();

					dFMap.put("dfList", dfList);
				} else {
					dFMap = null;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dFMap = null;
		}
		return dFMap;
	}

	public ModelAndView toAdoptionList(ListDto list) {
		mv = new ModelAndView();

		int pageNum = list.getPageNum();

		list.setPageNum((pageNum - 1) * listCnt);
		list.setListCnt(listCnt);

		List<DogRecommendDto> bList = aDao.getbList();

		List<DogDto> dList = aDao.getdList(list);

		list.setPageNum(pageNum);
		String pageHtml = getAdoptionPaging(list);

		mv.addObject("bList", bList);
		mv.addObject("dList", dList);
		mv.addObject("pageHtml", pageHtml);
		mv.setViewName("adoptionList");

		return mv;
		
		
		
	}
	
	public String getAdoptionPaging(ListDto list) {
		log.info("serv.getPaging()");

		String pageHtml = null;

		int maxNum = aDao.adoptionCountSelect(list); // all post #

		int pageCnt = 5; // post per page

		String listName = "toAdoptionList?";

		if (list.getColname() != null) {
			listName = "colname=" + list.getColname() + "&keyword=" + list.getKeyword() + "&";
		}
		PagingUtil paging = new PagingUtil(maxNum, list.getPageNum(), listCnt, pageCnt, listName);

		pageHtml = paging.makePaging();

		return pageHtml;
	}
	public ModelAndView getDogList(HttpSession session) {
		mv = new ModelAndView();

		List<DogDto> dList = aDao.dogListSelect();
		mv.addObject("dList", dList);

		mv.setViewName("adoptionList");

		return mv;
	}

	public ModelAndView getAppList(HttpSession session, int dogNum) {
		mv = new ModelAndView();

		DogDto dogDto = aDao.showDogInfo(dogNum);
		mv.addObject("dogDto", dogDto);

		mv.setViewName("adoptionapp2");
		return mv;
	}

	public ModelAndView adoptionInfo(HttpSession session, int dogNum) {
		mv = new ModelAndView();
		List<DFilePicture> dpList = aDao.dogpicSelect(dogNum);
		DogDto ddList = aDao.dogdSelect(dogNum);

		mv.addObject("dpList", dpList);

		mv.addObject("ddList", ddList);

		mv.setViewName("adoptionapp2");
		return mv;
	}

	public String userDogRegister(HttpSession session, AdoptionAppDto appDto) {
		String view = null;

		appDto.setMemberId((String) session.getAttribute("memberId"));
		try {
			int dogNum = appDto.getDogNum();
			aDao.dogStatusUpdate(dogNum);
			aDao.userDogRegister(appDto);

			view = "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/adoptionList";
		}
		return view;
	}

	public ModelAndView adoptionapp3(AdoptionAppDto aDto, HttpSession session) {
		mv = new ModelAndView();

		int dogNum = aDto.getDogNum();

		DogDto ddList = aDao.showDogInfo(dogNum);

		mv.addObject("ddList", ddList);
		mv.addObject("aDto", aDto);

		mv.setViewName("adoptionapp3");

		return mv;
	}

	public String delAdoptionInfo(int aaKey, int rType, RedirectAttributes rttr)
			throws IOException, InterruptedException {
		String view = null;
		String msg = null;
		String reason = "";
		AdoptionAppDto aaDto = aDao.selectAdoptionAppInfo(aaKey);

		ExecApi execApi = new ExecApi();
		String refundResult = execApi.refundProcessing(aaDto.getAaPayNo(), aaDto.getDogPrice(), reason);

		if (refundResult.equals("REFUND_SUCCESS") || refundResult.equals("REFUND_I_MEY_CHE_SO_ZU_MUN")) {
			aDao.deleteAdoptionProc(aaKey);
			aDao.updateDogStatus(aaDto.getDogNum());
			msg = "정상적으로 환불작업이 완료되었습니다.";
		} else if (refundResult.equals("REFUND_UNAUTH")) {
			msg = "인증 실패했습니다.(Unauthorized)";
		} else {
			msg = "카카오페이 환불작업을 실패하였습니다.";
		}

		if (rType == 1) {

			view = "redirect:/myadoption";
		} else {

			view = "redirect:/adminApplicationList";
		}
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	

	
}
