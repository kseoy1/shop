package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SoVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;

	@Override
	public String productAdd(Model model) {
		
		ArrayList<DaeVo> list=mapper.getDae();
		model.addAttribute("list",list);
		
		model.addAttribute("clist",mapper.getComp());
		
		return "/product/productAdd";
	}

	@Override
	public String getJung(HttpServletRequest request) {
		
		String dae=request.getParameter("dae");
		ArrayList<JungVo> list=mapper.getJung(dae);
		
		String str="<option>중분류</option>";
		for(int i=0;i<list.size();i++) {
			str=str+"<option value='"+list.get(i).getCode()+"'>"+list.get(i).getName()+"</option>";
		}
		
		return str;
	}

	@Override
	public String getSo(HttpServletRequest request) {
		
		String daejung=request.getParameter("daejung");
		ArrayList<SoVo> list=mapper.getSo(daejung);
		
		String str="<option>소분류</option>";
		for(int i=0;i<list.size();i++) {
			str=str+"<option value='"+list.get(i).getCode()+"'>"+list.get(i).getName()+"</option>";
		}
		return str;
	}

	@Override
	public String getPcode(HttpServletRequest request) {
		
		String pcode=request.getParameter("pcode");
		int num=mapper.getPcode(pcode);
		
		//num을 3자리로 만든뒤 pcode랑 합치기
		String imsi=num+"";
		
		if(imsi.length()==1) {
			imsi="00"+num;
		}else if(imsi.length()==2) {
			imsi="0"+num;
		}
		
		pcode=pcode+imsi;
		
		return pcode;
	}
	
	@Override
	public String plist(Model model) {

		model.addAttribute("plist", mapper.plist());
        return "/product/plist";
	}
	
	@Override
	public String productAddOk(HttpServletRequest request){
		
		int size=1024*1024*100;
		
		try{
			String path=ResourceUtils.getFile("classpath:static/pro").toPath().toString();
			MultipartRequest multi=new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
			
			ProductVo pvo=new ProductVo();
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setPimg(multi.getFilesystemName("pimg"));
			pvo.setPimg(multi.getFilesystemName("dimg"));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setSu(Integer.parseInt(multi.getParameter("su")));
			pvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
			pvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			
			mapper.productAddOk(pvo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/plist";
	}

	@Override
	public String gumaeState(Model model) {
	
		ArrayList<GumaeVo> glist=mapper.gumaeState();
		model.addAttribute("glist",glist);
		
		return "/gumae/gumaeState";	
	}

	@Override
	public ProductVo getProduct(HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.getProduct(pcode);
		return pvo;
	}

	@Override
	public BaesongVo getBaesong(HttpServletRequest request) {
		String no=request.getParameter("no");
		BaesongVo bvo=mapper.getBaesong(no);
		return bvo;
	}

	@Override
	public String stateChange(HttpServletRequest request) {
		String state=request.getParameter("state");
		String no=request.getParameter("no");
		mapper.stateChange(state,no);
		return "redirect:/gumae/gumaeState";
	}

	@Override
	public String memberlist(Model model) {
		model.addAttribute("mlist", mapper.memberlist());
		return null;
	}

	@Override
	public String memberOut(HttpServletRequest request) {
		String no=request.getParameter("no");
		mapper.memberOut(no);
		return "redirect:/member/memberlist";
	}

	@Override
	public String adminReview(HttpServletRequest request,Model model) {
		String pcode=request.getParameter("pcode");
		ArrayList<ReviewVo> rlist=mapper.adminReview(pcode);
		model.addAttribute("rlist",rlist);
		return "/product/adminReview";
	}

	@Override
	public String reviewDel(HttpServletRequest request) {
		String no=request.getParameter("no");
		mapper.reviewDel(no);
		return "0";
	}

	@Override
	public String answerlist(Model model) {
		
		//상품관련
		ArrayList<HashMap> mapall=mapper.answerlist();
		
		for(int i=0;i<mapall.size();i++) {
			String imsi=mapall.get(i).get("content").toString();
			mapall.get(i).put("content",imsi.replace("\r\n", "<br>"));
		}
		model.addAttribute("mapall",mapall);
		
		//1:1문의
		ArrayList<MtmVo> mlist=mapper.getMtm();
		
		for(int i=0;i<mlist.size();i++) {
			String imsi=mlist.get(i).getContent().replace("\r\n", "<br>");
			mlist.get(i).setContent(imsi);
		}
		model.addAttribute("mlist",mlist);
		
		return "/answer/answerlist";
	}

	@Override
	public String questOk(QuestVo qvo) {
		mapper.questOk(qvo);
		return "redirect:/answer/answerlist";
	}

	@Override
	public String mtmOk(HttpServletRequest request) {
		String content=request.getParameter("content");
		String mtmno=request.getParameter("mtmno");
		mapper.mtmOk(content,mtmno);
		
		//답변을 단 후 mtm핑드의 state값을 1로 변경
		mapper.chgState(mtmno);
		return "redirect:/answer/answerlist";
	}
	
	
}
