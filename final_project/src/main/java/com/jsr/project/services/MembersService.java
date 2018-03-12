package com.jsr.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public MembersDto getUser(String id) {
		return ImemberDao.getUser(id);
	}

	@Override
	public boolean changeProfile(MembersDto mdto) {
		return ImemberDao.changeProfile(mdto);
	}

	@Override
	public boolean modifyUser(MembersDto mdto) {
		return ImemberDao.modifyUser(mdto);
	}

	@Override
	public boolean kakaoLogin(MembersDto mdto) {
		return ImemberDao.kakaoLogin(mdto);
	}

	@Override
	public boolean addPoint(MembersDto mdto) {
		return ImemberDao.addPoint(mdto);
	}

	@Override
	public MembersDto chkPw(MembersDto mdto) {
		return ImemberDao.chkPw(mdto);
	}

	@Override
	public boolean leaveUser(MembersDto mdto) {
		return ImemberDao.leaveUser(mdto);
	}

	@Override
	public MembersDto findId(MembersDto mdto) {
		return ImemberDao.findId(mdto);
	}

	@Transactional
	@Override
	public MembersDto findPw(MembersDto mdto,String id,String m_password) {
		ImemberDao.changePW(id, m_password);
		return ImemberDao.findPw(mdto);
	}
	

}
