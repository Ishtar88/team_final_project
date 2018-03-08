package com.jsr.project.services;


import java.util.List;

import com.jsr.project.dtos.*;

public interface IAcountService {
	
	public boolean goalInsert(GoalDto dto);
	
	public boolean goalPointInsert(GoalDto dto);
	
	public AcountDto acountTotalSearch(MembersDto dto); 
	
	//자산정보 조회 한번에 받는...
	public boolean acountAllSearch(String id);
	
	public List<StockDto> stockAllSearch(String id);
	
	public List<FundDto> fundAllSearch(String id);

	public List<LoanDto> loanAllSearch(String id);

	public List<SaveDto> saveAllSearch(String id);
	
	public SaveDto saveDetailSearch(int seq);
	
	public boolean saveDelete(int seq);
	
	public boolean saveUpdate(SaveDto dto);

}
