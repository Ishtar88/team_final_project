package com.jsr.project.services;


import java.util.List;

import com.jsr.project.dtos.*;

public interface IAcountService {
	
	//목표등록 기능
	public boolean goalInsert(GoalDto dto);
	
	public boolean goalRegInsert(GoalDto dto);
	
	public boolean goalPointInsert(GoalDto dto);
	
	//----------------------------------
	
	//자산정보 전체 조회 기능
	public AcountDto acountTotalSearch(MembersDto dto);
	
	public List<StockDto> stockAllSearch(String id);
	
	public List<FundDto> fundAllSearch(String id);

	public List<LoanDto> loanAllSearch(String id);

	public List<SaveDto> saveAllSearch(String id);
	
	boolean acountAllSearch(String id);
	
	//----------------------------------

	//자산 정보 상세조회 기능
	public SaveDto saveDetailSearch(int seq);
	
	public StockDto stockDetailSearch(int seq);
	
	public FundDto fundDetailSearch(int seq);
	
	public LoanDto loanDetailSearch(int seq);
	
	//----------------------------------
	
	
	//자산 수정 및 삭제 기능
	public boolean saveDelete(int seq);
	
	public boolean saveUpdate(SaveDto dto);
	
	//----------------------------------
	
	//자산등록 기능
	public boolean saveInsert(SaveDto dto);
	
	public boolean stockInsert(StockDto dto);
	
	public boolean fundInsert(FundDto dto);
	
	public boolean loanInsert(LoanDto dto);


	//----------------------------------
	

}
