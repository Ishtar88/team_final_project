package com.jsr.project.services;

import java.util.List;
import java.util.Map;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;

public interface IAnalysisService {

	//수진  
	public int total_spending(String sMonth,String eMonth,String eDate,String id);
	public int invest_spending(String sMonth,String eMonth,String eDate,String id);
	public int expense_spending(String sMonth,String eMonth,String eDate,String id);
	public int total_goal(String id);
	public int total_expense(String sMonth,String eMonth,String eDate,String id);
	public List<GoalDto> category_goal(String id);
	public List<SpendingDto> category_expense(String sMonth,String eMonth,String eDate,String id);
	public List<SpendingDto> goalVerseExpense(String sMonth,String eMonth,String eDate,String id);
	public AnalysisDto selectAnalysis(int a_seq);
	
	
	/////////////////////////////
	
	
	//소비패턴 - 병훈
	
		//투자비율 조회
		public List<AcountPatternDto> acountTotalRate(AcountPatternDto dto);
		
		//전체 투자분류 내역조회
		public List<AcountPatternDto> acountTotalDetailAjax(AcountPatternDto dto); 
		
		//투자 금액 top5
		public List<AcountPatternDto> acountMoneyTop(AcountPatternDto dto);
		
		//1년중 가장 높은 수익 조회
		public SaveDto yearMoneyTop(AcountPatternDto dto);
		
		//가장 수익이 높은 상품 조회
		public AcountPatternDto yearProductTop(AcountPatternDto dto);
		
		//연간 투자 금액 top5
		public List<AcountPatternDto> yearAcountMoneyTop(AcountPatternDto dto);
		
		//투자 수익률 TOP5
		public List<AcountPatternDto> acountRateTop5(AcountPatternDto dto);
		
		//기간별 수익 차트 조회
		public Map<String, List<Object>> acountDateChartAjax(AcountPatternDto dto);
		
		//투자별 수익 현황 조회
		public List<AcountPatternDto> acountDetailChart(AcountPatternDto dto);
		
		//투자 수익 차트 조회
		public List<AcountPatternDto> acountMaxValueChart(AcountPatternDto dto);
		
		//당월 투자 비율 차트
		public List<AcountPatternDto> CurrentAcountTotalChart(AcountPatternDto dto);
		
		//당월 투자금액 조회
		public AcountDto acountMonthMoney(AcountPatternDto dto);
		
		//당월 투자 분류 내역 조회
		public List<AcountPatternDto> currentAcountDetail(AcountPatternDto dto);
		
		//가장 많이 투자하고 있는 상품 조회
		public AcountPatternDto acountMaxValueProduct(AcountPatternDto dto);
		
		
		
		////////////////////////////
	
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
