package com.jsr.project.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.IncomeDto;

@Repository
public class IncomeDao implements I_IncomeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.income.";

	@Override
	public List<IncomeDto> incomeAllSearch(String id) {
		List<IncomeDto> lists=sqlSession.selectList(namespace+"incomeAllSearch", id);
		return lists;
	}

}
