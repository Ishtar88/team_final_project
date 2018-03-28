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
	public List<SpendingDto> spendingDateSearch(SpendingDto dto) {
		return spendingDaoImp.spendingDateSearch(dto);
	}

	@Override
	public List<SpendingDto> spendingCategorySearch(SpendingDto dto) {
		return spendingDaoImp.spendingCategorySearch(dto);
	}

	@Override
	public List<SpendingDto> spendingSomeSearch(SpendingDto dto) {
		return spendingDaoImp.spendingSomeSearch(dto);
	}
	
	@Override
	public SpendingDto spendingcurrentMoneySearch(SpendingDto dto) {
		return spendingDaoImp.spendingcurrentMoneySearch(dto);
	}

	@Override
	public SpendingDto spendingAvgMoneySearch(SpendingDto dto) {
		return spendingDaoImp.spendingAvgMoneySearch(dto);
	}

	@Override
	public SpendingDto spendingTotalCountSearch(SpendingDto dto) {
		return spendingDaoImp.spendingTotalCountSearch(dto);
	}
	
	@Override
	public List<SpendingDto> spendingSomeTotalSearch(SpendingDto dto) {
		return spendingDaoImp.spendingSomeTotalSearch(dto);
	}

	@Override
	public List<SpendingDto> spendingSomeCountSearch(SpendingDto dto) {
		return spendingDaoImp.spendingSomeCountSearch(dto);
	}
	
	

	@Override
	public SpendingDto spendingDetailSearch(int p_seq) {
		return spendingDaoImp.spendingDetailSearch(p_seq);
	}

	@Override
	public boolean spendingUpdate(SpendingDto dto) {
		return spendingDaoImp.spendingUpdate(dto);
	}

	@Override
	public boolean spendingDelete(int seq) {
		return spendingDaoImp.spendingDelete(seq);
	}

	@Override
	public List<SpendingDto> dateChartSearch(SpendingDto dto) {
		return spendingDaoImp.dateChartSearch(dto);
	}

	@Override
	public List<SpendingDto> categoryChartSearch(SpendingDto dto) {
		return spendingDaoImp.categoryChartSearch(dto);
	}

	@Override
	public List<SpendingDto> someChartSearch(SpendingDto dto) {
		return spendingDaoImp.someChartSearch(dto);
	}





	
	
}
