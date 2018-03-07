package com.jsr.project.daos;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.PointDto;

@Repository
public class AcountDao implements IAcountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.acount.";

	
	@Override
	public boolean goalInsert(AcountDto dto) {
		int count=0;
		
		System.out.println("goalInsertDao action");
		count=sqlSession.insert(namespace+"goalInsert", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean goalRegInsert(AcountDto dto) {
		int count=0;
		
		System.out.println("goalRegInsert action");
		count=sqlSession.update(namespace+"goalRegInsert",dto);
		System.out.println("goalRegInsert end");
		return count>0?true:false;
	}

	@Override
	public boolean goalPointInsert(AcountDto dto) {
		int count=0;
		System.out.println("goalPointInsert action");
		count=sqlSession.insert(namespace+"goalPointInsert",dto);
		System.out.println("goalPointInsert end");
		return count>0?true:false;
	}


}
