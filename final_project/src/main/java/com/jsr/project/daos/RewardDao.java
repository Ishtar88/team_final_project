package com.jsr.project.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.RewardDto;

@Repository
public class RewardDao implements IRewardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.jsr.project.reward.";

	@Override
	public boolean insertReward(RewardDto rdto) {
		int count=0;
		count=sqlSession.insert(namespace+"insertReward", rdto);
		return count>0?true:false;
	}

}
