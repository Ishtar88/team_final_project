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
	public List<MembersDto> searchById(String id) {
		return managerDao.searchById(id);
	}

	@Override
	public List<MembersDto> searchByName(String m_name) {
		return managerDao.searchByName(m_name);
	}

	@Override
	public List<MembersDto> searchByPhone(String m_phone) {
		return managerDao.searchByPhone(m_phone);
	}

	@Override
	public boolean deleteMember(MembersDto mdto) {
		return managerDao.deleteMember(mdto);
	} 
	


}
