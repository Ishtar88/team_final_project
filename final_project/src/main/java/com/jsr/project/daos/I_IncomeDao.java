package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.IncomeDto;

public interface I_IncomeDao {
	
	public List<IncomeDto> incomeAllSearch(String id);

}
