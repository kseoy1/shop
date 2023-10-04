package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Mapper
public interface ProductMapper {
	public ArrayList<ProductVo> prolist(String pcode, String str, int index);
	public int getChong(String pcode);
	public String getDaeName(String dae);
	public String getJungName(String daecode, String jung);
	public String getSoName(String daejung, String so);
	public ProductVo procontent(String pcode);
	public String getMade(String made);
	public void addjjim(String pcode, String userid);
	public void deljjim(String pcode, String userid);
	public boolean isjjim(String pcode, String userid);
	public void cartAdd(String pcode, int su, String userid);
	public ProductVo isCart(String pcode, String userid);
	public void cartUp(int hap, int no);
	public ArrayList<HashMap> cartView(String userid);
	public void changeSu(String su, String no);
	public void cartDel(String no);
	public ArrayList<HashMap> jjimView(String userid);
	public void jjimDel(String no);
	public MemberVo getMember(String userid);
	public BaesongVo getBaesong(String userid);
	public BaesongVo getBaesong2(String userid);
	public void chgPhone(String phone, String userid);
	public ArrayList<BaesongVo> baelist(String userid);
	public void baeWriteOk(BaesongVo bvo);
	public void setGibon(String userid);
	public BaesongVo baeUpdate(String no);
	public void baeUpdateOk(BaesongVo bvo);
	public void baeDelete(String no);
	public void setReq(String req, String no);
	public int getCode(String jumuncode);
	public void progumaeOk(GumaeVo gvo);
	// public ArrayList<GumaeVo> jumunview(String jumuncode);
	public ArrayList<HashMap> jumunview(String jumuncode);
	public BaesongVo getBaesong3(int no);
	public ProductVo getProduct(String pcode);
	public void productSubSu(String su, String pcode);
	public void cartGumaeDel(String pcode, String userid);
	public void addPansu(String pcode, String su);
	public HashMap getCart(String pcode); // 로그인 x cartView하나씩
	// 쿠키에 있던 상품을 cart에 저장
	public void setCart(String pcode, String userid, String su);
	//review읽기
	public ArrayList<ReviewVo> getReview(String pcode);
	public int getGroup();
	public void munOk(QuestVo qvo);
	public ArrayList<QuestVo> getQuest(String pcode);
	public void questDel(String no);
	
	public void singo(String no);
}