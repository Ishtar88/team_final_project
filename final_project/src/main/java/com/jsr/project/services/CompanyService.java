package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.ICompanyDao;
import com.jsr.project.dtos.CompanyDto;

@Service
public class CompanyService implements ICompanyService {

@Autowired
 private ICompanyDao companyDao; 
	
	@Override
	public List<CompanyDto> getAllCompany() {
		return companyDao.getAllCompany();
	}

}
