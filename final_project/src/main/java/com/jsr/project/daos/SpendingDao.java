package com.jsr.project.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.SpendingDto;

@Repository
public class SpendingDao implements ISpendingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.spending.";
	
	
	@Override
	public boolean spendingInsert(SpendingDto dto) {
		int count=0;
		
		count=sqlSession.insert(namespace+"spendingInsert", dto);
		return count>0?true:false;
	}
	
	//---------------------지출 메인 페이지 정보 조회----------------------

	@Override
	public SpendingDto spendingSumMoney(SpendingDto dto) {
		return sqlSession.selectOne(namespace+"spendingSumMoney", dto);
	}
	
	@Override
	public List<SpendingDto> spendingMoneyTop(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingMoneyTop", dto);
	}

	@Override
	public List<SpendingDto> spendingCountTop(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingCountTop", dto);
	}

	@Override
	public List<SpendingDto> spendingAllSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingAllSearch", dto);
	}

	@Override
	public List<SpendingDto> spendingDateSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingDateSearch", dto);
	}

	@Override
	public List<SpendingDto> spendingCategorySearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingCategorySearch", dto);
	}

	@Override
	public List<SpendingDto> spendingSomeSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingSomeSearch", dto);
	}
	
	@Override
	public SpendingDto spendingcurrentMoneySearch(SpendingDto dto) {
		return sqlSession.selectOne(namespace+"spendingcurrentMoneySearch", dto);
	}
	
	@Override
	public SpendingDto spendingAvgMoneySearch(SpendingDto dto) {
		return sqlSession.selectOne(namespace+"spendingAvgMoneySearch", dto);
	}

	@Override
	public SpendingDto spendingTotalCountSearch(SpendingDto dto) {
		return sqlSession.selectOne(namespace+"spendingTotalCountSearch", dto);
	}
	
	@Override
	public List<SpendingDto> spendingSomeTotalSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingSomeTotalSearch", dto);
	}

	@Override
	public List<SpendingDto> spendingSomeCountSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"spendingSomeCountSearch", dto);
	}


	//---------------------------------------------------------------
	
	@Override
	public SpendingDto spendingDetailSearch(int p_seq) {
		return sqlSession.selectOne(namespace+"spendingDetailSearch", p_seq);
	}

	@Override
	public boolean spendingUpdate(SpendingDto dto) {
		int count=0;
		
		count=sqlSession.update(namespace+"spendingUpdate", dto);
		
		return count>0?true:false;
	}

	@Override
	public boolean spendingDelete(int seq) {
		int count=0;
		
		count=sqlSession.delete(namespace+"spendingDelete", seq);
		
		return count>0?true:false;
	}

	@Override
	public List<SpendingDto> dateChartSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"dateChartSearch", dto);
	}

	@Override
	public List<SpendingDto> categoryChartSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"categoryChartSearch", dto);
	}

	@Override
	public List<SpendingDto> someChartSearch(SpendingDto dto) {
		return sqlSession.selectList(namespace+"someChartSearch", dto);
	}






	
	
	
}
