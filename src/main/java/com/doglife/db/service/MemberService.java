package com.doglife.db.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.MemberDao;
import com.doglife.db.dto.MemberDto;

import lombok.extern.java.Log;

@Service
@Log
public class MemberService {

	
	@Autowired
	private MemberDao mDao;
	
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	public String sellerInsert(MemberDto member, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		String encpwd = pwdEncoder.encode(member.getMemberPwd());

		member.setMemberPwd(encpwd);
		member.setMemberType("2");
		
		try {
			mDao.memberInsert(member);

			view = "redirect:/";
			msg = "가입성공";

		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/join";
			msg = "가입 실패";
		}
		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public String memberInsert(MemberDto member, RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		String encpwd = pwdEncoder.encode(member.getMemberPwd());

		member.setMemberPwd(encpwd);
		member.setMemberType(member.getMemberType());

		try {
			mDao.memberInsert(member);

			view = "redirect:/";
			msg = "가입성공";

		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/join";
			msg = "가입 실패";
		}
		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public String idCheck(String memberId) {
		String res = null;

		int cnt = mDao.idCheck(memberId);

		if (cnt == 0) {
			res = "ok";
		} else {
			res = "not";
		}

		return res;
	}

	public String idsearch(MemberDto member) {
		String memberId = "";

		try {
			memberId = mDao.idsearch(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberId;
	}

	public String loginProc(MemberDto mem, HttpSession session, RedirectAttributes rttr, String typee) {
		String view = null;
		String msg = null;

		String encPwd = mDao.pwdSelect(mem.getMemberId());
		
		String num = mDao.typecheck(mem.getMemberId());

		try {
			if (num.equals("1")) {
				if (encPwd != null) {

					if (pwdEncoder.matches(mem.getMemberPwd(), encPwd)) {

						mem = mDao.upmemberSelect(mem.getMemberId());
							session.setAttribute("mb", mem);
							session.setAttribute("memberId", mem.getMemberId());
							session.setAttribute("memberType", mem.getMemberType());
							System.out.println(mem.getMemberType());
						view = "redirect:/";

					} else {

						view = "redirect:/toLogin";
						msg = "비밀번호 오류";
					}
				} else {

					view = "redirect:/toLogin";
					msg = "없는 아이디";
				}

				rttr.addFlashAttribute("msg", msg);

			} else if (num.equals("2")) {
				if (encPwd != null) {

					if (pwdEncoder.matches(mem.getMemberPwd(), encPwd)) {

						mem = mDao.upmemberSelect(mem.getMemberId());
						session.setAttribute("sb", mem);
						session.setAttribute("memberId", mem.getMemberId());
						session.setAttribute("memberType", mem.getMemberType());
						System.out.println(mem.getMemberType());
						view = "redirect:/sellerPage";
						
					} else {

						view = "redirect:/toLogin";
						msg = "비밀번호 오류";
					}
				} else {

					view = "redirect:/toLogin";
					msg = "없는 아이디";
				}

				rttr.addFlashAttribute("msg", msg);

			} else if (num.equals("3")) {
				if (encPwd != null) {

					if (pwdEncoder.matches(mem.getMemberPwd(), encPwd)) {

						mem = mDao.upmemberSelect(mem.getMemberId());
						session.setAttribute("ad", mem);
						session.setAttribute("memberId", mem.getMemberId());
						session.setAttribute("memberType", mem.getMemberType());
						System.out.println(mem.getMemberType());
						view = "redirect:/adminNotice";
						
					} else {

						view = "redirect:/toLogin";
						msg = "비밀번호 오류";
					}
				} else {

					view = "redirect:/toLogin";
					msg = "없는 아이디";
				}

				rttr.addFlashAttribute("msg", msg);

			}
		} catch (Exception e) {
			e.printStackTrace();

			view = "redirect:/toLogin";
			msg = "없는 아이디";

			rttr.addFlashAttribute("msg", msg);

		}

		return view;
	}

	public String userIdSearch(MemberDto mem) {
		String userId = "";

		try {
			userId = mDao.idsearch(mem);
			System.out.println(userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userId;
	}

	public String find_id(String memberName, String memberPnum) {
		// TODO Auto-generated method stub
		String result = "";

		try {
			result = mDao.find_id(memberName, memberPnum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public String updateAd(@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "uppassword") String uppassword, MemberDto mem, HttpSession session,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		String encPwd = mDao.pwdSelect(memberId);

		if (encPwd != null)
			if (pwdEncoder.matches(uppassword, encPwd)) {
				
				mem = mDao.upmemberSelect(memberId);
				mDao.deletead(memberId);
				session.invalidate();
				
				view = "redirect:/";
				msg = "회원탈퇴입니다";
				
			} else {
				msg = "비밀번호가 틀렸습니다";
				view = "redirect:/mypage_delete";
			}
		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	public String updateAdm(MemberDto mDto, HttpSession session) {
		String view = null;
		
		String encpwd = pwdEncoder.encode(mDto.getMemberPwd());
		String pnum = mDto.getMemberPnum();
		String addr = mDto.getMemberAddr();
		String bdate = mDto.getMemberBdate();
		String memberId = mDto.getMemberId();
		String memberName = mDto.getMemberName();

		MemberDto mdto = new MemberDto();
		mdto.setMemberName(memberName);
		mdto.setMemberId(memberId);
		mdto.setMemberPwd(encpwd);
		mdto.setMemberPnum(pnum);
		mdto.setMemberAddr(addr);
		mdto.setMemberBdate(bdate);

		mDao.updateinadm1(mdto);
		
		session.setAttribute("mb", mdto);

		view = "redirect:/mypage_update2";

		return view;

	}

	public String logout(HttpSession session,RedirectAttributes rttr) {
		String view = "redirect:/";
		String msg= null;
		
		session.invalidate();
		rttr.addFlashAttribute("msg", msg);
		return view;
	}	
	
	
}
