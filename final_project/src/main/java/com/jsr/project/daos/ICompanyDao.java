package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.CompanyDto;

public interface ICompanyDao {

	public List<CompanyDto> getAllCompany();
	
}
