package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.MembersDto;

public interface IManagerDao {
	
	public List<MembersDto> getAllMember(); 
	public List<MembersDto> getSearchedMember(String id); 
	public MembersDto modifyMember(String id); 
}
