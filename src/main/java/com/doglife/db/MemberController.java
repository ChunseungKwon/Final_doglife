package com.doglife.db;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.MemberDao;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
public class MemberController {

	private ModelAndView mv;

	@Autowired
	private MemberService mServ;

	@Autowired
	private MemberDao mDao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@GetMapping("/toMemberRegister")
	public String toMemberRegister() {
		return "register_go";
	}

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@PostMapping("/memInsert")
	public String memInsert(MemberDto mem, RedirectAttributes rttr) {
		String view = mServ.memberInsert(mem, rttr);

		return view;
	}

	@GetMapping(value = "/idCheck", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck(String mid) {
		log.info("idCheck() - mid : " + mid);

		String res = mServ.idCheck(mid);
		log.info(res);
		return res;
	}

	@GetMapping("/toLogin")
	public String toLogin() {
		return "login";
	}

	@GetMapping("/idcheckfrm")
	public String idcheckfrm() {
		return "idcheckfrm";
	}

	@GetMapping("/pwdcheckfrm")
	public String pwdcheckfrm() {
		return "pwdcheckfrm";
	}

	@PostMapping("/loginProc")
	public String loginProc(MemberDto mem, HttpSession session, RedirectAttributes rttr, String typee) {
		log.info("loginProc()");

		String view = mServ.loginProc(mem, session, rttr, typee);

		return view;
	}

	@GetMapping("/main")
	public String maingo() {
		return "main";
	}

	@PostMapping(value = "/idsearch", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck1(MemberDto member) {
		String res = mServ.userIdSearch(member);
		log.info(res);
		return res;
	}

	@PostMapping(value = "/pwdauth")
	public ModelAndView pwdauth(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {
		String email = (String) request.getParameter("memberId");
		String name = (String) request.getParameter("memberName");
		String msg = null;

		MemberDto mDto = mDao.find_pwd(email);

		if (mDto != null) {
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

			if (mDto.getMemberName().equals(name)) {
				session.setAttribute("memberId", mDto.getMemberId());

				/* 이메일 보내기 */
				String setFrom = "tmdrnjs0926@naver.com";
				String toMail = email;
				String title = "회원가입 인증 이메일 입니다.";
				String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
						+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					helper.setText(content, true);
					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}
				ModelAndView mv = new ModelAndView();
				mv.setViewName("pwd_auth");
				mv.addObject("checkNum", checkNum);
				msg = "이메일로 인증번호를 발송하였습니다";
				mv.addObject("msg", msg);
				return mv;
			} else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("pwdcheckfrm");
				msg = "이름을 다시 확인해주세요";
				mv.addObject("msg", msg);
				return mv;
			}
		} else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("pwdcheckfrm");
			msg = "이메일주소를 다시 확인해주세요";
			mv.addObject("msg", msg);
			return mv;
		}
	}

	@PostMapping(value = "/find_id", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String find_id(@RequestParam("memberName") String memberName,
			@RequestParam("memberPnum") String memberPnum) {

		String result = mServ.find_id(memberName, memberPnum);

		return result;
	}

	@PostMapping("/pwd_set")
	public String pwdset(@RequestParam(value = "num") String num, @RequestParam(value = "auth") String auth,
			RedirectAttributes rttr) {
		String msg = null;
		String view = null;

		if (num.equals(auth)) {
			view = "pwd_setting";
			return view;
		} else {
			msg = "인증번호가 틀렸습니다";
			view = "redirect:/pwdcheckfrm";

			rttr.addFlashAttribute("msg", msg);
			return view;

		}
	}

	@PostMapping("/pwd_new")
	public String pwd_new(MemberDto mDto) throws IOException {
		int result = mDao.updatePwd(mDto);
		String view = null;

		if (result == 1) {
			String encpwd = pwdEncoder.encode(mDto.getMemberPwd());
			mDto.setMemberPwd(encpwd);
			log.info(encpwd + "@@@@@@@@@@@@@@@@@@@@@@@@");

			mDao.updateinPwd(encpwd);

			view = "login";
		}

		else {
			view = "main";
		}
		return view;
	}

	@GetMapping("/mypage_update")
	public String mypageupdate() {
		String view = "mypage_update";
		return view;
	}

	@PostMapping("/updateAd")
	public String updateAd(@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "uppassword") String uppassword, MemberDto mem, HttpSession session,
			RedirectAttributes rttr) {
		String view = mServ.updateAd(memberId, uppassword, mem, session, rttr);
		return view;
	}

	

	@GetMapping("/updateadm")
	public String updateadm(MemberDto mDto) throws IOException {
		int result = mDao.updatePwd(mDto);
		String view = null;

		if (result == 1) {
			String encpwd = pwdEncoder.encode(mDto.getMemberPwd());
			mDto.setMemberPwd(encpwd);

			mDao.updateinPwd(encpwd);

			view = "login";
		}

		else {
			view = "main";
		}
		return view;
	}

	@PostMapping("/updateAd1")
	public String updateAd1(MemberDto mDto, HttpSession session) {
		String view = mServ.updateAdm(mDto, session);
		return view;
	}

	@GetMapping("/mypage_update3")
	public String mypage_update3() {
		return "mypage_update3";
	}

	@GetMapping("/mypage_delete")
	public String mypage_delete() {
		return "mypage_delete";
	}

	@GetMapping("/joinSeller")
	public String joinSeller() {
		return "joinSeller";
	}

	@PostMapping("/sellerInsert")
	public String sellerInsert(MemberDto member, RedirectAttributes rttr) {
		String view = null;
		view = mServ.sellerInsert(member, rttr);
		return view;
	}

	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		log.info("jusoPopup()");

		return "jusoPopup";
	}
	
	@GetMapping("/tologout")
	public String logout(HttpSession session,RedirectAttributes rttr) {
		log.info("logout()");
		
		String view = mServ.logout(session,rttr);
		
		return view;
	}
}
