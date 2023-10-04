package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MainMapper;

@Service
@Qualifier("mains")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mapper;

	@Override
	public String main(Model model) {
		
		model.addAttribute("newlist",mapper.getNewpro());
		model.addAttribute("bestlist",mapper.getBest());
		model.addAttribute("salelist",mapper.getSale());
		model.addAttribute("eventlist",mapper.getEvent());

		return "/main/main";
	}
}
