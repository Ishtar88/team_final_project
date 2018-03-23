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
	
	
	//지출패턴 - 유라 
	
	//자기계발형 인간 
	public int selfPattern(String id);
	//생활중심형 인간 
	public int lifePattern(String id);
	//유흥중심형 인간
	public int playingPattern(String id); 
	//쇼핑중심형 인간
	public int shoppingPattern(String id);
	//저번달보다 얼마나 덜썼는지?
	public int compareLastMonth(String id); 
	//가장 지출을 많이 한 요일은? 
	public int howMuchDay(String id);
	//이번달에 가장 많이 지출한 분야는?  
	public int mostCategory(String id);
	//계획 이행률  
	public int goalSuccess(String id);  //수진이가 한거에 있는뎅?! 
	//수입을 얼마만큼 투자에 지출했는지 비율
	public int howMuchInvest(String id);
	//수입을 얼마만큼 저축에 지출했는지 비율 
	public int howMuchSave(String id);
	// 지출부분 중 필수 지출 비율  
	public int essentialSpending(String id);
	//비 필수 지출비율은 
	public int optionalSpending(String id);
	//평균 구매 신중도는 
	public int carefulSpending(String id); 
	//평균 소비 만족도는  
	public int satisfySpending(String id); 
	

}
