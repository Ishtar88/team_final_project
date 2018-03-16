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
		return sqlSession.selectOne(namespace+"modifyMember", id); 
	}

	//수정한 뒤 처리 
	@Override
	public boolean afterModifyMember(MembersDto dto) {
		int count=0; 
		count= sqlSession.update(namespace+"afterModify", dto); 
		return count>0?true:false; 
	}

	//탈퇴 전 마지막 확인 페이지 
	@Override
	public MembersDto deleteMember(String id) {
		return sqlSession.selectOne(namespace+"deleteMember", id);
	}

	//탈퇴시키기 
	@Override
	public boolean confirmDelete(String id) {
		int count=0; 
		count = sqlSession.delete(namespace+"confirmDelete", id);
		return count>0?true:false; 
	}

}
