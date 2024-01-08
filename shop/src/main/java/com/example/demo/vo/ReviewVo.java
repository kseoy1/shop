package com.example.demo.vo;

import lombok.Data;

@Data
public class ReviewVo {
	private int no,star,gumaeno;
	private String userid,content,title,pcode,writeday;
}
