package com.jsr.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsr.project.dtos.SpendingDto;

@Service
public interface ISpendingService {
	
	//지출 등록
	public boolean spendingInsert(SpendingDto dto);
	
	//---------------------지출 메인 페이지 정보 조회----------------------
	
	//당월 지출 총액
	public SpendingDto spendingSumMoney(SpendingDto dto);
	
	//당월 지출 총액TOP3
	public List<SpendingDto> spendingMoneyTop(SpendingDto dto);
	
	//당월 지출 건수TOP3
	public List<SpendingDto> spendingCountTop(SpendingDto dto);
	
	//당월 지출내역 리스트조회
	public List<SpendingDto> spendingAllSearch(SpendingDto dto);
	
	//당월 날짜별 지출내역조회
	public List<SpendingDto> spendingDateSearch(SpendingDto dto);
	
	//당월 카테고리별 지출내역조회
	public List<SpendingDto> spendingCategorySearch(SpendingDto dto);
	
	//당월 결제수단별 지출내역조회
	public List<SpendingDto> spendingSomeSearch(SpendingDto dto);
	
	//당월 현재까지 사용금액 조회
	public SpendingDto spendingcurrentMoneySearch(SpendingDto dto);
	
	//일 평균 지출액 조회
	public SpendingDto spendingAvgMoneySearch(SpendingDto dto);
	
	//총 건수
	public SpendingDto spendingTotalCountSearch(SpendingDto dto);
	
	//지불수단별 총액 조회
	public List<SpendingDto> spendingSomeTotalSearch(SpendingDto dto);
	
	//지불수단별 결제건수 조회
	public List<SpendingDto> spendingSomeCountSearch(SpendingDto dto);
	
	
	//---------------------------------------------------------------
	
	//지출 상세조회
	public SpendingDto spendingDetailSearch(int p_seq);
	
	//지출 수정
	public boolean spendingUpdate(SpendingDto dto);
	
	//지출 삭제
	public boolean spendingDelete(int seq);
	
	
	//---------------------------------------------------------------
	
	//날짜별 차트 내역 조회
	public List<SpendingDto> dateChartSearch(SpendingDto dto);
	
	//카테고리별 차트 내역 조회
	public List<SpendingDto> categoryChartSearch(SpendingDto dto);
	
	//결제수단별 차트 내역 조회
	public List<SpendingDto> someChartSearch(SpendingDto dto);

}
