package com.jsr.project.services;

import java.util.List;
import java.util.Map;

import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;

public interface IAnalysisService {
	
	public int total_spending(String sMonth,String eMonth,String id);
	public int invest_spending(String p_regdate,String id);
	public int expense_spending(String p_regdate,String id);
	public int invest_ratio(String p_regdate,String id);
	public int expense_ratio(String p_regdate,String id);
	public int total_goal(String id);
	public int total_expense(String id,String p_regdate);
	public List<GoalDto> category_goal(String id);
	public List<SpendingDto> category_expense(String id,String p_regdate);

	public List<SpendingDto> goalVerseExpense(String id,String p_regdate);

	
	//소비패턴 - 병훈
	
	//투자비율 조회
	public List<AcountPatternDto> acountTotalRate(AcountPatternDto dto);
	
	//전체 투자분류 내역조회
	public List<AcountPatternDto> acountTotalDetailAjax(AcountPatternDto dto); 
	
	//투자 금액 top5
	public List<AcountPatternDto> acountMoneyTop(AcountPatternDto dto);
	
	//기간별 수익 차트 조회
	public Map<String, List<AcountPatternDto>> acountDateChartAjax(AcountPatternDto dto);
	
	

}
