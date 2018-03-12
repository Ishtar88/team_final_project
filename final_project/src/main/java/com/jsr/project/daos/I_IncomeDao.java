package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.IncomeDto;

public interface I_IncomeDao {
	
	public List<IncomeDto> incomeAllSearch(String id);
	
	public List<IncomeDto> incomeTopSearch(String id);

	//수입 등록
	public boolean incomeInsert(IncomeDto dto);
	//수입등록 포인트 적립
	public boolean incomeInsertPoint(String id);
	
	//수입 상세조회
	public IncomeDto incomeDetailSearch(int i_seq);
	
	//수입 수정
	public boolean incomeUpdate(IncomeDto dto);
	
	//수입 삭제
	public boolean incomeDelete(int seq);
	
	
}
