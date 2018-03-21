package com.jsr.project.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IAnalysisDao;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;

@Service
public class AnalysisService implements IAnalysisService{
	
	@Autowired
	private IAnalysisDao IAnalysisDao;

	//소비패턴-수진
	
	@Override
	public int total_spending(String p_regdate,String id) {
		return IAnalysisDao.total_spending(p_regdate, id);
	}

	@Override
	public int invest_spending(String p_regdate,String id) {
		return IAnalysisDao.invest_spending(p_regdate, id);
	}

	@Override
	public int expense_spending(String p_regdate,String id) {
		return IAnalysisDao.expense_spending(p_regdate, id);
	}

	@Override
	public int invest_ratio(String p_regdate,String id) {
		return IAnalysisDao.invest_ratio(p_regdate, id);
	}

	@Override
	public int expense_ratio(String p_regdate,String id) {
		return IAnalysisDao.expense_ratio(p_regdate, id);
	}

	@Override
	public int total_goal(String id) {
		return IAnalysisDao.total_goal(id);
	}
	@Override
	public int total_expense(String id, String p_regdate) {
		return IAnalysisDao.total_expense(id, p_regdate);
	}

	@Override
	public List<GoalDto> category_goal(String id) {
		return IAnalysisDao.category_goal(id);
	}

	@Override
	public List<SpendingDto> category_expense(String id, String p_regdate) {
		return IAnalysisDao.category_expense(id, p_regdate);
	}

	//소비패턴 - 병훈

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
	public Map<String, List<AcountPatternDto>> acountDateChartAjax(AcountPatternDto dto) {
		Map<String, List<AcountPatternDto>> map=new HashMap<>();
		
		map.put("sChart", IAnalysisDao.saveDateChartAjax(dto));
		map.put("stChart", IAnalysisDao.stockDateChartAjax(dto));
		map.put("fChart", IAnalysisDao.fundDateChartAjax(dto));
		
		
		return map;
	}
	

}
