package com.jsr.project.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.IAcountDao;
import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.LoanDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.StockDto;

@Service
public class AcountService implements IAcountService {

	@Autowired
	private IAcountDao acountDaoImp;
	
	@Transactional
	@Override
	public boolean goalInsert(GoalDto dto) {
		boolean isc=false;
		acountDaoImp.goalInsert(dto);
		isc=acountDaoImp.goalRegInsert(dto);
		
		return isc;
	}

	@Override
	public boolean goalPointInsert(GoalDto dto) {
		boolean isc=false;
		isc=acountDaoImp.goalPointInsert(dto);
		return isc;
	}

	@Override
	public AcountDto acountTotalSearch(MembersDto dto) {
		
		return acountDaoImp.acountTotalSearch(dto);
	}
	
	@Override
	public boolean acountAllSearch(String id) {
		boolean isc=false;
		
		acountDaoImp.stockAllSearch(id);
		acountDaoImp.fundAllSearch(id);
		acountDaoImp.loanAllSearch(id);
		acountDaoImp.saveAllSearch(id);
		
		return false;
	}
	
	

	@Override
	public List<StockDto> stockAllSearch(String id) {
		return acountDaoImp.stockAllSearch(id);
	}

	@Override
	public List<FundDto> fundAllSearch(String id) {
		return acountDaoImp.fundAllSearch(id);
	}

	@Override
	public List<LoanDto> loanAllSearch(String id) {
		return acountDaoImp.loanAllSearch(id);
	}

	@Override
	public List<SaveDto> saveAllSearch(String id) {
		return acountDaoImp.saveAllSearch(id);
	}

	@Override
	public SaveDto saveDetailSearch(int seq) {
		return acountDaoImp.saveDetailSearch(seq);
	}

	@Override
	public boolean saveDelete(int seq) {
		return acountDaoImp.saveDelete(seq);
	}

	@Override
	public boolean saveUpdate(SaveDto dto) {
		return acountDaoImp.saveUpdate(dto);
	}

	
	
	
	
	
	
	
	
}
