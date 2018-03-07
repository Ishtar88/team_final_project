package com.jsr.project.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.IAcountDao;
import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.PointDto;

@Service
public class AcountService implements IAcountService {

	@Autowired
	private IAcountDao acountDaoImp;
	
	@Transactional
	@Override
	public boolean goalInsert(AcountDto dto) {
		boolean isc=false;
		acountDaoImp.goalInsert(dto);
		isc=acountDaoImp.goalRegInsert(dto);
		
		return isc;
	}

	@Override
	public boolean goalPointInsert(AcountDto dto) {
		boolean isc=false;
		isc=acountDaoImp.goalPointInsert(dto);
		return isc;
	}
	
	
	
}
