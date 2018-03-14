package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.SpendingDto;

public interface ISpendingDao {
	
	//지출 등록
	public boolean spendingInsert(SpendingDto dto);
	
	//당월 지출 총액
	public SpendingDto spendingSumMoney(SpendingDto dto);
	
	//당월 지출 총액TOP3
	public List<SpendingDto> spendingMoneyTop(SpendingDto dto);
	
	//당월 지출 건수TOP3
	public List<SpendingDto> spendingCountTop(SpendingDto dto);
	
	//당월 지출내역 리스트조회
	public List<SpendingDto> spendingAllSearch(SpendingDto dto);

}
