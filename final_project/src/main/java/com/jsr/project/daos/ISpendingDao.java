package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.SpendingDto;

public interface ISpendingDao {
	
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
	
	//지출 상세조회
	public SpendingDto spendingDetailSearch(int p_seq);
	
	//지출 수정
	public boolean spendingUpdate(SpendingDto dto);
	
	//지출 삭제
	public boolean spendingDelete(int seq);
}
