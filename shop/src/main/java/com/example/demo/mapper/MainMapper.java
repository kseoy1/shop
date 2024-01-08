package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.vo.ProductVo;

@Mapper
public interface MainMapper {
	public ArrayList<ProductVo> getNewpro();
	public ArrayList<ProductVo> getBest();
	public ArrayList<ProductVo> getSale();
	public ArrayList<ProductVo> getEvent();
}
