package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.example.demo.mapper.ProductMapper;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

	@Override
	public String prolist(Model model,HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		model.addAttribute("pcode",pcode);
		// prolist.jsp에 id="sectiontop"인곳에 출력할 내용만들기 => Home-대-중-소
		String[] ppp={null,null,null};
		String sectiontop="HOME";
		String imsi;
		for(int i=0;i<ppp.length;i++) {
			try{
				ppp[i]=pcode.substring(i*2+1,i*2+3);
				switch(i){
					case 0:
						imsi=mapper.getDaeName(ppp[0]);
						sectiontop=sectiontop+" ▷ "+imsi;
						break;
					case 1:
						imsi=mapper.getJungName(ppp[0],ppp[1]);
						sectiontop=sectiontop+" ▷ "+imsi;
						break;
					case 2:
						imsi=mapper.getSoName(ppp[0]+ppp[1],ppp[2]);
						sectiontop=sectiontop+" ▷ "+imsi;
						break;
				}
			}catch(Exception e){
				break;
			}

		}

		model.addAttribute("sectiontop",sectiontop);

		// 페이지 관련 : 사용자가 원하는 페이지의 레코드를 가져오는 부분 처리
		int page=1;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int index=(page-1)*20;

		int num=3;
		
		if(request.getParameter("num")!=null){
			num=Integer.parseInt(request.getParameter("num"));
		}
		String str="";
		/*
		 * pansu desc writeday desc price asc price desc
		 */
		switch(num){
			case 1:
				str="price asc";
				break;
			case 2:
				str="price desc";
				break;
			case 3:
				str="pansu desc";
				break;
			case 4:
				str="writeday desc";
				break;
		}
		
		ArrayList<ProductVo> plist=mapper.prolist(pcode,str,index);

		for(int i=0;i<plist.size();i++){
			int btime=plist.get(i).getBtime(); // 주문후 몇일 뒤에 배송되는가를 저장한 값
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);

			// ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다.
			plist.get(i).setWriteday(xday.toString().substring(5).replace("-","/"));

			// 요일 구하기
			int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일)
			String yoil="";
			switch(cc){
				case 1:
					yoil="월";
					break;
				case 2:
					yoil="화";
					break;
				case 3:
					yoil="수";
					break;
				case 4:
					yoil="목";
					break;
				case 5:
					yoil="금";
					break;
				case 6:
					yoil="토";
					break;
				case 7:
					yoil="일";
					break;
			}

			plist.get(i).setYoil(yoil);

			// 별점 처리 : 노란별출력갯수, 반별출력갯수, 회색별 출력갯수를 구하여 전달
			// ex : 3.9
			double star=plist.get(i).getStar();

			// 노란별의 갯수를 정하기 : 정수부분은 노란별
			int ystar=(int) star; // ex : 3

			if(star-ystar>0.8){ // ex : 4
				ystar++;
			}

			// 반쪽별 갯수 정하기 // 반별의 기준 : 0.3 <= 반별 <= 0.8
			int banstar=0;
			if(ystar+0.3<star && star<ystar+0.8){
				banstar=1;
			}

			// 회색별 갯수
			int gstar=5-(ystar+banstar);

			plist.get(i).setYstar(ystar);
			plist.get(i).setBanstar(banstar);
			plist.get(i).setGstar(gstar);
		}

		model.addAttribute("plist",plist);

		int pstart=page/10;

		if(page%10==0)
			pstart--;

		pstart=pstart*10+1;
		int pend=pstart+9;

		int chong=mapper.getChong(pcode);

		if(pend>chong){
			pend=chong;
		}

		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		model.addAttribute("num",num);
		
		return "/product/prolist";
	}

	@Override
	public String procontent(HttpServletRequest request, Model model,HttpSession session) {
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.procontent(pcode);

		// 별점 관련 처리
		double star=pvo.getStar();

		// 노란별의 갯수를 정하기 : 정수부분은 노란별
		int ystar=(int)star; // ex : 3

		if(star-ystar>0.8){ // ex : 4
			ystar++;
		}

		// 반쪽별 갯수 정하기 // 반별의 기준 : 0.3 <= 반별 <= 0.8
		int banstar=0;
		
		if(ystar+0.3<star && star<ystar+0.8){
			banstar=1;
		}

		// 회색별 갯수
		int gstar=5-(ystar+banstar);

		pvo.setYstar(ystar);
		pvo.setBanstar(banstar);
		pvo.setGstar(gstar);

		// 배송일자및 요일 처리
		int btime=pvo.getBtime(); // 주문후 몇일 뒤에 배송되는가를 저장한 값
		LocalDate today=LocalDate.now();
		LocalDate xday=today.plusDays(btime);

		// ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다..
		pvo.setWriteday(xday.toString().substring(5).replace("-","/"));

		// 요일 구하기
		int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일)
		String yoil="";
		switch(cc){
			case 1:
				yoil="월";
				break;
			case 2:
				yoil="화";
				break;
			case 3:
				yoil="수";
				break;
			case 4:
				yoil="목";
				break;
			case 5:
				yoil="금";
				break;
			case 6:
				yoil="토";
				break;
			case 7:
				yoil="일";
				break;
		}

		pvo.setYoil(yoil);

		// 제조사 구하기 : p01010102003
		String made=pcode.substring(7, 9);

		made=mapper.getMade(made);

		model.addAttribute("made",made);

		model.addAttribute("pvo",pvo);
		model.addAttribute("pcode",pcode);

		// 현재 제품을 사용자가 찜테이블에 저장했는 지 여부를 확인하여 model로 전달
		String userid="";
		
		if(session.getAttribute("userid")!=null)
			userid=session.getAttribute("userid").toString();

		if(mapper.isjjim(pcode,userid)){// 사용자가 이상품을 찜 했다
			model.addAttribute("img","jjim2.png");
		}else{// 찜을 안했다..
			model.addAttribute("img","jjim1.png");
		}

		// 로그인 하지 않고 장부구니 담기를 했을때 로그인을 실행하고 cart에 담은후 procontent로 이동시 ct=1값이 존재
		model.addAttribute("ct",request.getParameter("ct"));
		
		//현재 상품의 review를 읽어와서 뷰에 전달
		ArrayList<ReviewVo> rlist=mapper.getReview(pcode);
		
		for(int i=0;i<rlist.size();i++) {
			rlist.get(i).setContent( rlist.get(i).getContent().replace("\n\r","<br>"));
			
			String imsi=rlist.get(i).getUserid();
			int len=imsi.length();
			String ss="";
			
			for(int j=1;j<=len-3;j++){
				ss=ss+"*";
			}
			imsi=imsi.substring(0,3)+ss;
			
			rlist.get(i).setUserid(imsi);
		}
		model.addAttribute("rlist",rlist);
		
		//문의하기 내용을 읽어와ㅓ 뷰에 전달
		ArrayList<QuestVo> qlist=mapper.getQuest(pcode);
		for(int i=0;i<qlist.size();i++) {
			String imsi=qlist.get(i).getContent().replace("\n\r", "<br>");
			qlist.get(i).setContent(imsi);
		}
		model.addAttribute("qlist",qlist);
		return "/product/procontent";
	}

	@Override
	public String addjjim(HttpServletRequest request,HttpSession session) {

		if(session.getAttribute("userid")!=null){
			try{
				String pcode=request.getParameter("pcode");
				String userid=session.getAttribute("userid").toString();

				mapper.addjjim(pcode,userid);

				return "0";
			}catch (Exception e){
				return "1";
			}
		}else{
			return "2";
		}

	}

	@Override
	public String deljjim(HttpServletRequest request,HttpSession session) {

		try{
			String pcode=request.getParameter("pcode");
			String userid=session.getAttribute("userid").toString();

			mapper.deljjim(pcode,userid);

			return "0";
		}catch(Exception e){
			return "1";
		}
	}

	@Override
	public String cartAdd(HttpServletResponse response,HttpServletRequest request,HttpSession session) {

		String pcode=request.getParameter("pcode");
		int su=Integer.parseInt(request.getParameter("su"));

		if(session.getAttribute("userid")==null){ // 로그인을 하지 않은 사용자의 cartAdd를 Cookie를 이용
			// Cookie에 추가 상품코드1:수량1/상품코드2:수량2/상품코드3:수량3/
			// 쿠키를 읽어온다. (cart라는 이름의 쿠키)
			String cart=null; // cart쿠키의 값을 읽어온 후 저장

			Cookie[] cookies=request.getCookies();
			
			for(int i=0;i<cookies.length;i++){
				
				if(cookies[i].getName().equals("cart")){
					cart=cookies[i].getValue(); // 상품코드1:수량1/상품코드2:수량2/상품코드3:수량3/
					// 동일한 상품이 아닐경우
					if(cart.indexOf(pcode)==-1)// pcode = 상품코드1
						cart=cart+pcode+":" +su+"/"; // 상품코드1:수량1/상품코드2:수량2/상품코드3:수량3/상품코드1:수량1
				}
			}

			// 1. 기존에 cart쿠키가 존재할 경우
			if(cart!=null){
				Cookie cookie=new Cookie("cart",cart);
				cookie.setMaxAge(600);
				response.addCookie(cookie);
			}else{
				// 2. cart쿠키가 없을경우
				Cookie cookie=new Cookie("cart",pcode+":"+su+"/");
				cookie.setMaxAge(600);
				response.addCookie(cookie);
			}
			return "2";
		}else{ // 로그인을 한 사용자의 cartAdd 처리

			String userid=session.getAttribute("userid").toString();

			// 현재 상품이 cart에 존재하는지 여부를 체크
			ProductVo pvo=mapper.isCart(pcode,userid);
			
			if(pvo==null){ // 현재 상품이 장바구니에 없다..
				mapper.cartAdd(pcode,su,userid);
			}else{
				int hap=pvo.getSu()+su;
				mapper.cartUp(hap,pvo.getNo());
			}
			return "0";
		}
	}

	@Override
	public String cartView(HttpServletRequest request,HttpSession session,Model model) {

		ArrayList<HashMap> mapall=null;
		
		if(session.getAttribute("userid")==null){
			mapall=new ArrayList<HashMap>();

			Cookie[] cookies=request.getCookies();

			for(int i=0;i<cookies.length;i++){
				
				if(cookies[i].getName().equals("cart")){
					
					String[] carts=cookies[i].getValue().split("/");

					for(int j=0;j<carts.length;j++){
						if(carts[i].length()!=0){
							
							String pcode=carts[j].substring(0, 12);
							String su=carts[j].substring(13);

							HashMap map=mapper.getCart(pcode);
							map.put("su",su);
							map.put("no",0);
							mapall.add(map);
						}
					}

				}
			}

		}else{
			mapall=mapper.cartView(session.getAttribute("userid").toString());
		}
		// 자바스크립트의 배열형태 값,값,값,값
		String str="";
		
		for(int i = 0; i < mapall.size(); i++){
			str=str+mapall.get(i).get("su")+",";
		}
		model.addAttribute("str",str);

		model.addAttribute("mapall",mapall);

		return "/product/cartView";
	}

	@Override
	public String changeSu(HttpServletRequest request) {

		try{
			String su=request.getParameter("su");
			String no=request.getParameter("no");

			mapper.changeSu(su,no);

			return "0";
		}catch (Exception e){
			return "1";
		}
	}

	@Override
	public String cartDel(HttpServletResponse response,HttpServletRequest request) {
		
		try {
			String no=request.getParameter("no");
			String pcode=request.getParameter("pcode");
			String su=request.getParameter("su");

			if(no.equals("0")){ // 쿠키 삭제

				Cookie[] cookies = request.getCookies();
				
				for(int i=0;i<cookies.length;i++) {
					
					if(cookies[i].getName().equals("cart")) {
						String imsi=pcode+":"+su+"/"; // 상품코드2:3/
						String cart=cookies[i].getValue(); // 상품코드1:2/상품코드2:3/상품코드3:1/
						cart=cart.replace(imsi,"");
						// 클라이어트에 쿠키를 변경한 값으로 바꾸기
						Cookie cookie=new Cookie("cart", cart);
						cookie.setMaxAge(600);
						response.addCookie(cookie);
					}
				}
			}else{ // 테이블에서 삭제
				mapper.cartDel(no);
			}

			return "0";
		}catch(Exception e){
			return "1";
		}
	}

	@Override
	public String selectDel(HttpServletRequest request) {

		try{
			String nos=request.getParameter("nos");
			// ,로 구분된 값을 나눈다.
			String[] no = nos.split(",");

			for(int i=0;i<no.length;i++){
				mapper.cartDel(no[i]);
			}

			return "0";
		}catch(Exception e) {
			return "1";
		}
	}

	@Override
	public String jjimView(HttpSession session,Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mapall",mapper.jjimView(userid));
		return "/product/jjimView";
	}

	@Override
	public String jjimDel(HttpServletRequest request) {

		try{
			String nos=request.getParameter("nos");
			// ,로 구분된 값을 나눈다.
			String[] no=nos.split(",");

			for(int i=0;i<no.length;i++){
				mapper.jjimDel(no[i]);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/jjimView";
	}

	@Override
	public String moveCart(HttpServletRequest request,HttpSession session) {
		
		String no=request.getParameter("no"); // jjim테이블의 no
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		mapper.cartAdd(pcode,1,userid);

		mapper.jjimDel(no);

		return "redirect:/product/jjimView";
	}

	@Override
	public String progumae(HttpServletRequest request,HttpSession session,Model model) {

		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");

		if(session.getAttribute("userid")==null)
			return "redirect:/member/login?pcode="+pcode+"&su="+su;

		model.addAttribute("pcode",pcode);
		model.addAttribute("su",su);

		String userid=session.getAttribute("userid").toString();
		MemberVo mvo=mapper.getMember(userid);
		model.addAttribute("mvo",mvo);

		BaesongVo bvo=mapper.getBaesong(userid);
		
		if(bvo==null){
			bvo=mapper.getBaesong2(userid);
		}
		model.addAttribute("bvo",bvo);

		String[] pcodes=pcode.split(",");
		String[] sus=su.split(",");

		ArrayList<ProductVo> plist = new ArrayList<ProductVo>();

		for(int i=0;i<pcodes.length;i++){
			
			ProductVo pvo = mapper.procontent(pcodes[i]);
			pvo.setSu(Integer.parseInt(sus[i]));

			int btime=pvo.getBtime(); // 주문후 몇일 뒤에 배송되는가를 저장한 값
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);

			// ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다..
			pvo.setWriteday(xday.toString().substring(5).replace("-", "/"));

			int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일)
			String yoil="";
			switch(cc){
				case 1:
					yoil="월";
					break;
				case 2:
					yoil="화";
					break;
				case 3:
					yoil="수";
					break;
				case 4:
					yoil="목";
					break;
				case 5:
					yoil="금";
					break;
				case 6:
					yoil="토";
					break;
				case 7:
					yoil="일";
					break;
				}
				pvo.setYoil(yoil);
	
				plist.add(pvo);
		}

		model.addAttribute("plist",plist);

		return "/product/progumae";
	}

	@Override
	public String chgPhone(HttpServletRequest request,HttpSession session) {
		
		try{
			String phone=request.getParameter("phone");
			String userid=session.getAttribute("userid").toString();

			mapper.chgPhone(phone,userid);

			return "0";
		}catch(Exception e){
			e.printStackTrace();
			return "1";
		}
	}

	@Override
	public String baelist(HttpSession session,Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("blist", mapper.baelist(userid));
		return "/product/baelist";
	}

	@Override
	public String baeWrite() {
		return "/product/baeWrite";
	}

	@Override
	public String baeWriteOk(BaesongVo bvo,HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);

		// 입력되는 주소가 기본배송지라면
		if(bvo.getGibon()==1) {
			mapper.setGibon(userid);
		}

		mapper.baeWriteOk(bvo);
		return "redirect:/product/baelist";
	}

	@Override
	public String baeUpdate(HttpServletRequest request,Model model) {
		String no=request.getParameter("no");
		model.addAttribute("bvo", mapper.baeUpdate(no));
		return "/product/baeUpdate";
	}

	@Override
	public String baeUpdateOk(BaesongVo bvo,HttpSession session) {

		String userid=session.getAttribute("userid").toString();
		
		if(bvo.getGibon()==1){
			mapper.setGibon(userid);
		}
		
		mapper.baeUpdateOk(bvo);

		return "redirect:/product/baelist";
	}

	@Override
	public String baeDelete(HttpServletRequest request) {
		String no=request.getParameter("no");
		mapper.baeDelete(no);
		return "redirect:/product/baelist";
	}

	@Override
	public String setReq(HttpServletRequest request) {
		try{
			String req=request.getParameter("req");
			String no=request.getParameter("no");
			mapper.setReq(req,no);
			return "0";
		}catch(Exception e){
			return "1";
		}

	}

	@Override
	public String progumaeOk(GumaeVo gvo,HttpSession session) {

		// 주문코드 만들기 j년월일001~
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=String.format("%02d",m);
		int d=today.getDayOfMonth();
		String dd=String.format("%02d",d);

		String jumuncode="j"+y+mm+dd;

		int imsi=mapper.getCode(jumuncode);
		// 3자리 문자로 변경
		jumuncode=jumuncode+String.format("%03d",imsi);

		gvo.setJumuncode(jumuncode);
		gvo.setUserid(session.getAttribute("userid").toString());

		String[] pcode=gvo.getPcode().split(",");
		String[] su=gvo.getSus().split(",");
		String[] juk=gvo.getJuks().split(",");
		String[] chongprice=gvo.getChongprices().split(",");

		for(int i=0;i<pcode.length;i++){
			gvo.setPcode(pcode[i]);
			gvo.setSu(Integer.parseInt(su[i]));
			gvo.setJuk((int) Double.parseDouble(juk[i]));
			gvo.setChongprice((int) Double.parseDouble(chongprice[i]));
			mapper.progumaeOk(gvo);
			mapper.productSubSu(su[i], pcode[i]);
		}

		// 구매가 완료된 cart테이블의 상품은 삭제를 한다..
		for(int i=0; i<pcode.length;i++){
			mapper.cartGumaeDel(pcode[i],gvo.getUserid());
		}

		// 구매가 된 상품의 수량을 product테이블의 pansu필드에 누적을 시킨다.
		// update product set pansu=pansu+구매수량 where pcode=상품코드
		for (int i=0;i<pcode.length;i++) {
			mapper.addPansu(pcode[i],su[i]);
		}

		return "redirect:/product/jumunview?jumuncode=" + jumuncode;
	}

	/*
	 * @Override public String jumunview(HttpServletRequest request,Model model) {
	 * 
	 * String jumuncode=request.getParameter("jumuncode");
	 * 
	 * ArrayList<GumaeVo> glist=mapper.jumunview(jumuncode);
	 * model.addAttribute("glist",glist); // 배송지 정보 BaesongVo
	 * bvo=mapper.getBaesong3(glist.get(0).getBaeno());
	 * model.addAttribute("bvo",bvo);
	 * 
	 * // 상품정보 ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
	 * 
	 * for(int i=0;i<glist.size();i++) { ProductVo
	 * pvo=mapper.getProduct(glist.get(i).getPcode());
	 * 
	 * int btime=pvo.getBtime(); // 주문후 몇일 뒤에 배송되는가를 저장한 값 LocalDate
	 * today=LocalDate.now(); LocalDate xday=today.plusDays(btime);
	 * 
	 * // ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다..
	 * pvo.setWriteday(xday.toString().substring(5).replace("-","/"));
	 * 
	 * int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일) String yoil="";
	 * switch(cc) { case 1: yoil="월"; break; case 2: yoil="화"; break; case 3:
	 * yoil="수"; break; case 4: yoil="목"; break; case 5: yoil="금"; break; case 6:
	 * yoil="토"; break; case 7: yoil="일"; break; } pvo.setYoil(yoil);
	 * 
	 * pvo.setSu(glist.get(i).getSu());
	 * 
	 * plist.add(pvo); }
	 * 
	 * model.addAttribute("plist",plist);
	 * 
	 * return "/product/jumunview"; }
	 */

	@Override
	public String jumunview(HttpServletRequest request, Model model) {
		// inner join을 이용하여 하나의 집합으로 가져와서 처리
		String jumuncode=request.getParameter("jumuncode");
		ArrayList<HashMap> mapall=mapper.jumunview(jumuncode);

		// 배송날짜, 배송요일 => p.btime을 이용하여 처리 // map.put("name","홍길동");

		for (int i = 0; i < mapall.size(); i++) {
			int btime=(int)mapall.get(i).get("btime");
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);

			// ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다..
			mapall.get(i).put("baeday",xday.toString().substring(5).replace("-", "/"));

			int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일)
			String yoil = "";
			switch(cc){
				case 1:
					yoil = "월";
					break;
				case 2:
					yoil = "화";
					break;
				case 3:
					yoil = "수";
					break;
				case 4:
					yoil = "목";
					break;
				case 5:
					yoil = "금";
					break;
				case 6:
					yoil = "토";
					break;
				case 7:
					yoil = "일";
					break;
			}
			mapall.get(i).put("yoil",yoil);
		}

		model.addAttribute("mapall",mapall);
		return "/product/jumunview";
	}

	@Override
	public String selectDel2(HttpServletResponse response,HttpServletRequest request) {

		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");

		// 쿠키 읽어온다
		Cookie[] cookies=request.getCookies();
		String cart=null;
		
		for (int i=0;i<cookies.length;i++) {
			if (cookies[i].getName().equals("cart")){
				cart=cookies[i].getValue();
			}
		}

		for (int i=0;i<pcode.length;i++) {
			String imsi=pcode[i]+":"+su[i]+"/"; // 상품코드1:2/

			cart=cart.replace(imsi,"");
		}

		Cookie cookie=new Cookie("cart",cart);
		cookie.setMaxAge(600);
		response.addCookie(cookie);
		return "0";
	}

	@Override
	public String setCart(HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		Cookie cart = WebUtils.getCookie(request,"cart");
		String userid = session.getAttribute("userid").toString();
		if(cart!=null){
			String[] carts=cart.getValue().split("/");

			for (int j=0;j<carts.length;j++) {
				String pcode=carts[j].substring(0, 12);
				String su=carts[j].substring(13);
				mapper.setCart(pcode, userid, su);
			}
			
			// 기존 쿠키를 삭제하기
			Cookie cookie=new Cookie("cart", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		return "redirect:/main/main";
	}

	@Override
	public String munOk(QuestVo qvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		qvo.setUserid(userid);
		int grp=mapper.getGroup();
		qvo.setGrp(grp);
		mapper.munOk(qvo);
		return "redirect:/product/procontent?pcode="+qvo.getPcode();
	}

	@Override
	public String questDel(HttpServletRequest request) {
		String no=request.getParameter("no");
		String pcode=request.getParameter("pcode");
		mapper.questDel(no);
		return "redirect:/product/procontent?pcode="+pcode;
	}

	@Override
	public String singo(HttpServletRequest request) {
		String no=request.getParameter("no");
		String pcode=request.getParameter("pcode");	
		mapper.singo(no);
		return "redirect:/product/procontent?pcode="+pcode;
	}
}
