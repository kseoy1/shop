package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MypageService;
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("mys")
	private MypageService service;
	
	@RequestMapping("/mypage/myinfo")
	public String myinfo(HttpServletRequest request,HttpSession session,Model model) {
		return service.myinfo(request,session,model);
	}
	
	@RequestMapping("/mypage/chgName")
	public String chgName(HttpServletRequest request,HttpSession session) {
		return service.chgName(request,session);
	}
	
	@RequestMapping("/mypage/chgPhone")
	public String chgPhone(HttpServletRequest request,HttpSession session) {
		return service.chgPhone(request,session);
	}
	
	
	@RequestMapping("/mypage/chgEmail")
	public String chgEmail(HttpServletRequest request,HttpSession session) {
		return service.chgEmail(request,session);
	}
	
	@RequestMapping("/mypage/pwdChange")
	public String pwdChange(HttpServletRequest request,HttpSession session) {
		return service.pwdChange(request,session);
	}
	
	@RequestMapping("/mypage/mygumae")
	public String mygumae(HttpSession session,Model model) {
		return service.mygumae(session,model);
		
	}
	
	@RequestMapping("/mypage/stateChange")
	public String stateChange(HttpServletRequest request) {
		return service.stateChange(request);
	}
	
	@RequestMapping("/mypage/review")
	public String review(HttpServletRequest request,Model model,HttpSession session) {
		return service.review(request,model,session);
	}
	
	@RequestMapping("/mypage/reviewOk")
	public String reviewOk(ReviewVo rvo,HttpSession session) {
		return service.reviewOk(rvo, session);
	}
	
	@RequestMapping("/mypage/mtm")
	public String mtm() {
		return service.mtm();
	}
	
	@RequestMapping("/mypage/mtmOk")
	public String mtmOk(MtmVo mvo,HttpSession session) {
		return service.mtmOk(mvo,session);
	}
	
	@RequestMapping("/mypage/mylist")
	public String mylist(HttpSession session,Model model) {
		return service.mylist(session,model);
	}
	
	@RequestMapping("/mypage/reviewUpdate")
	public String reviewUpdate(ReviewVo rvo){
		return service.reviewUpdate(rvo);
	}
	
	@RequestMapping("/mypage/reviewDel")
	public String reviewDel(ReviewVo rvo){
		return service.reviewDel(rvo);
	}
	
	@RequestMapping("/mypage/questUpdate")
	public String questUpdate(QuestVo qvo){
		return service.questUpdate(qvo);
	}
	
	@RequestMapping("/mypage/questDel")
	public String questDel(HttpServletRequest request){
		return service.questDel(request);
	}
	@RequestMapping("/mypage/memberOut")
	public String memberOut(HttpSession session) {
		return service.memberOut(session);
	}

}
