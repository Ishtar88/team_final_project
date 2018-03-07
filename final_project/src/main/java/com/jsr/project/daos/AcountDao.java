package com.jsr.project.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.StockDto;

@Repository
public class AcountDao implements IAcountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.acount.";

	
	@Override
	public boolean goalInsert(GoalDto dto) {
		int count=0;
		
		System.out.println("goalInsertDao action");
		count=sqlSession.insert(namespace+"goalInsert", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean goalRegInsert(GoalDto dto) {
		int count=0;
		
		System.out.println("goalRegInsert action");
		count=sqlSession.update(namespace+"goalRegInsert",dto);
		System.out.println("goalRegInsert end");
		return count>0?true:false;
	}

	@Override
	public boolean goalPointInsert(GoalDto dto) {
		int count=0;
		System.out.println("goalPointInsert action");
		count=sqlSession.insert(namespace+"goalPointInsert",dto);
		System.out.println("goalPointInsert end");
		return count>0?true:false;
	}

	@Override
	public AcountDto acountTotalSearch(MembersDto dto) {
		System.out.println("acountTotal action");
		
		return sqlSession.selectOne(namespace+"acountTotal", dto);
	}

	@Override
	public List<StockDto> stockAllSearch(String id) {
		
		List<StockDto> dto=sqlSession.selectList(namespace+"stockAllSearch", id);
		System.out.println("List<StockDto>: "+dto);
		
		return dto;
	}

	@Override
	public List<FundDto> fundAllSearch(String id) {
		
		List<FundDto> dto=sqlSession.selectList(namespace+"fundAllSearch", id);
		System.out.println("List<fundDto>: "+dto);
		
		return dto;
	}

}
