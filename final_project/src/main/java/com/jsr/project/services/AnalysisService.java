package com.jsr.project.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.IAnalysisDao;
import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;

@Service
public class AnalysisService implements IAnalysisService{
	
	@Autowired
	private IAnalysisDao IAnalysisDao;

	//소비패턴-수진
	
	@Override
	public int total_spending(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.total_spending(sMonth, eMonth, eDate, id);
	}

	@Override
	public int invest_spending(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.invest_spending(sMonth, eMonth, eDate, id);
	}

	@Override
	public int expense_spending(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.expense_spending(sMonth, eMonth, eDate, id);
	}
	
	@Override
	public int total_goal(String id) {
		return IAnalysisDao.total_goal(id);
	}
	@Override
	public int total_expense(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.total_expense(sMonth, eMonth, eDate, id);
	}

	@Override
	public List<GoalDto> category_goal(String id) {
		return IAnalysisDao.category_goal(id);
	}

	@Override
	public List<SpendingDto> category_expense(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.category_expense(sMonth, eMonth, eDate, id);
	}

	@Override
	public List<SpendingDto> goalVerseExpense(String sMonth,String eMonth,String eDate,String id) {
		return IAnalysisDao.goalVerseExpense(sMonth, eMonth, eDate, id);
	}

	@Override
	public AnalysisDto selectAnalysis(int a_seq) {
		return IAnalysisDao.selectAnalysis(a_seq);
	}

	@Override
	public List<SpendingDto> mostCategory(String sMonth, String eMonth, String eDate, String id) {
		return IAnalysisDao.mostCategory(sMonth, eMonth, eDate, id);
	}

	@Override
	public int carefulSpending(String sMonth, String eMonth, String eDate, String id) {
		return IAnalysisDao.carefulSpending(sMonth, eMonth, eDate, id);
	}

	@Override
	public int satisfySpending(String sMonth, String eMonth, String eDate, String id) {
		return IAnalysisDao.satisfySpending(sMonth, eMonth, eDate, id);
	}

	@Override
	public List<SpendingDto> spendAnalysis(String sMonth, String eMonth, String eDate, String id) {
		return IAnalysisDao.spendAnalysis(sMonth, eMonth, eDate, id);
	}

	//--------------------
	@Override
	public List<AcountPatternDto> acountTotalRate(AcountPatternDto dto) {
		return IAnalysisDao.acountTotalRate(dto);
	}

	@Override
	public List<AcountPatternDto> acountTotalDetailAjax(AcountPatternDto dto) {
		return IAnalysisDao.acountTotalDetailAjax(dto);
	}

	@Override
	public List<AcountPatternDto> acountMoneyTop(AcountPatternDto dto) {
		return IAnalysisDao.acountMoneyTop(dto);
	}
	
	@Override
	public SaveDto yearMoneyTop(AcountPatternDto dto) {
		return IAnalysisDao.yearMoneyTop(dto);
	}
	
	@Override
	public List<AcountPatternDto> yearAcountMoneyTop(AcountPatternDto dto) {
		return IAnalysisDao.yearAcountMoneyTop(dto);
	}

	@Transactional
	@Override
	public Map<String, List<Object>> acountDateChartAjax(AcountPatternDto dto) {
		Map<String, List<Object>> map=new HashMap<>();
		
		map.put("sChart", IAnalysisDao.saveDateChartAjax(dto));
		map.put("stChart", IAnalysisDao.stockDateChartAjax(dto));
		map.put("fChart", IAnalysisDao.fundDateChartAjax(dto));
		
		
		return map;
	}

	@Override
	public AcountPatternDto yearProductTop(AcountPatternDto dto) {
		return IAnalysisDao.yearProductTop(dto);
	}

	@Override
	public List<AcountPatternDto> acountDetailChart(AcountPatternDto dto) {
		return IAnalysisDao.acountDetailChart(dto);
	}

	@Override
	public List<AcountPatternDto> acountMaxValueChart(AcountPatternDto dto) {
		return IAnalysisDao.acountMaxValueChart(dto);
	}

	@Override
	public List<AcountPatternDto> CurrentAcountTotalChart(AcountPatternDto dto) {
		return IAnalysisDao.CurrentAcountTotalChart(dto);
	}

	@Override
	public AcountDto acountMonthMoney(AcountPatternDto dto) {
		return IAnalysisDao.acountMonthMoney(dto);
	}

	@Override
	public List<AcountPatternDto> acountRateTop5(AcountPatternDto dto) {
		return IAnalysisDao.acountRateTop5(dto);
	}

	@Override
	public List<AcountPatternDto> currentAcountDetail(AcountPatternDto dto) {
		return IAnalysisDao.currentAcountDetail(dto);
	}

	@Override
	public AcountPatternDto acountMaxValueProduct(AcountPatternDto dto) {
		return IAnalysisDao.acountMaxValueProduct(dto);
	}
	
	@Override
	public AcountDto acountPatternRate(MembersDto lDto) {
		return IAnalysisDao.acountPatternRate(lDto);
	}

	@Override
	public List<AnalysisDto> acountPatternReview() {
		return IAnalysisDao.acountPatternReview();
	}

}
