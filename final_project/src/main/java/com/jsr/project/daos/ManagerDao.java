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


	//특정 회원 검색(아이디) 
	@Override
	public List<MembersDto> searchById(String id) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectList(namespace+"searchById", map);
	}
	//특정 회원 검색(이름) 
	@Override
	public List<MembersDto> searchByName(String m_name) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("m_name", m_name);
		return sqlSession.selectList(namespace+"searchByName", map);
	}
	//특정 회원 검색(전화번호) 
	@Override
	public List<MembersDto> searchByPhone(String m_phone) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("m_phone", m_phone);
		return sqlSession.selectList(namespace+"searchByPhone", map);
	}

	//탈퇴
	@Override
	public boolean deleteMember(MembersDto mdto) {
		int count=0; 
		count = sqlSession.delete(namespace+"leaveUser", mdto);
		return count>0?true:false; 
	}

}
