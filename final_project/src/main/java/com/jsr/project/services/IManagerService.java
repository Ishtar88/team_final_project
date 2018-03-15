package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.MembersDto;

public interface IManagerService {
	
	public List<MembersDto> getAllMember();
	public boolean getSearchedMember(MembersDto dto);

}
