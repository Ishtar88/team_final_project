package com.jsr.project.services;


import java.util.List;

import com.jsr.project.dtos.*;

public interface IAcountService {
	
	public boolean goalInsert(GoalDto dto);
	
	public boolean goalPointInsert(GoalDto dto);
	
	public AcountDto acountTotalSearch(MembersDto dto); 
	
	public List<StockDto> stockAllSearch(String id);
	
	public List<FundDto> fundAllSearch(String id);

}
