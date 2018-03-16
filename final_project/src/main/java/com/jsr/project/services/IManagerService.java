package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.MembersDto;

public interface IManagerService {
	
	public List<MembersDto> getAllMember();
	public List<MembersDto> getSearchedMember(String id); 
	public MembersDto modifyMember(String id); 
	public boolean afterModifyMember(MembersDto dto);
	public MembersDto deleteMember(String id);
	public boolean confirmDelete(String id);
	
}
