package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IManagerDao;
import com.jsr.project.dtos.MembersDto;

@Service
public class ManagerService implements IManagerService {

	@Autowired
	private IManagerDao managerDao; 
	
	@Override
	public List<MembersDto> getAllMember() {
		return managerDao.getAllMember();
	}

	@Override
	public MembersDto getSearchedMember(MembersDto dto) {
		return managerDao.getSearchedMember(dto);
	}

}
