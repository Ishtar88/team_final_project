package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SpendingDto;

public interface IAnalysisService {
	
	public int total_spending(String p_regdate,String id);
	public int invest_spending(String p_regdate,String id);
	public int expense_spending(String p_regdate,String id);
	public int invest_ratio(String p_regdate,String id);
	public int expense_ratio(String p_regdate,String id);
	public int total_goal(String id);
	public int total_expense(String id,String p_regdate);
	public List<GoalDto> category_goal(String id);
	public List<SpendingDto> category_expense(String id,String p_regdate);

}
