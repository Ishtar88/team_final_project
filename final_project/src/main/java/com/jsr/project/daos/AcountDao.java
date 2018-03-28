package com.jsr.project.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class AcountDao implements IAcountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.acount.";

	
	@Override
	public boolean goalInsert(GoalDto dto) {
		int count=0;
		
		System.out.println("goalInsertDao action");
		count=sqlSession.insert(namespace+"goalInsert", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean goalRegInsert(GoalDto dto) {
		int count=0;
		
		System.out.println("goalRegInsert action");
		count=sqlSession.update(namespace+"goalRegInsert",dto);
		System.out.println("goalRegInsert end");
		return count>0?true:false;
	}

	@Override
	public boolean goalPointInsert(String id) {
		int count=0;
		System.out.println("goalPointInsert action");
		count=sqlSession.insert(namespace+"goalPointInsert",id);
		System.out.println("goalPointInsert end");
		return count>0?true:false;
	}

	@Override
	public AcountDto acountTotalSearch(MembersDto dto) {
		System.out.println("acountTotal action");
		
		return sqlSession.selectOne(namespace+"acountTotal", dto);
	}
	
	//-----------------------------------------------------------

	@Override
	public List<StockDto> stockAllSearch(String id) {
		
		List<StockDto> dto=sqlSession.selectList(namespace+"stockAllSearch", id);
		System.out.println("List<StockDto>: "+dto);
		
		return dto;
	}

	@Override
	public List<FundDto> fundAllSearch(String id) {
		
		List<FundDto> dto=sqlSession.selectList(namespace+"fundAllSearch", id);
		System.out.println("List<fundDto>: "+dto);
		
		return dto;
	}

	@Override
	public List<LoanDto> loanAllSearch(String id) {
		
		List<LoanDto> dto=sqlSession.selectList(namespace+"loanAllSearch", id);
		System.out.println("List<LoanDto>: "+dto);
		
		return dto;
	}

	@Override
	public List<SaveDto> saveAllSearch(String id) {
		
		List<SaveDto> dto=sqlSession.selectList(namespace+"saveAllSearch", id);
		System.out.println("List<SaveDto>: "+dto);
		
		return dto;
	}

	//-----------------------------------------------------------
	
	@Override
	public SaveDto saveDetailSearch(int seq) {
		
		SaveDto dto=sqlSession.selectOne(namespace+"saveDetailSearch", seq);
		
		return dto;
	}
	
	@Override
	public StockDto stockDetailSearch(int seq) {
		
		StockDto dto=sqlSession.selectOne(namespace+"stockDetailSearch", seq);
		
		return dto;
	}

	@Override
	public FundDto fundDetailSearch(int seq) {
		
		FundDto dto=sqlSession.selectOne(namespace+"fundDetailSearch", seq);
		
		return dto;
	}

	@Override
	public LoanDto loanDetailSearch(int seq) {
		
		LoanDto dto=sqlSession.selectOne(namespace+"loanDetailSearch", seq);
		
		return dto;
	}
	
	//-----------------------------------------------------------

	@Override
	public boolean saveDelete(int seq) {
		int count=0;
		
		count=sqlSession.delete(namespace+"saveDelete", seq);
		
		return count>0?true:false;
	}
	
	@Override
	public boolean stockDelete(int seq) {
		int count=0;
		
		count=sqlSession.delete(namespace+"stockDelete", seq);
		
		return count>0?true:false;
	}

	@Override
	public boolean fundDelete(int seq) {
		int count=0;
		
		count=sqlSession.delete(namespace+"fundDelete", seq);
		
		return count>0?true:false;
	}

	@Override
	public boolean loanDelete(int seq) {
		int count=0;
		
		count=sqlSession.delete(namespace+"loanDelete", seq);
		
		return count>0?true:false;
	}
	
	//----------------------------------------------------------

	@Override
	public boolean saveUpdate(SaveDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"saveUpdate", dto);
		return count>0?true:false;
	}
	
	
	@Override
	public boolean stockupdate(StockDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"stockUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public boolean fundUpdate(FundDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"fundUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public boolean loanUpdate(LoanDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"loanUpdate", dto);
		return count>0?true:false;
	}
	
	//----------------------------------------------------

	@Override
	public boolean saveInsert(SaveDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"saveInsert", dto);
		return count>0?true:false;
	}
	@Override
	public boolean saveAddInsert() {
		int count=0;
		
		count=sqlSession.insert(namespace+"saveAddInsert");
		return count>0?true:false;
	}

	@Override
	public boolean stockInsert(StockDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"stockInsert", dto);
		return count>0?true:false;
	}

	@Override
	public boolean fundInsert(FundDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"fundInsert", dto);
		return count>0?true:false;
	}

	@Override
	public boolean loanInsert(LoanDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"loanInsert", dto);
		return count>0?true:false;
	}
	
	
	//----------------------------------------------------

	@Override
	public boolean saveEnd(SaveDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"saveEnd", dto);
		return count>0?true:false;
	}

	@Override
	public boolean stockEnd(StockDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"stockEnd", dto);
		return count>0?true:false;
	}

	@Override
	public boolean fundEnd(FundDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"fundEnd", dto);
		return count>0?true:false;
	}

	@Override
	public boolean loanEnd(LoanDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"loanEnd", dto);
		return count>0?true:false;
	}
	
	
	
	//----------------------------------------------------
	

	@Override
	public List<SpendingDto> calendarSpendingSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"calendarSpendingSearch", dto);
	}

	@Override
	public List<IncomeDto> calendarIncomeSearch(IncomeDto dto) {
		return sqlSession.selectList(namespace+"calendarIncomeSearch", dto);
	}

	@Override
	public IncomeDto calendarDetailSearch(IncomeDto dto) {
		return sqlSession.selectOne(namespace+"calendarDetailSearch",dto);
	}

	@Override
	public List<IncomeDto> calendarIncomeDetailSearch(IncomeDto dto) {
		return sqlSession.selectList(namespace+"calendarIncomeDetailSearch", dto);
	}

	@Override
	public List<SpendingDto> calendarSpendingDetailSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"calendarSpendingDetailSearch", dto);
	}

	@Override
	public SaveDto saveTotalMoney(String id) {
		return sqlSession.selectOne(namespace+"saveTotalMoney", id);
	}

	@Override
	public StockDto stockTotalMoney(String id) {
		return sqlSession.selectOne(namespace+"stockTotalMoney", id);
	}

	@Override
	public FundDto fundTotalMoney(String id) {
		return sqlSession.selectOne(namespace+"fundTotalMoney", id);
	}

	@Override
	public LoanDto loanTotalMoney(String id) {
		return sqlSession.selectOne(namespace+"loanTotalMoney", id);
	}

	
	//리워드몰 뽑기기능
	@Override
	public RewardDto dobakCheck(RewardDto rdto) {
		return sqlSession.selectOne(namespace+"dobakCheck", rdto);
	}

	@Override
	public boolean buyDobak(ProductDto proDto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"buyDobak", proDto);
		return count>0?true:false;
	}

	@Override
	public boolean minusPointDobak(PointDto poDto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"minusPointDobak", poDto);
		return count>0?true:false;
	}

	@Override
	public GoalDto goalTotalMoney(String id) {
		return sqlSession.selectOne(namespace+"goalTotalMoney", id);
	}

	@Override
	public List<GoalDto> goalAllSearch(String id) {
		return sqlSession.selectList(namespace+"goalAllSearch", id);
	}














}
