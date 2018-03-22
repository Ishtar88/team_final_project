package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int total_spending(String p_regdate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("p_regdate", p_regdate);
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

//---------------------------------------------------------------------------
	//지출패턴-병훈
	
	@Override
	public List<AcountPatternDto> acountTotalRate(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountTotalRate", dto);
	}
	
	@Override
	public List<AcountPatternDto> acountTotalDetailAjax(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountTotalDetailAjax", dto);
	}
	
	@Override
	public List<AcountPatternDto> acountMoneyTop(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountMoneyTop", dto);
	}
	
	@Override
	public List<AcountPatternDto> yearAcountMoneyTop(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"yearAcountMoneyTop", dto);
	}
	@Override
	public List<Object> saveDateChartAjax(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"saveDateChartAjax", dto);
	}
	
	@Override
	public List<Object> stockDateChartAjax(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"stockDateChartAjax", dto);
	}
	
	@Override
	public List<Object> fundDateChartAjax(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"fundDateChartAjax", dto);
	}
	@Override
	public SaveDto yearMoneyTop(AcountPatternDto dto) {
		return sqlSession.selectOne(namespace+"yearMoneyTop", dto);
	}
	@Override
	public AcountPatternDto yearProductTop(AcountPatternDto dto) {
		return sqlSession.selectOne(namespace+"yearProductTop", dto);
	}
	@Override
	public List<AcountPatternDto> acountDetailChart(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountDetailChart", dto);
	}
	@Override
	public List<AcountPatternDto> acountMaxValueChart(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountMaxValueChart", dto);
	}
	@Override
	public List<AcountPatternDto> CurrentAcountTotalChart(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"CurrentAcountTotalChart", dto);
	}


	
//---------------------------------------------------------------------------
	
	//투자패턴-유라

}
