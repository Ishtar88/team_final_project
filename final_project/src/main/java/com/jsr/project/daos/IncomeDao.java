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
	public List<IncomeDto> incomeAllSearch(IncomeDto dto) {
		List<IncomeDto> lists=sqlSession.selectList(namespace+"incomeAllSearch", dto);
		return lists;
	}

	@Override
	public List<IncomeDto> incomeTopSearch(String id) {
		List<IncomeDto> dtos=sqlSession.selectList(namespace+"incomeTopSearch", id);
		return dtos;
	}

	@Override
	public boolean incomeInsert(IncomeDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"incomeInsert", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean incomeInsertPoint(String id) {
		int count=0;
		
		count=sqlSession.insert(namespace+"incomeInsertPoint", id);
		return count>0?true:false;
	}
	

	@Override
	public IncomeDto incomeDetailSearch(int i_seq) {
		return sqlSession.selectOne(namespace+"incomeDetailSearch", i_seq);
	}

	@Override
	public boolean incomeUpdate(IncomeDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"incomeUpdate", dto);
		
		return count>0?true:false;
	}

	@Override
	public boolean incomeDelete(int seq) {
		int count=0;
		
		count=sqlSession.update(namespace+"incomeDelete", seq);
		
		return count>0?true:false;
	}

	@Override
	public List<IncomeDto> incomeChartAjax(IncomeDto dto) {
		return sqlSession.selectList(namespace+"incomeChartAjax", dto);
	}


}
