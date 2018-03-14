package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.ISpendingDao;
import com.jsr.project.dtos.SpendingDto;

@Service
public class SpendingService implements ISpendingService {
	
	@Autowired
	private ISpendingDao spendingDaoImp;

	@Override
	public boolean spendingInsert(SpendingDto dto) {
		return spendingDaoImp.spendingInsert(dto);
	}

	@Override
	public SpendingDto spendingSumMoney(SpendingDto dto) {
		return spendingDaoImp.spendingSumMoney(dto);
	}
	
	@Override
	public List<SpendingDto> spendingMoneyTop(SpendingDto dto) {
		return spendingDaoImp.spendingMoneyTop(dto);
	}

	@Override
	public List<SpendingDto> spendingCountTop(SpendingDto dto) {
		return spendingDaoImp.spendingCountTop(dto);
	}

	@Override
	public List<SpendingDto> spendingAllSearch(SpendingDto dto) {
		return spendingDaoImp.spendingAllSearch(dto);
	}

	@Override
	public List<SpendingDto> spendingDetailSearch(SpendingDto dto) {
		return null;
	}


	
	
}
