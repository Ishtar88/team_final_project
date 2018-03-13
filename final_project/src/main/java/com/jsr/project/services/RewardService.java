package com.jsr.project.services;



import java.util.List;

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

	@Override
	public List<RewardDto> rewardList() {
		return IRewardDao.rewardList();
	}

	@Override
	public List<RewardDto> findByRname(String r_name) {
		return IRewardDao.findByRname(r_name);
	}

	@Override
	public List<RewardDto> findByBname(String b_name) {
		return IRewardDao.findByBname(b_name);
	}

	@Override
	public RewardDto rewardOne(int r_seq) {
		return IRewardDao.rewardOne(r_seq);
	}

}
