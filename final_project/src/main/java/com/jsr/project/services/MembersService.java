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

	@Transactional
	@Override
	public boolean regist(MembersDto mdto,String id,String po_point) {
		ImemberDao.regist(mdto);
		return ImemberDao.addPoint(id, po_point);
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

	@Transactional
	@Override
	public boolean kakaoLogin(MembersDto mdto) {
		ImemberDao.kakaoLogin(mdto);
		return ImemberDao.addPoint(mdto.getId(), "100");
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

	@Override
	public boolean changePW(String id, String m_password) {
		return ImemberDao.changePW(id, m_password);
	}
	

}
