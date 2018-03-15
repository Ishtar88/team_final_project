package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.MembersDto;

public interface IManagerService {
	
	public List<MembersDto> getAllMember();
	public List<MembersDto> getSearchedMember(String id); 
	public MembersDto modifyMember(String id); 
}
