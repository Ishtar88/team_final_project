package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.MembersDto;

public interface IManagerService {
	
	public List<MembersDto> getAllMember( ); 
	public List<MembersDto> searchById(String id);
	public List<MembersDto> searchByName(String m_name);
	public List<MembersDto> searchByPhone(String m_phone);
	
	public boolean deleteMember(MembersDto mdto); 
	
}
