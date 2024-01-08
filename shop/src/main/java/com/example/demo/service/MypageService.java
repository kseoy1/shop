package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MtmVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

public interface MypageService {
	public String myinfo(HttpServletRequest request,HttpSession session,Model model);
    public String chgName(HttpServletRequest request,HttpSession session);
    public String chgPhone(HttpServletRequest request,HttpSession session);
    public String chgEmail(HttpServletRequest request,HttpSession session); 
    public String pwdChange(HttpServletRequest request,HttpSession session);     
    public String mygumae(HttpSession session,Model model);   
    public String stateChange(HttpServletRequest request);   
    public String review(HttpServletRequest request,Model model,HttpSession session);   
    public String reviewOk(ReviewVo rvo,HttpSession session);   
    public String mtm();
    public String mtmOk(MtmVo mvo,HttpSession session);  
    public String mylist(HttpSession session,Model model);
    public String reviewUpdate(ReviewVo rvo);
    public String reviewDel(ReviewVo rvo);
    public String questUpdate(QuestVo qvo);
    public String questDel(HttpServletRequest request);
    public String memberOut(HttpSession session);
}

