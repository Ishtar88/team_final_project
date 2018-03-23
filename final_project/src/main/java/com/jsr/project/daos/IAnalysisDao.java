package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;
import com.jsr.project.dtos.StockDto;

public interface IAnalysisDao {
	
	//소비패턴-수진
	public int total_spending(String sMonth,String eMonth,String id);
	public int invest_spending(String p_regdate,String id);
	public int expense_spending(String p_regdate,String id);
	public int total_goal(String id);
	public int total_expense(String id,String p_regdate);
	public List<GoalDto> category_goal(String id);
	public List<SpendingDto> category_expense(String id,String p_regdate);
	public List<SpendingDto> goalVerseExpense(String id,String p_regdate);
	//public List<SpendingDto> goalMinusExpense(String id,String p_regdate);
	//지출패턴-병훈
	

	
	//투자패턴-유라

	public int selfPatternScore(String id);
	public int lifePatternScore(String id);
	public int playingPatternScore(String id);
	public int shoppingPatternScore(String id);
	public int compareLastMonth(String id); 
	public int howMuchDay(String id);
	public int mostCategory(String id);
	public int goalSuccess(String id); 
	public int howMuchInvest(String id);
	public int howMuchSave(String id);
	public int essentialSpending(String id);
	public int optionalSpending(String id);
	public int carefulSpending(String id); 
	public int satisfySpending(String id); 
	
}
