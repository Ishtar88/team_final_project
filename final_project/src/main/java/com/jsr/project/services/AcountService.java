package com.jsr.project.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.IAcountDao;
import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.FundDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.IncomeDto;
import com.jsr.project.dtos.LoanDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.ProductDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;
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
	public boolean goalPointInsert(String id) {
		boolean isc=false;
		isc=acountDaoImp.goalPointInsert(id);
		return isc;
	}

	@Override
	public AcountDto acountTotalSearch(MembersDto dto) {
		
		return acountDaoImp.acountTotalSearch(dto);
	}
	
	
	@Override
	public GoalDto goalTotalMoney(String id) {
		return acountDaoImp.goalTotalMoney(id);
	}

	@Override
	public List<GoalDto> goalAllSearch(String id) {
		return acountDaoImp.goalAllSearch(id);
	}
	
	//----------------------------------------------

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
	
	//----------------------------------------------

	@Override
	public SaveDto saveDetailSearch(int seq) {
		return acountDaoImp.saveDetailSearch(seq);
	}
	
	@Override
	public StockDto stockDetailSearch(int seq) {
		return acountDaoImp.stockDetailSearch(seq);
	}

	@Override
	public FundDto fundDetailSearch(int seq) {
		return acountDaoImp.fundDetailSearch(seq);
	}

	@Override
	public LoanDto loanDetailSearch(int seq) {
		return acountDaoImp.loanDetailSearch(seq);
	}
	
	//----------------------------------------------

	@Override
	public boolean saveDelete(int seq) {
		return acountDaoImp.saveDelete(seq);
	}
	
	@Override
	public boolean stockDelete(int seq) {
		return acountDaoImp.stockDelete(seq);
	}

	@Override
	public boolean fundDelete(int seq) {
		return acountDaoImp.fundDelete(seq);
	}

	@Override
	public boolean loanDelete(int seq) {
		return acountDaoImp.loanDelete(seq);
	}
	
	//----------------------------------------------

	@Override
	public boolean saveUpdate(SaveDto dto) {
		return acountDaoImp.saveUpdate(dto);
	}
	
	@Override
	public boolean stockupdate(StockDto dto) {
		return acountDaoImp.stockupdate(dto);
	}

	@Override
	public boolean fundUpdate(FundDto dto) {
		return acountDaoImp.fundUpdate(dto);
	}

	@Override
	public boolean loanUpdate(LoanDto dto) {
		return acountDaoImp.loanUpdate(dto);
	}
	
	//----------------------------------------------

	@Override
	public boolean goalRegInsert(GoalDto dto) {
		return acountDaoImp.goalRegInsert(dto);
	}

	@Transactional
	@Override
	public boolean saveInsert(SaveDto dto) {
		boolean isc=false;
		
		acountDaoImp.saveInsert(dto);
		isc=acountDaoImp.saveAddInsert();
		
		return isc;
	}

	@Override
	public boolean stockInsert(StockDto dto) {
		return acountDaoImp.stockInsert(dto);
	}

	@Override
	public boolean fundInsert(FundDto dto) {
		return acountDaoImp.fundInsert(dto);
	}

	@Override
	public boolean loanInsert(LoanDto dto) {
		return acountDaoImp.loanInsert(dto);
	}

	@Override
	public List<SpendingDto> calendarSpendingSearch(SpendingDto dto) {
		return acountDaoImp.calendarSpendingSearch(dto);
	}

	@Override
	public List<IncomeDto> calendarIncomeSearch(IncomeDto dto) {
		return acountDaoImp.calendarIncomeSearch(dto);
	}

	@Override
	public IncomeDto calendarDetailSearch(IncomeDto dto) {
		return acountDaoImp.calendarDetailSearch(dto);
	}

	@Override
	public List<IncomeDto> calendarIncomeDetailSearch(IncomeDto dto) {
		return acountDaoImp.calendarIncomeDetailSearch(dto);
	}

	@Override
	public List<SpendingDto> calendarSpendingDetailSearch(SpendingDto dto) {
		return acountDaoImp.calendarSpendingDetailSearch(dto);
	}

	//----------------------------------------------

	@Override
	public SaveDto saveTotalMoney(String id) {
		return acountDaoImp.saveTotalMoney(id);
	}

	@Override
	public StockDto stockTotalMoney(String id) {
		return acountDaoImp.stockTotalMoney(id);
	}

	@Override
	public FundDto fundTotalMoney(String id) {
		return acountDaoImp.fundTotalMoney(id);
	}

	@Override
	public LoanDto loanTotalMoney(String id) {
		return acountDaoImp.loanTotalMoney(id);
	}


	//----------------------------------------------

	
	
	@Override
	public RewardDto dobakCheck(RewardDto rdto) {
		return acountDaoImp.dobakCheck(rdto);
	}

	//뽑기 성공했을 때의 로직
	@Override
	public boolean buyDobakSuccess(PointDto poDto, ProductDto proDto) {
		acountDaoImp.buyDobak(proDto);
		return acountDaoImp.minusPointDobak(poDto);
	}

	//뽑기 실패했을 때의 로직
	@Override
	public boolean buyDobakFail(PointDto poDto) {
		return acountDaoImp.minusPointDobak(poDto);
	}


	
	
	
	







	
	
	
	
	
}
