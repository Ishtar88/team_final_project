package com.jsr.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IMembersDao;
import com.jsr.project.dtos.MembersDto;

@Service
public class MembersService implements IMembersService {
	
	@Autowired
	private IMembersDao ImemberDao;

	@Override
	public MembersDto login(MembersDto mdto) {
		return ImemberDao.login(mdto);
	}

	@Override
	public MembersDto idChk(String id) {
		return ImemberDao.idChk(id);
	}

	@Override
	public boolean regist(MembersDto mdto) {
		return ImemberDao.regist(mdto);
	}
	

}
