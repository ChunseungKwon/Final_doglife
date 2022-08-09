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

import com.doglife.db.dao.AdminDao;
import com.doglife.db.dto.AdoptionAppDto;
import com.doglife.db.dto.AdoptionListDto;
import com.doglife.db.dto.BoardDto;
import com.doglife.db.dto.DFilePicture;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.DogRecommendDto;
import com.doglife.db.dto.FaqDto;
import com.doglife.db.dto.FueneralDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MySupportDto;

import lombok.extern.java.Log;

@Service
@Log
public class AdminService {

	private ModelAndView mv;
	@Autowired
	private AdminDao adDao;
	
	public ModelAndView adminCustomerList() {
		mv = new ModelAndView();
				
		List<MemberDto> mDto = adDao.adminCustomerList();
		mv.addObject("mList", mDto);
		mv.setViewName("adminCustomerList");
		
		return mv;
	}

	public ModelAndView mManagement(ListDto list, HttpSession session) {
		log.info("serv.mManagement()");

		mv = new ModelAndView();

		List<MemberDto> mList = adDao.memberSelect(list);

		mv.addObject("mList", mList);

		mv.setViewName("adminCustomerList");

		return mv;
	}

	public String customerDelete(MemberDto member, RedirectAttributes rttr) {
		log.info("serv.customerDelete()");
		String view = null;
		String msg = null;


		try {
			adDao.customerDelete(member);

			view = "redirect:/adminSellerList";
			msg = "삭제 성공";
		}catch(Exception e) {
			view = "redirect:/adminSellerList";
			msg = "삭제 실패";
		}
		rttr.addFlashAttribute("msg", msg);


		return view;
	}

	public ModelAndView adoptManagement(HttpSession session) {
		log.info("serv.adoptManagement()");

		mv = new ModelAndView();

		List<AdoptionListDto> dogInfo = adDao.getDoginform(); //get dog info + Dog adoption status

		mv.addObject("adList", dogInfo);

		mv.setViewName("adminAdoptionList");

		return mv;
	}

	public ModelAndView adoptionApplication(int dogNum, HttpSession session, RedirectAttributes rttr) {
		log.info("serv.adoptionApplication");

		mv = new ModelAndView();

		String memberId = adDao.getCustomerId(dogNum);

		List<DFilePicture> pList = adDao.getDogPicture(dogNum);

		List<DogDto> dList = adDao.getDogInfo(dogNum);

		List<MemberDto> iList = adDao.getCustomerInfo(memberId);

		mv.addObject("pList", pList);
		mv.addObject("dList", dList);
		mv.addObject("iList", iList);

		mv.setViewName("adminAdoptionAppInfo");

		return mv;
	}

