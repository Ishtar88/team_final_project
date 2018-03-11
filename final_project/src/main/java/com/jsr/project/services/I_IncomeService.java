package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.IncomeDto;

public interface I_IncomeService {
	
	public List<IncomeDto> incomeAllSearch(String id);

}
