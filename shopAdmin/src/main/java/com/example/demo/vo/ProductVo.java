package com.example.demo.vo;

import lombok.Data;

@Data
public class ProductVo {
	 private int no,price,halin,su,bprice,btime,juk;
	 private String pcode,pimg,dimg,title,writeday;
	 private double star;
	 
	 //상품평의 갯수
	 private int cnt,singo;
}
