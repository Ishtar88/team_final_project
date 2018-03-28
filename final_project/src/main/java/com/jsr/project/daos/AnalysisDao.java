package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;

@Repository
public class AnalysisDao implements IAnalysisDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.analysis.";
	
	//소비패턴-수진
	
	@Override
	public int total_spending(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"total_spending", map);
	}
	@Override
	public int invest_spending(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"invest_spending", map);
	}
	@Override
	public int expense_spending(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"expense_spending", map);
	}

	@Override
	public int total_goal(String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectOne(namespace+"total_goal", map);
	}
	@Override
	public int total_expense(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"total_expense", map);
	}
	@Override
	public List<GoalDto> category_goal(String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectList(namespace+"category_goal", map);
	}
	@Override
	public List<SpendingDto> category_expense(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectList(namespace+"category_expense", map);
	}
	@Override
	public List<SpendingDto> goalVerseExpense(String sMonth,String eMonth,String eDate,String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectList(namespace+"goalVerseExpense", map);
	}
	
	@Override
	public AnalysisDto selectAnalysis(int a_seq) {
		return sqlSession.selectOne(namespace+"selectAnalysis", a_seq);
	}
	
	@Override
	public List<SpendingDto> mostCategory(String sMonth, String eMonth, String eDate, String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectList(namespace+"mostCategory", map);
	}
	@Override
	public int carefulSpending(String sMonth, String eMonth, String eDate, String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"carefulSpending", map);
	}
	@Override
	public int satisfySpending(String sMonth, String eMonth, String eDate, String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectOne(namespace+"satisfySpending", map);
	}
	@Override
	public List<SpendingDto> spendAnalysis(String sMonth, String eMonth, String eDate, String id) {
		Map<String , String>map=new HashMap<String,String>();
		map.put("sMonth", sMonth);
		map.put("eMonth", eMonth);
		map.put("eDate", eDate);
		map.put("id", id);
		return sqlSession.selectList(namespace+"spendAnalysis", map);
	}


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
	@Override
	public AcountDto acountMonthMoney(AcountPatternDto dto) {
		return sqlSession.selectOne(namespace+"acountMonthMoney", dto);
	}
	@Override
	public List<AcountPatternDto> acountRateTop5(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"acountRateTop5", dto);
	}
	@Override
	public List<AcountPatternDto> currentAcountDetail(AcountPatternDto dto) {
		return sqlSession.selectList(namespace+"currentAcountDetail", dto);
	}
	@Override
	public AcountPatternDto acountMaxValueProduct(AcountPatternDto dto) {
		return sqlSession.selectOne(namespace+"acountMaxValueProduct", dto);
	}


	
	//투자패턴-유라

}
