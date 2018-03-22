package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IAnalysisDao;
import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
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


}
