package com.jsr.project.services;

import com.jsr.project.dtos.MembersDto;

public interface IMembersService {

	public MembersDto login(MembersDto mdto);
	public MembersDto idChk(String id);
	public boolean regist(MembersDto mdto,String id,String po_point);
	public MembersDto getUser(String id);
	public boolean changeProfile(MembersDto mdto);
	public boolean modifyUser(MembersDto mdto);
	public boolean kakaoLogin(MembersDto mdto);
	public MembersDto chkPw(MembersDto mdto);
	public boolean leaveUser(MembersDto mdto);
	public MembersDto findId(MembersDto mdto);
	public MembersDto findPw(MembersDto mdto,String id,String m_password);
	public boolean changePW(String id,String m_password);
}
