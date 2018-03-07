package com.jsr.project.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.MembersDto;

@Repository
public class MembersDao implements IMembersDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.members.";

	@Override
	public MembersDto login(MembersDto mdto) {
		System.out.println("dao����");
		System.out.println(mdto.getId()+"////"+mdto.getM_password());
		return sqlSession.selectOne(namespace+"login", mdto);
	}

	@Override
	public MembersDto idChk(String id) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectOne(namespace+"idChk",map);
	}

	@Override
	public boolean regist(MembersDto mdto) {
		int count=0;
		count=sqlSession.insert(namespace+"regist", mdto);
		return count>0?true:false;
	}
	

	
}
