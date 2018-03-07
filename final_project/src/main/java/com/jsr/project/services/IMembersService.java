package com.jsr.project.services;

import com.jsr.project.dtos.MembersDto;

public interface IMembersService {

	public MembersDto login(MembersDto mdto);
	public MembersDto idChk(String id);
	public boolean regist(MembersDto mdto);
}
