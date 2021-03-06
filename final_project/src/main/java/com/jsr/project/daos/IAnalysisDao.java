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
	
	//투자비율 조회
	public List<AcountPatternDto> acountTotalRate(AcountPatternDto dto);
	
	//전체 투자분류 내역조회
	public List<AcountPatternDto> acountTotalDetailAjax(AcountPatternDto dto); 
	
	//투자 금액 top5
	public List<AcountPatternDto> acountMoneyTop(AcountPatternDto dto);
	
	//1년중 가장 높은 수익 조회
	public SaveDto yearMoneyTop(AcountPatternDto dto);
	
	//연간 투자 금액 top5
	public List<AcountPatternDto> yearAcountMoneyTop(AcountPatternDto dto);
	
	//투자 수익률 TOP5
	public List<AcountPatternDto> acountRateTop5(AcountPatternDto dto);
	
	//가장 수익이 높은 상품 조회
	public AcountPatternDto yearProductTop(AcountPatternDto dto);
	
	//당월 투자 분류 내역 조회
	public List<AcountPatternDto> currentAcountDetail(AcountPatternDto dto);
	
	//가장 많이 투자하고 있는 상품 조회
	public AcountPatternDto acountMaxValueProduct(AcountPatternDto dto);
	
	//기간별 수익 차트 조회
	//저축
	public List<Object> saveDateChartAjax(AcountPatternDto dto);
	//주식
	public List<Object> stockDateChartAjax(AcountPatternDto dto);
	//펀드
	public List<Object> fundDateChartAjax(AcountPatternDto dto);
	

	//투자별 수익 현황 조회
	public List<AcountPatternDto> acountDetailChart(AcountPatternDto dto);
	
	//투자 수익 차트 조회
	public List<AcountPatternDto> acountMaxValueChart(AcountPatternDto dto);
	
	//당월 투자 비율 차트
	public List<AcountPatternDto> CurrentAcountTotalChart(AcountPatternDto dto);
	
	//당월 투자금액 조회
	public AcountDto acountMonthMoney(AcountPatternDto dto);
	
	
	//투자패턴-유라

}
