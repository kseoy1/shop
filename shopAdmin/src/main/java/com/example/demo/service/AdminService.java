package com.example.demo.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

public interface AdminService {

	public String productAdd(Model model);
	public String getJung(HttpServletRequest request);
	public String getSo(HttpServletRequest request);
	public String getPcode(HttpServletRequest request);
	public String plist(Model model);
	public String productAddOk(HttpServletRequest request);
	public String gumaeState(Model model);
	public ProductVo getProduct(HttpServletRequest request);
	public BaesongVo getBaesong(HttpServletRequest request);
	public String stateChange(HttpServletRequest request);
	public String memberlist(Model model);
	public String memberOut(HttpServletRequest request);
	public String adminReview(HttpServletRequest request,Model model);
	public String reviewDel(HttpServletRequest request);
	public String answerlist(Model model);
	public String questOk(QuestVo qvo);
	public String mtmOk(HttpServletRequest request);
}
