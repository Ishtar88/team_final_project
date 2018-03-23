package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;
import com.jsr.project.dtos.StockDto;

@Repository
public class AnalysisDao implements IAnalysisDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.analysis.";
	
	//소비패턴-수진
	
	@Override
	public int total_spending(String sMonth,String eMonth,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"total_spending", map);
	}
	@Override
	public int invest_spending(String p_regdate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("p_regdate", p_regdate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"invest_spending", map);
	}
	@Override
	public int expense_spending(String p_regdate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("p_regdate", p_regdate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"expense_spending", map);
	}
	@Override
	public int invest_ratio(String p_regdate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("p_regdate", p_regdate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"invest_ratio", map);
	}
	@Override
	public int expense_ratio(String p_regdate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("p_regdate", p_regdate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"expense_ratio", map);
	}
	@Override
	public int total_goal(String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectOne(namespace+"total_goal", map);
	}
	@Override
	public int total_expense(String id, String p_regdate) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		map.put("p_regdate", p_regdate);
		return sqlSession.selectOne(namespace+"total_expense", map);
	}
	@Override
	public List<GoalDto> category_goal(String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectList(namespace+"category_goal", map);
	}
	@Override
	public List<SpendingDto> category_expense(String id, String p_regdate) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		map.put("p_regdate", p_regdate);
		return sqlSession.selectList(namespace+"category_expense", map);
	}

	//투자패턴-유라
	
	
	@Override
	public int selfPatternScore(String id) {
		return sqlSession.selectOne(namespace+"selfPatternScore", id);
	}
	@Override
	public int lifePatternScore(String id) {
		return sqlSession.selectOne(namespace+"lifePatternScore", id);
	}
	@Override
	public int playingPatternScore(String id) {
		return sqlSession.selectOne(namespace+"playingPatternScore", id);
	}
	@Override
	public int shoppingPatternScore(String id) {
		return sqlSession.selectOne(namespace+"shoppingPatternScore",id);
	}
	@Override
	public int compareLastMonth(String id) {
		return sqlSession.selectOne(namespace+"compareLastMonth",id);
	}
	@Override
	public int howMuchDay(String id) {
		return sqlSession.selectOne(namespace+"howMuchDay",id);
	}
	@Override
	public int mostCategory(String id) {
		return sqlSession.selectOne(namespace+"mostCategory",id);
	}
	@Override
	public int goalSuccess(String id) {
		return sqlSession.selectOne(namespace+"goalSuccess",id);
	}
	@Override
	public int howMuchInvest(String id) {
		return sqlSession.selectOne(namespace+"howMuchInvest",id);
	}
	@Override
	public int howMuchSave(String id) {
		return sqlSession.selectOne(namespace+"howMuchSave",id);
	}
	@Override
	public int essentialSpending(String id) {
		return sqlSession.selectOne(namespace+"essentialSpending",id);
	}
	@Override
	public int optionalSpending(String id) {
		return sqlSession.selectOne(namespace+"optionalSpending",id);
	}
	@Override
	public int carefulSpending(String id) {
		return sqlSession.selectOne(namespace+"carefulSpending",id);
	}
	@Override
	public int satisfySpending(String id) {
		return sqlSession.selectOne(namespace+"satisfySpending",id);
	}



}
