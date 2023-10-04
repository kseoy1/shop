package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVo {
	
	private int no,juk,level,state;
	private String userid,name,pwd,phone,email,writeday;
}
