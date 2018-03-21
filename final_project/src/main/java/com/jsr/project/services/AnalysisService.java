package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IAnalysisDao;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SpendingDto;

@Service
public class AnalysisService implements IAnalysisService{
	
	@Autowired
	private IAnalysisDao IAnalysisDao;

	//소비패턴-수진
	
	@Override
	public int total_spending(String sMonth,String eMonth,String id) {
		return IAnalysisDao.total_spending(sMonth, eMonth, id);
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

	@Override
	public List<SpendingDto> goalVerseExpense(String id, String p_regdate) {
		return IAnalysisDao.goalVerseExpense(id, p_regdate);
	}


}
