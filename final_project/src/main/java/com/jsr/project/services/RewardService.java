package com.jsr.project.services;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IRewardDao;
import com.jsr.project.dtos.RewardDto;

@Service
public class RewardService implements IRewardService {
	
	@Autowired
	private IRewardDao IRewardDao; 

	@Override
	public boolean insertReward(RewardDto rdto) {
		return IRewardDao.insertReward(rdto);
	}

}
