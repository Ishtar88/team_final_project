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
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
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

	
	
	
	
	// 지출패턴 - 유라 
	@Override
	public int selfPattern(String id) {
		return IAnalysisDao.selfPatternScore(id);
	}

	@Override
	public int lifePattern(String id) {
		return IAnalysisDao.lifePatternScore(id);
	}

	@Override
	public int playingPattern(String id) {
		return IAnalysisDao.playingPatternScore(id);
	}

	@Override
	public int shoppingPattern(String id) {
		return IAnalysisDao.shoppingPatternScore(id);
	}

	@Override
	public int compareLastMonth(String id) {
		return IAnalysisDao.compareLastMonth(id);
	}

	@Override
	public int howMuchDay(String id) {
		return IAnalysisDao.howMuchDay(id);
	}

	@Override
	public int mostCategory(String id) {
		return IAnalysisDao.mostCategory(id);
	}

	@Override
	public int goalSuccess(String id) {
		return IAnalysisDao.goalSuccess(id);
	}

	@Override

	public int howMuchInvest(String id) {
		return IAnalysisDao.howMuchInvest(id);
	}

	@Override
	public int howMuchSave(String id) {
		return IAnalysisDao.howMuchSave(id);
	}

	@Override
	public int essentialSpending(String id) {
		return IAnalysisDao.essentialSpending(id);
	}

	@Override
	public int optionalSpending(String id) {
		return IAnalysisDao.optionalSpending(id);
	}

	@Override
	public int carefulSpending(String id) {
		return IAnalysisDao.carefulSpending(id);
	}

	@Override
	public int satisfySpending(String id) {
		return IAnalysisDao.satisfySpending(id);
	}


}
