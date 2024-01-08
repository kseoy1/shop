package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MtmVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Mapper
public interface MypageMapper {
    public MemberVo myinfo(String userid);
    public void chgName(String name,String userid);
    public void chgPhone(String phone,String userid);
    public void chgEmail(String email,String userid);
    
    public Boolean isPwd(String pwd,String userid);
    public void pwdChange(String pwd,String userid);
    public ArrayList<HashMap> getHoliday(String date);
    
    public ArrayList<HashMap> mygumae(String userid);
    public void stateChange(String state,String no);
    public void  reviewOk(ReviewVo rvo);
    public void  chgProduct(String pcode);
    public void chgGumae(int no);
    
    public void mtmOk(MtmVo mvo);
    
    public ArrayList<HashMap> getReview(String userid);
    public ArrayList<HashMap> getQuest(String userid);
    public ArrayList<MtmVo> getMtm(String userid);
    
    public void reviewUpdate(ReviewVo rvo);
    public void proChgStar(String pcode);
    public void reviewDel(int no);
    public void setSangp(int no);
    
    public void questUpdate(QuestVo qvo);
    public void questDel(String no);
    
    public void memberOut(String userid);
}
