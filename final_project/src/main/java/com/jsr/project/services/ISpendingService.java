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
	
	
	
	//---------------------------------------------------------------

}
