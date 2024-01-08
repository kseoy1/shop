package com.example.demo.vo;

import lombok.Data;

@Data
public class GumaeVo {
	private int no,baeno,su,pay,bank,card,halbu,tongsin,sudan,chongprice,juk;
	private String userid,pcode,writeday,jumuncode;
	
	//,로 들어오는 수량,적립금,총가격
	private String sus,juks,chongprices;
}
