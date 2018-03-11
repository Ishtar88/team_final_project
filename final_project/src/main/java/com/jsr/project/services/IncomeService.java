package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.I_IncomeDao;
import com.jsr.project.dtos.IncomeDto;

@Service
public class IncomeService implements I_IncomeService {
	
	@Autowired
	private I_IncomeDao incomeImp;

	@Override
	public List<IncomeDto> incomeAllSearch(String id) {
		return incomeImp.incomeAllSearch(id);
	}
	
	

}
