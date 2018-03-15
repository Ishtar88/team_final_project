package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	//특정 회원 검색 
	@Override
	public List<MembersDto> getSearchedMember(String id) {
		return sqlSession.selectList(namespace+"searchMember", id);
	}

	//회원 정보 매니저가 수정하기 
	@Override
	public MembersDto modifyMember(String id) {
		return sqlSession.selectList(namespace+"modifyMember", id); 
	}

}
