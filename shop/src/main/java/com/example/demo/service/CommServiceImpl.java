package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.CommMapper;

@Service
@Qualifier("cs")
public class CommServiceImpl implements CommService{
	
	@Autowired
	private CommMapper mapper;
}
