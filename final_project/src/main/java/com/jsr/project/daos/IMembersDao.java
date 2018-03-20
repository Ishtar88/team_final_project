package com.jsr.project.daos;

import com.jsr.project.dtos.MembersDto;

public interface IMembersDao {

	public MembersDto login(MembersDto mdto);
	public MembersDto idChk(String id);
	public boolean regist(MembersDto mdto);
	public MembersDto getUser(String id);
	public boolean changeProfile(MembersDto mdto);
	public boolean modifyUser(MembersDto mdto);
	public boolean kakaoLogin(MembersDto mdto);
	public boolean addPoint(String id,String po_point);
	public MembersDto chkPw(MembersDto mdto);
	public boolean leaveUser(MembersDto mdto);
	public MembersDto findId(MembersDto mdto);
	public MembersDto findPw(MembersDto mdto);
	public boolean changePW(String id,String m_password);
}
