package com.example.demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ProductService;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.QuestVo;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;

	@RequestMapping("/product/setCart")
	public String setCart(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		return service.setCart(response,request,session);
	}

	@RequestMapping("/product/prolist")
	public String prolist(Model model,HttpServletRequest request) {
		return service.prolist(model,request);
	}

	// readnum을 나중에 만드세요

	@RequestMapping("/product/procontent")
	public String procontent(HttpServletRequest request,Model model,HttpSession session,
			HttpServletResponse response) {
		/*
		 * // cookie 생성 String imsi="p01010102001:2/p01010205007:3/p02050304004:5/";
		 * Cookie cookie=new Cookie("cart",imsi); // 생성자("변수","값");
		 * cookie.setMaxAge(600); // 초단위 response.addCookie(cookie);
		 */
		/*
		 * // cookie 삭제 Cookie cookie=new Cookie("cart",""); cookie.setMaxAge(0);
		 * response.addCookie(cookie);
		 */
		return service.procontent(request,model,session);
	}

	@RequestMapping("/product/viewCookie")
	public void viewCookie(HttpServletRequest request) {
		// cookie를 읽어오기
		Cookie[] cookies=request.getCookies();

		for(int i=0;i<cookies.length;i++){
			
			if(cookies[i].getName().equals("cart")){
				
				String cart=cookies[i].getValue(); // p01010102001:2/p01010205007:3/p02050304004:5/
				String[] carts=cart.split("/"); // 0번방 p01010102001:2 , 1번방 p01010205007:3 , 2번방 p02050304004:5
				// 상품코드 수량
				for(int j=0;j<carts.length; j++){
					String pcode=carts[j].substring(0,12);
					String su=carts[j].substring(13);
				}
			}
		}
	}

	@RequestMapping("/product/addjjim")
	public @ResponseBody String addjjim(HttpServletRequest request,HttpSession session) {
		return service.addjjim(request,session);
	}

	@RequestMapping("/product/deljjim")
	public @ResponseBody String deljjim(HttpServletRequest request,HttpSession session) {
		return service.deljjim(request,session);
	}

	@RequestMapping("/product/cartAdd")
	public @ResponseBody String cartAdd(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		return service.cartAdd(response,request,session);
	}

	@RequestMapping("/product/cartView")
	public String cartView(HttpServletRequest request,HttpSession session,Model model) {
		return service.cartView(request,session,model);
	}

	@RequestMapping("/product/changeSu")
	public @ResponseBody String changeSu(HttpServletRequest request) {
		return service.changeSu(request);
	}

	@RequestMapping("/product/cartDel")
	public @ResponseBody String cartDel(HttpServletResponse response,HttpServletRequest request) {
		return service.cartDel(response,request);
	}

	@RequestMapping("/product/selectDel")
	public @ResponseBody String selectDel(HttpServletRequest request) {
		return service.selectDel(request);
	}

	@RequestMapping("/product/jjimView")
	public String jjimView(HttpSession session,Model model) {
		return service.jjimView(session,model);
	}

	@RequestMapping("/product/jjimDel")
	public String jjimDel(HttpServletRequest request) {
		return service.jjimDel(request);
	}

	@RequestMapping("/product/moveCart")
	public String moveCart(HttpServletRequest request,HttpSession session) {
		return service.moveCart(request,session);
	}

	@RequestMapping("/product/progumae")
	public String progumae(HttpServletRequest request,HttpSession session,Model model) {
		return service.progumae(request,session,model);
	}

	@RequestMapping("/product/chgPhone")
	public @ResponseBody String chgPhone(HttpServletRequest request,HttpSession session) {
		return service.chgPhone(request,session);
	}

	@RequestMapping("/product/baelist")
	public String baelist(HttpSession session,Model model) {
		return service.baelist(session,model);
	}

	@RequestMapping("/product/baeWrite")
	public String baeWrite() {
		return service.baeWrite();
	}

	@RequestMapping("/product/baeWriteOk")
	public String baeWriteOk(BaesongVo bvo,HttpSession session) {
		return service.baeWriteOk(bvo,session);
	}

	@RequestMapping("/product/baeUpdate")
	public String baeUpdate(HttpServletRequest request,Model model) {
		return service.baeUpdate(request,model);
	}

	@RequestMapping("/product/baeUpdateOk")
	public String baeUpdateOk(BaesongVo bvo, HttpSession session) {
		return service.baeUpdateOk(bvo,session);
	}

	@RequestMapping("/product/baeDelete")
	public String baeDelete(HttpServletRequest request) {
		return service.baeDelete(request);
	}

	@RequestMapping("/product/setReq")
	public @ResponseBody String setReq(HttpServletRequest request) {
		return service.setReq(request);
	}

	@RequestMapping("/product/progumaeOk")
	public String progumaeOk(GumaeVo gvo,HttpSession session) {
		return service.progumaeOk(gvo,session);
	}

	@RequestMapping("/product/jumunview")
	public String jumunview(HttpServletRequest request,Model model) {
		return service.jumunview(request, model);
	}

	@RequestMapping("/product/selectDel2")
	public @ResponseBody String selectDel2(HttpServletResponse response,HttpServletRequest request) {
		return service.selectDel2(response,request);
	}
	
	@RequestMapping("/product/munOk")
	public String munOk(QuestVo qvo,HttpSession session) {
		return service.munOk(qvo,session);
	}
	
	@RequestMapping("/product/questDel")
	public String questDel(HttpServletRequest request) {
		return service.questDel(request);
	}
	
	@RequestMapping("/product/singo")
	public String singo(HttpServletRequest request) {
		return service.singo(request);
	}
}
