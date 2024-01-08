package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

public interface ProductService {
    public String prolist(Model model,HttpServletRequest request);
    public String procontent(HttpServletRequest request,Model model,HttpSession session);
    public String addjjim(HttpServletRequest request,HttpSession session);
    public String deljjim(HttpServletRequest request,HttpSession session);
    public String cartAdd(HttpServletResponse response,HttpServletRequest request,HttpSession session);
    public String cartView(HttpServletRequest request,HttpSession session, Model model);
    public String changeSu(HttpServletRequest request);
    public String cartDel(HttpServletResponse response,HttpServletRequest request);
    public String selectDel(HttpServletRequest request);
    public String jjimView(HttpSession session, Model model);
    public String jjimDel(HttpServletRequest request);
    public String moveCart(HttpServletRequest request,HttpSession session);
    
    public String progumae(HttpServletRequest request, HttpSession session, Model model);
    public String chgPhone(HttpServletRequest request, HttpSession session);
    public String baelist(HttpSession session, Model model);
    public String baeWrite();
    public String baeWriteOk(BaesongVo bvo, HttpSession session);
    public String baeUpdate(HttpServletRequest request, Model model);
    public String baeUpdateOk(BaesongVo bvo,HttpSession session);
    public String baeDelete(HttpServletRequest request);
    public String setReq(HttpServletRequest request);
    public String progumaeOk(GumaeVo gvo, HttpSession session);
    public String jumunview(HttpServletRequest request,Model model);
    
    public String selectDel2(HttpServletResponse response, HttpServletRequest request);
    
    public String setCart(HttpServletResponse response,HttpServletRequest request,HttpSession session);
    public String munOk(QuestVo qvo,HttpSession session);
    public String questDel(HttpServletRequest request);
    
    public String singo(HttpServletRequest request);
}
