package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.I_IncomeDao;
import com.jsr.project.dtos.IncomeDto;

@Service
public class IncomeService implements I_IncomeService {
	
	@Autowired
	private I_IncomeDao incomeImp;

	@Override
	public List<IncomeDto> incomeAllSearch(IncomeDto dto) {
		return incomeImp.incomeAllSearch(dto);
	}

	@Override
	public List<IncomeDto> incomeTopSearch(String id) {
		return incomeImp.incomeTopSearch(id);
	}

	@Transactional
	@Override
	public boolean incomeInsert(IncomeDto dto) {
		boolean isc=false;
		
		String id=dto.getId();
		
		 incomeImp.incomeInsert(dto);
		 isc=incomeImp.incomeInsertPoint(id);
		
		return isc;
	}

	@Override
	public IncomeDto incomeDetailSearch(int i_seq) {
		return incomeImp.incomeDetailSearch(i_seq);
	}

	@Override
	public boolean incomeUpdate(IncomeDto dto) {
		return incomeImp.incomeUpdate(dto);
	}

	@Override
	public boolean incomeDelete(int seq) {
		return incomeImp.incomeDelete(seq);
	}

	@Override
	public List<IncomeDto> incomeChartAjax(IncomeDto dto) {
		return incomeImp.incomeChartAjax(dto);
	}

	
	

}
