package com.jsr.project.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.MembersDto;

@Repository
public class ManagerDao implements IManagerDao {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.jsr.project.members."; 
	
	
	//모든 회원 조회 
	@Override
	public List<MembersDto> getAllMember() {
		return sqlSession.selectList(namespace+"showMember");
	}


	@Override
	public boolean getSearchedMember(MembersDto dto) {
		int count=0;
		count= sqlSession.selectMap(namespace+"searchMember",dto);
		return count>0?true:false
		//으악~! 
	}

}
