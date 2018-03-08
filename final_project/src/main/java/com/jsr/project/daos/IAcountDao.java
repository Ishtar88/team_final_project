package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.LoanDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.StockDto;

public interface IAcountDao {
	
	public boolean goalInsert(GoalDto dto);
	
	public boolean goalRegInsert(GoalDto dto);
	
	public boolean goalPointInsert(GoalDto dto);
	
	public AcountDto acountTotalSearch(MembersDto dto);
	
	public List<StockDto> stockAllSearch(String id);
	
	public List<FundDto> fundAllSearch(String id);

	public List<LoanDto> loanAllSearch(String id);

	public List<SaveDto> saveAllSearch(String id);
	
	public SaveDto saveDetailSearch(int seq);
	
	public boolean saveDelete(int seq);
	
	public boolean saveUpdate(SaveDto dto);

}