	public String adoptionDecline(int dogNum, RedirectAttributes rttr) {
		log.info("serv.adoptionDecline()");

		String view = null;
		String msg = null;

		try {
			adDao.adoptionDecline(dogNum);

			view = "redirect:/adoptManagement";
			msg = "입양 거절";

		}catch(Exception e) {
			view = "redirect:/adoptManagement";
			msg = "입양 거절 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public String adoptionApprove(int dogNum, RedirectAttributes rttr) {
		log.info("serv.adoptionApprove()");

		String view = null;
		String msg = null;

		try {
			adDao.adoptionApprove(dogNum);

			view = "redirect:/adoptManagement";
			msg = "입양 승인";

		}catch(Exception e) {
			view = "redirect:/adoptManagement";
			msg = "입양 승인 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public ModelAndView funeralManagement(HttpSession session) {
		log.info("serv.funeralManagement()");

		mv = new ModelAndView();

		List<FueneralDto> pList = adDao.frProgress("예약중");
		List<FueneralDto> fList = adDao.frOver("완료");

		mv.addObject("pList", pList);
		mv.addObject("fList", fList);

		return mv;
	}

	public ModelAndView funeralUpdate(int frNum) {
		mv = new ModelAndView();

		FueneralDto fList = adDao.frInfo(frNum);

		mv.addObject("fList", fList);

		mv.setViewName("funeralUpdate");

		return mv;
	}

	//adoptionReRegister (입양 등록 수정(리스트 출력)
	public ModelAndView adoptionReRegisterSel(int dogNum) {
		mv = new ModelAndView();
		List<DFilePicture> dfpDto = adDao.adoptionReRegisterPic(dogNum);

		DogDto dogDto = adDao.adoptionReRegisterSel(dogNum);

		mv.addObject("dfpDto", dfpDto);
		mv.addObject("dogDto", dogDto);

		mv.setViewName("adoptionReRegister");

		return mv;
	}

	public String AdoptionInfoUpdate(MultipartHttpServletRequest multi) {
		String view = null;

		int dogNum = Integer.parseInt(multi.getParameter("dogNum"));
		String dogName = multi.getParameter("dogName");
		int dogAge = Integer.parseInt(multi.getParameter("dogAge"));
		String dogGender = multi.getParameter("dogGender");
		String dogBreed = multi.getParameter("dogBreed");
		String dogVaccine = multi.getParameter("dogVaccine");
		int dogPrice = Integer.parseInt(multi.getParameter("dogPrice"));
		String check = multi.getParameter("fileCheck");


		DogDto dogDto = new DogDto();
		dogDto.setDogNum(dogNum);
		dogDto.setDogName(dogName);
		dogDto.setDogAge(dogAge);
		dogDto.setDogGender(dogGender);
		dogDto.setDogBreed(dogBreed);
		dogDto.setDogVaccine(dogVaccine);
		dogDto.setDogPrice(dogPrice);

		try {
			adDao.AdoptionInfoUpdate(dogDto);

			if (check.equals("1")) {
				fileUpload(multi, dogDto.getDogNum(), dogDto);
				adDao.dFileReset(dogDto);

				DFilePicture dPic = adDao.dPicSelect(dogDto);

				adDao.dFileUpload(dPic);
			}
			view = "redirect:/adoptManagement";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adoptionReRegister";
		}

		return view;
	}

	private void fileUpload(MultipartHttpServletRequest multi, int dogNum, DogDto dogDto) throws Exception{
		// request의 서버 정보에서 프로젝트 폴더의 절대 위치 정보 구하기.
		String realPath = multi.getServletContext().getRealPath("/");

		// 파일을 저장할 경로를 절대경로에 추가
		realPath += "resources/upload/";
		log.info(realPath);

		// upload 폴더가 없을 경우 새로 생성.
		File folder = new File(realPath);
		if (folder.isDirectory() == false) {
			// isDirectory() : 폴더의 존재 유무 및
			// 폴더인지 파일인지의 여부 확인 메소드
			folder.mkdir();// 폴더 생성 메소드
		}

		System.out.println("$$$$$$$$$$$$$" + dogNum);

		// 1. 파일 정보를 DB(boardfile) 테이블에 저장(글번호, 원래이름, 변경이름)
		// 파일 정보는 HashMap을 사용하여 저장.
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("dogNum", String.valueOf(dogNum));

		// multi에서 file 태그의 name 값 꺼내기
		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String fn = files.next();
			String a = null;
			String b = null;
			// multiple 선택 파일 처리 -> 파일 목록 가져오기
			List<MultipartFile> fList = multi.getFiles(fn);

			// 각각의 파일을 처리(파일명 추출, 파일을 폴더에 저장)
			for (int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);

				// 파일명 추출
				String oriname = mf.getOriginalFilename();

				// 변경할 이름 생성
				String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));

				if(i==0) {
					a = oriname;
					b = sysname;
				}
				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);

				// upload 폴더 파일 저장
				File ff = new File(realPath + sysname);
				mf.transferTo(ff);

