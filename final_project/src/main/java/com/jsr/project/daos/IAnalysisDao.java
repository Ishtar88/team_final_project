package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SpendingDto;

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

}
