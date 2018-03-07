package com.jsr.project.daos;

import com.jsr.project.dtos.MembersDto;

public interface IMembersDao {

	public MembersDto login(MembersDto mdto);
	public MembersDto idChk(String id);
	public boolean regist(MembersDto mdto);
}