				// DB에 파일정보 저장
				adDao.fileInsert(fmap);	
			}

			dogDto.setThumbnail(a);
			dogDto.setThumbnailsys(b);

			adDao.dFileUpdate(dogDto);

		}
	}

	public ModelAndView adminApplicationList(AdoptionAppDto apDto) {
		mv = new ModelAndView();
		List<AdoptionListDto> appDto = adDao.adminApplicationList(apDto);
		mv.addObject("appDto", appDto);
		System.out.println("!@3"+appDto);
		mv.setViewName("adminApplicationList");

		return mv;
	}

	public ModelAndView adminAdoptionAppInfo(int aaKey, int dogNum) {
		mv = new ModelAndView();
		AdoptionListDto adopList = adDao.adminAdoptionAppInfo(aaKey);
		AdoptionAppDto appList = adDao.adminAdoptionAppInfo2(aaKey);
		List<DFilePicture> dfList = adDao.adminAdoptionAppInfo3(dogNum);
		
		mv.addObject("adopList", adopList);
		mv.addObject("appList", appList);
		mv.addObject("dfList", dfList);
		System.out.println(appList+"!!!");
		mv.setViewName("adminAdoptionAppInfo");
		return mv;
	}

	public String adminApplicationOk(AdoptionAppDto appDto) {
		String view = null;
		try {
			adDao.adminApplicationOk(appDto);
			System.out.println(appDto +"123");
			adDao.adminAppDog(appDto);
			System.out.println(appDto +"456");
			view = "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adminAdoptionAppInfo";
		}


		return view;
	}

	public String deleteAdoptionList(int dogNum) {
		String view = null;

		try {
			//입양 리스트에서 데이터 삭제
			adDao.ListDelete(dogNum);
			view = "redirect:/adoptManagement";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adoptManagement";
		}
		return view;
	}

	public Map<String, List<DFilePicture>> dogFileDelete(String sysname, int dogNum, HttpSession session) {
		Map<String, List<DFilePicture>> fMap = null;

		String realPath = session.getServletContext().getRealPath("/");
		realPath += "resources/upload/" + sysname;
		log.info(realPath);

		try {
			adDao.dogFileDelete(sysname);

			File file = new File(realPath);

			if (file.exists()) {
				if (file.delete()) {

					List<DFilePicture> fList = adDao.dogFileSelect(dogNum);
					fMap = new HashMap<String, List<DFilePicture>>();
					fMap.put("AList", fList);
				} else {
					fMap = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			fMap = null;
		}

		return fMap;
	}

	
	public ModelAndView adoptregi() {
		mv = new ModelAndView();
		List<FaqDto> fDto = adDao.faqselect();
		mv.addObject("fDto", fDto);
		mv.setViewName("adoptregi");
		return mv;
	}
	
	public String faqinsert(FaqDto fDto) {
		String view = null;

		try {
			adDao.faqinsert(fDto);
			view = "redirect:/adoptregi";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adoptregi";
		}

		return view;
	}
	
	public String faqupdate(FaqDto faqNum, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			adDao.faqupdate(faqNum);
			view = "redirect:/adoptregi";
			msg = "수정성공";
		} catch (Exception e) {
			System.out.println("@@@@@@@@@@@@@@" + faqNum);
			e.printStackTrace();

		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}
	
	@Transactional
	public String faqdeletee(FaqDto faqNum, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			adDao.faqdeletee(faqNum);

			view = "redirect:/adoptregi";
			msg = "삭제성공";
		} catch (Exception e) {

			view = "redirect:/adoptregi";
			msg = "삭제실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;

	}
	
	public ModelAndView indivsupport5(int msNum, HttpSession session) {
		mv = new ModelAndView();

		MemberDto mDto = (MemberDto) session.getAttribute("mb");

		MySupportDto tDto = adDao.anyindiselect(msNum);

		System.out.println(tDto + "@@@@@@@@@@");
		System.out.println(mDto);
		mv.addObject("m", mDto);
		mv.addObject("sList", tDto);
		mv.setViewName("indivsupport5");
		return mv;
	}
	
	public String adsupdelete(MySupportDto sDto, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			adDao.supdelete(sDto);
			view = "redirect:/indivsupport3_1";
			msg = "삭제 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/indivsupport3_1";
			msg = "삭제 실패";
		}
		rttr.addFlashAttribute("msg", msg);
		return view;
	}
	
	public String regianwer(MySupportDto sDto, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			adDao.regianwer(sDto);
			
			System.out.println(sDto + "####################");
			view = "redirect:/indivsupport3_1";
			msg = "답변 완료";
			
		} catch (Exception e) {

			System.out.println(sDto + "####################");
			view = "redirect:/indivsupport3_1";
			msg = "답변 실패";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public ModelAndView showAdminNotice(HttpSession session, BoardDto anDto) {
		mv = new ModelAndView();

		List<BoardDto> anList = adDao.showAdminNotice(anDto);

		mv.addObject("anList", anList);

		mv.setViewName("adminNotice");

		return mv;
	}

	public ModelAndView adoptionRegister(HttpSession session) {
		mv = new ModelAndView();

		List<DogRecommendDto> bList = adDao.selectdogBreed();

		mv.addObject("bList", bList);

		mv.setViewName("adoptionRegister");

		return mv;
	}
	
	public String adminAnnouncementInsert(HttpSession session, BoardDto anDto) {
		String view = null;

		try {
			adDao.adminAnnouncementInsert(anDto);
			log.info("adminAnnouncementInsert : " + anDto);

			view = "redirect:/adminNotice";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adminNotice";
		}

		return view;
	}
	
	public ModelAndView noticeUpdate(HttpSession session, BoardDto anDto, int anum) {
		mv = new ModelAndView();

		BoardDto c = adDao.showNoticeUpdate(anum);

		mv.addObject("c", c);

		mv.setViewName("noticeUpdate");

		return mv;
	}
	
	public ModelAndView selectNotice() {
		mv = new ModelAndView();

		List<BoardDto> adoptList = adDao.noticeSelect();

		mv.addObject("adoptList", adoptList);

		mv.setViewName("notice");

		return mv;
	}
	
	public String noticeUpdateT(HttpSession session, BoardDto anDto) {
		String view = null;

		try {
			adDao.noticeUpdateT(anDto);

			view = "redirect:/adminNotice";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/";
		}

		return view;
	}
	
	@Transactional
	public String dogRegister(MultipartHttpServletRequest multi) {

		String view = null;
		String msg = null;

		HttpSession session = multi.getSession();

		// multi에서 데이터를 추출(게시글의 텍스트 부분)

		String fcheck = multi.getParameter("fileCheck");
		String dogName = multi.getParameter("dogName");
		int dogAge = Integer.parseInt(multi.getParameter("dogAge"));
		String dogGender = multi.getParameter("dogGender");
		String dogBreed = multi.getParameter("dogBreed");
		String dogVaccine = multi.getParameter("dogVaccine");
		int dogPrice = Integer.parseInt(multi.getParameter("dogPrice"));

		try {
			// 추출한 데이터를 dto에 삽입.
			DogDto dogRegister = new DogDto();
			dogRegister.setDogName(dogName);
			dogRegister.setDogAge(dogAge);
			dogRegister.setDogGender(dogGender);
			dogRegister.setDogBreed(dogBreed);
			dogRegister.setDogVaccine(dogVaccine);
			dogRegister.setDogPrice(dogPrice);

			adDao.dogRegisterInsert(dogRegister);
			
			if (fcheck.equals("1")) {
				
				dogFileUpload(multi, dogRegister.getDogNum(), dogRegister);
			}

			view = "redirect:/toAdoptionList?pageNum=1";

		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/adoptionRegister";

		}

		return view;

	}
	
	private void dogFileUpload(MultipartHttpServletRequest multi, int dogNum, DogDto dogRegister) throws Exception {
		// request의 서버 정보에서 프로젝트 폴더의 절대 위치 정보 구하기.
		String realPath = multi.getServletContext().getRealPath("/");

		// 파일을 저장할 경로를 절대경로에 추가
		realPath += "resources/upload/";
		log.info(realPath);

		// upload 폴더가 없을 경우 새로 생성.
		File folder = new File(realPath);
		if (folder.isDirectory() == false) {
			// isDirectory() : 폴더의 존재 유무 및
			// 폴더인지 파일인지의 여부 확인 메소드
			folder.mkdir();// 폴더 생성 메소드
		}

		

		// 1. 파일 정보를 DB(boardfile) 테이블에 저장(글번호, 원래이름, 변경이름)
		// 파일 정보는 HashMap을 사용하여 저장.
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("dogNum", String.valueOf(dogNum));

		// multi에서 file 태그의 name 값 꺼내기
		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String fn = files.next();
			String a = null;
			String b = null;
			// multiple 선택 파일 처리 -> 파일 목록 가져오기
			List<MultipartFile> fList = multi.getFiles(fn);

			// 각각의 파일을 처리(파일명 추출, 파일을 폴더에 저장)
			for (int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);

				// 파일명 추출
				String oriname = mf.getOriginalFilename();

				// 변경할 이름 생성
				String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));

				if (i == 0) {
					a = oriname;
					b = sysname;
				}
				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);

				// upload 폴더 파일 저장
				File ff = new File(realPath + sysname);
				mf.transferTo(ff);

				// DB에 파일정보 저장
				adDao.fileInsert(fmap);
			}

			dogRegister.setThumbnail(a);
			dogRegister.setThumbnailsys(b);

			adDao.dFileUpdate(dogRegister);

		}
	}
	
	//공지사항 삭제
	public String delNotice(int anum) {
		String view = null;
		
		try {
			adDao.NoticeDelete(anum);
			view = "redirect:/adminNotice";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/adminNotice";
		}
		
		return view;
	}

	public ModelAndView indivsupport3_1() {
		mv = new ModelAndView();

		List<MySupportDto> sList = adDao.indiselect();

		mv.addObject("sList", sList);
		
		mv.setViewName("indivsupport3_1");
		return mv;
	}

	public ModelAndView adminSellerList() {
		List<MemberDto> sList = adDao.adminSellerList();
		mv.addObject("sList",sList);
		mv.setViewName("adminSellerList");
		return mv;
	}
	
}
