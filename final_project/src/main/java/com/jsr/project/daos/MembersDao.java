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
		System.out.println("id:"+mdto.getId()+"/pw:"+mdto.getM_password());
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

	@Override
	public MembersDto getUser(String id) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectOne(namespace+"getUser", map);
	}

	@Override
	public boolean changeProfile(MembersDto mdto) {
		int count=0;
		count=sqlSession.update(namespace+"changeProfile", mdto);
		return count>0?true:false;
	}

	@Override
	public boolean modifyUser(MembersDto mdto) {
		int count=0;
		count=sqlSession.update(namespace+"modifyUser", mdto);
		return count>0?true:false;
	}

	@Override
	public boolean kakaoLogin(MembersDto mdto) {
		int count=0;
		count=sqlSession.insert(namespace+"kakaoRegist", mdto);
		return count>0?true:false;
	}

	@Override
	public boolean addPoint(String id,String po_point) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("id", id);
		map.put("po_point", po_point);
		int count=0;
		count=sqlSession.insert(namespace+"addPoint", map);
		return count>0?true:false;
	}

	@Override
	public MembersDto chkPw(MembersDto mdto) {
		return sqlSession.selectOne(namespace+"chkPassword", mdto);
	}

	@Override
	public boolean leaveUser(MembersDto mdto) {
		int count=0;
		count=sqlSession.insert(namespace+"leaveUser", mdto);
		return count>0?true:false;
	}

	@Override
	public MembersDto findId(MembersDto mdto) {
		return sqlSession.selectOne(namespace+"findId",mdto);
	}

	@Override
	public MembersDto findPw(MembersDto mdto) {
		return sqlSession.selectOne(namespace+"findPw",mdto);
	}

	@Override
	public boolean changePW(String id, String m_password) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("id", id);
		map.put("m_password", m_password);
		
		int count=0;
		count=sqlSession.update(namespace+"changePw", map);
		return count>0?true:false;
	}
	

	
}
