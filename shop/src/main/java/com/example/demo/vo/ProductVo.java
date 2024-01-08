package com.example.demo.vo;

import lombok.Data;

@Data
public class ProductVo {
   private int no,price,halin,su,bprice,btime,juk;
   private String pcode,pimg,dimg,title,writeday;
   private double star;
   
   //8월16일 pansu추가:판매상품의 갯수를 저장
   private int pansu;
   
   //배송요일을 저장할 변수
   private String yoil;
   
   //별점을 위한 변수
   private int ystar,banstar,gstar;
   
   //review의 수를 저잘하는 필드
   private int review;
   
}
