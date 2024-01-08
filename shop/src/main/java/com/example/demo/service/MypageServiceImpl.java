package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MypageMapper;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Service
@Qualifier("mys")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;

	@Override
	public String myinfo(HttpServletRequest request,HttpSession session,Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String userid=session.getAttribute("userid").toString();
		MemberVo mvo=mapper.myinfo(userid);
		model.addAttribute("err",request.getParameter("err"));
		model.addAttribute("mvo",mvo);
		return "/mypage/myinfo";
	}

	@Override
	public String chgName(HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String name=request.getParameter("name");
		String userid=session.getAttribute("userid").toString();
		mapper.chgName(name,userid);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String chgPhone(HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String phone=request.getParameter("phone");
		String userid=session.getAttribute("userid").toString();
		mapper.chgPhone(phone,userid);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String chgEmail(HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String email=request.getParameter("email");
		String userid=session.getAttribute("userid").toString();
		mapper.chgEmail(email,userid);
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String pwdChange(HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String opwd=request.getParameter("opwd");
		String userid=session.getAttribute("userid").toString();
		if(mapper.isPwd(opwd,userid)) {
			String pwd=request.getParameter("pwd");
			mapper.pwdChange(pwd,userid);
			return "redirect:/mypage/myinfo";
		}else{
			return "redirect:/mypage/myinfo?err=1";
		}
	}

	@Override
	public String mygumae(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		String userid=session.getAttribute("userid").toString();
		ArrayList<HashMap> mapall=mapper.mygumae(userid);

		//도착날짜, 요일 처리
		for(int i=0;i<mapall.size();i++) {
			int btime=(int) mapall.get(i).get("btime");
			LocalDate today=LocalDate.now();
			LocalDate xday=today.plusDays(btime);

			//ProductVo의 writeday변수를 이용하여 처리 : prolist에서 등록일을 사용하지 않는다.
			mapall.get(i).put("baeday",xday.toString().substring(5).replace("-", "/"));

			int cc=xday.getDayOfWeek().getValue(); // 1~7까지의 값 (월~일)
			String yoil = "";
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
			mapall.get(i).put("yoil",yoil);

		}

		model.addAttribute("mapall",mapall);
		return "/mypage/mygumae";
	}

	@Override
	public String stateChange(HttpServletRequest request) {
		String state=request.getParameter("state");
		String no=request.getParameter("no");

		mapper.stateChange(state,no);

		return "redirect:/mypage/mygumae";
	}

	@Override
	public String review(HttpServletRequest request,Model model,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		model.addAttribute("pcode",request.getParameter("pcode"));
		model.addAttribute("gumaeno",request.getParameter("gumaeno"));
		return "/mypage/review";
	}

	@Override
	public String reviewOk(ReviewVo rvo,HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login";

		rvo.setUserid(session.getAttribute("userid").toString());
		mapper.reviewOk(rvo);

		// 현재 상품의 star를 review테이블에서 전부 가져와서 평균
		// product테이블의 star필드를 update
		// product테이블에 review필드에 1누적
		mapper.chgProduct(rvo.getPcode());
		// 상품평을 등록했으면 gumae테이블에 sangp필드의 값을 1로 변경
		mapper.chgGumae(rvo.getGumaeno());
		return "redirect:/mypage/mygumae";
	}

	@Override
	public String mtm() {
		return "/mypage/mtm";
	}

	@Override
	public String mtmOk(MtmVo mvo,HttpSession session) {

		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.mtmOk(mvo);
		return "mypage/mtmOk";
	}

	@Override
	public String mylist(HttpSession session,Model model) {
		String userid=session.getAttribute("userid").toString();

		// 상품평
		model.addAttribute("reviewmap",mapper.getReview(userid));

		// 상품문의
		ArrayList<HashMap> questmap=mapper.getQuest(userid);
		// quest테이블의 title => 0,1,2,3 이값을 => 문자로 변형
		for (int i=0;i<questmap.size();i++) {
			String chk=questmap.get(i).get("title").toString();

			String imsi = "";
			switch(chk){
			case "0":
				imsi="상품 관련";
				break;
			case "1":
				imsi="결제 관련";
				break;
			case "2":
				imsi="배송 관련";
				break;
			case "3":
				imsi="그 외";
				break;
			default:
				imsi="오류발생";
			}

			questmap.get(i).put("title",imsi);
			questmap.get(i).put("chk",chk);
		}
		model.addAttribute("questmap",questmap);

		// 고객센터
		model.addAttribute("mlist",mapper.getMtm(userid));

		return "/mypage/mylist";
	}

	@Override
	public String reviewUpdate(ReviewVo rvo) {
		mapper.reviewUpdate(rvo);
		mapper.proChgStar(rvo.getPcode());
		return "redirect:/mypage/mylist";
	}

	@Override
	public String reviewDel(ReviewVo rvo) {
		// review테이블 삭제
		mapper.reviewDel(rvo.getNo());

		// product테이블에서 star필드 수정
		mapper.proChgStar(rvo.getPcode());

		// gumae테이블에서 해당구매건의 sangp필드를 0으로
		mapper.setSangp(rvo.getGumaeno());
		return "redirect:/mypage/mylist";
	}

	@Override
	public String questUpdate(QuestVo qvo) {
		mapper.questUpdate(qvo);
		return "redirect:/mypage/mylist";
	}

	@Override
	public String questDel(HttpServletRequest request) {
		String no = request.getParameter("no");
		mapper.questDel(no);

		return "redirect:/mypage/mylist";
	}

	@Override
	public String memberOut(HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mapper.memberOut(userid);
		return "redirect:/member/logout";
	}

}
