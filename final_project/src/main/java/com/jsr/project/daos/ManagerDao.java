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
		System.out.println("안녕?");
		return sqlSession.selectList(namespace+"showMember");
	}


	@Override
	public MembersDto getSearchedMember(MembersDto dto) {
//		 sqlSession.selectMap(namespace+"searchMember",dto);
		return dto; 
		//으악~! 
	}

}
