package com.example.demo.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class Schedule {
	
	@Scheduled(fixedDelay=1000) //fixedRate
	public void firstSchedule() {
		//System.out.println("안녕하세요");
	}
	
	@Scheduled(cron="0 26 10 * * *") //초,분,시,일,월,요일(0~6)
	public void secondSchedule() {
		System.out.println("토요일");
	}
}
