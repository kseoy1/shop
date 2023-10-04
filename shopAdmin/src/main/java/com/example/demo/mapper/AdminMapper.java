package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.CompVo;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SoVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.MtmVo;

@Mapper
public interface AdminMapper {

	public ArrayList<DaeVo> getDae();
	public ArrayList<JungVo> getJung(String dae);
	public ArrayList<SoVo> getSo(String daejung);
	public ArrayList<CompVo> getComp();
	public int getPcode(String pcode);
    public ArrayList<ProductVo> plist();
	public void setPcode(int no,String pcode);
	public void productAddOk(ProductVo pvo);
	public ArrayList<GumaeVo> gumaeState();
	public ProductVo getProduct(String pcode);
	public BaesongVo getBaesong(String no);
	public void stateChange(String state,String no);
	public ArrayList<MemberVo> memberlist();
	public void memberOut(String no);
	public ArrayList<ReviewVo> adminReview(String pcode);
	public void reviewDel(String no);
	public ArrayList<HashMap> answerlist();
	public void questOk(QuestVo qvo);
	public ArrayList<MtmVo> getMtm();
	public void mtmOk(String content,String mtmno);
	public void chgState(String no);
}
