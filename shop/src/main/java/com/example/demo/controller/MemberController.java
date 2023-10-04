package com.example.demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("mems")
	private MemberService service;

	@RequestMapping("/member/member")
	public String member() {
		return service.member();
	}

	@RequestMapping("/member/useridCheck")
	public @ResponseBody int useridCheck(MemberVo mvo) {
		return service.useridCheck(mvo);
	}

	@RequestMapping("/member/memberOk")
	public String memberOk(MemberVo mvo) {
		return service.memberOk(mvo);
	}

	@RequestMapping("/member/login")
	public String login(HttpServletRequest request,Model model) {

		return service.login(request, model);
	}

	@RequestMapping("/member/loginOk")
	public String loginOk(HttpServletRequest request,MemberVo mvo,String pcode,String su,HttpSession session) {
		// System.out.println("pcode:"+pcode);
		Cookie cart = WebUtils.getCookie(request, "cart");
		if (cart != null)
			System.out.println(cart.getValue());

		return service.loginOk(request,mvo,session,pcode,su);
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	@RequestMapping("/member/reState")
	public String reState(HttpServletRequest request,Model model) {
		return service.reState(request,model);
	}
	
	@RequestMapping("/member/chgState")
	public String chgState(HttpServletRequest request) {
		return service.chgState(request);
	}

}
