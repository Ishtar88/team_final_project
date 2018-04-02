package com.jsr.project.services;


import java.util.List;

import com.jsr.project.dtos.*;

public interface IAcountService {
	
	//목표등록 기능
	public boolean goalInsert(String id,String[] g_money,String[] g_name,String[] g_memo);
	
	//public boolean goalRegInsert(GoalDto dto);
	
	//public boolean goalPointInsert(String id);
	
	public GoalDto goalTotalMoney(String id);
	
	public List<GoalDto> goalAllSearch(String id);
	
	public boolean goalUpdate(String[] g_seq,String[] g_money,String[] g_name,String[] g_memo);
	
	public boolean goalDelete(GoalDto gdto);
	
	//----------------------------------
	
	//자산정보 전체 조회 기능
	public AcountDto acountTotalSearch(MembersDto dto);
	
	public List<StockDto> stockAllSearch(String id);
	
	public List<FundDto> fundAllSearch(String id);

	public List<LoanDto> loanAllSearch(String id);

	public List<SaveDto> saveAllSearch(String id);
	
	
	//----------------------------------

	//자산 정보 상세조회 기능
	public SaveDto saveDetailSearch(int seq);
	
	public StockDto stockDetailSearch(int seq);
	
	public FundDto fundDetailSearch(int seq);
	
	public LoanDto loanDetailSearch(int seq);
	
	//----------------------------------
	
	
	//자산 수정 및 삭제 기능
	public boolean saveDelete(int seq);
	
	public boolean stockDelete(int seq);
	
	public boolean fundDelete(int seq);
	
	public boolean loanDelete(int seq);
	
	public boolean saveUpdate(SaveDto dto);
	
	public boolean stockupdate(StockDto dto);
	
	public boolean fundUpdate(FundDto dto);
	
	public boolean loanUpdate(LoanDto dto);
	
	//----------------------------------


	//자산 만기 등록 기능
	public boolean saveEnd(SaveDto dto);
	
	public boolean stockEnd(StockDto dto);
	
	public boolean fundEnd(FundDto dto);
	
	public boolean loanEnd(LoanDto dto);
	
	
	//----------------------------------
	
	//자산등록 기능
	public boolean saveInsert(SaveDto dto);
	
	public boolean stockInsert(StockDto dto);
	
	public boolean fundInsert(FundDto dto);
	
	public boolean loanInsert(LoanDto dto);


	//----------------------------------
	
	
	//달력 당월 지출액조회
	public List<SpendingDto> calendarSpendingSearch(SpendingDto dto);
	
	//달력 당월 수입액조회
	public List<IncomeDto> calendarIncomeSearch(IncomeDto dto);
	
	//달력 선택한 날짜 정보 조회
	public IncomeDto calendarDetailSearch(IncomeDto dto);
	
	
	//달력 수입상세조회
	public List<IncomeDto> calendarIncomeDetailSearch(IncomeDto dto);
	
	//달력 지출상세조회
	public List<SpendingDto> calendarSpendingDetailSearch(SpendingDto dto);
	
	
	//----------------------------------

	//저축총액 조회
	public SaveDto saveTotalMoney(String id);
	
	//펀드총액 조회
	public StockDto stockTotalMoney(String id);
	
	//투자총핵 조회
	public FundDto fundTotalMoney(String id);
	
	//대출총액 조회
	public LoanDto loanTotalMoney(String id);
	
	
	//----------------------------------
	
	
	
	//-------------리워드몰 뽑기 기능---------------------

	//뽑기 체크여부 확인
	public RewardDto dobakCheck(RewardDto rdto);
	
	//뽑기 기능
	//성공
	public boolean buyDobakSuccess(ProductDto proDto);

	
	public boolean minusPointDobakStart(String id);
	
	
	//-----------------------------------------------

	
	
}
