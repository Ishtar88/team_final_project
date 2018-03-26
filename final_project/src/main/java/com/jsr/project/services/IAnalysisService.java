package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SpendingDto;

public interface IAnalysisService {
	
	public int total_spending(String sMonth,String eMonth,String eDate,String id);
	public int invest_spending(String sMonth,String eMonth,String eDate,String id);
	public int expense_spending(String sMonth,String eMonth,String eDate,String id);
	public int total_goal(String id);
	public int total_expense(String sMonth,String eMonth,String eDate,String id);
	public List<GoalDto> category_goal(String id);
	public List<SpendingDto> category_expense(String sMonth,String eMonth,String eDate,String id);
	public List<SpendingDto> goalVerseExpense(String sMonth,String eMonth,String eDate,String id);

	public AnalysisDto selectAnalysis(int a_seq);
	
	public List<SpendingDto> mostCategory(String sMonth,String eMonth,String eDate,String id);
	public int carefulSpending(String sMonth,String eMonth,String eDate,String id);
	public int satisfySpending(String sMonth,String eMonth,String eDate,String id);
}
