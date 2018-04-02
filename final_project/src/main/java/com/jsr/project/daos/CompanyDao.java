package com.jsr.project.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.CompanyDto;

@Repository
public class CompanyDao implements ICompanyDao {


	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.jsr.project.company."; 

	@Override
	public List<CompanyDto> getAllCompany() {
		return sqlSession.selectList(namespace+"getAllCompany");
	}

	@Override
	public boolean updateCompany(CompanyDto cdto) {
		int count=0;
		count=sqlSession.update(namespace+"updateCompany", cdto);
		return count>0?true:false;
	}

	@Override
	public boolean insertCompany(CompanyDto cdto) {
		int count=0;
		count=sqlSession.update(namespace+"insertCompany", cdto);
		return count>0?true:false;
	}

}
