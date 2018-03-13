package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.RewardDto;

public interface IRewardService {
	
	public boolean insertReward(RewardDto rdto);
	public List<RewardDto> rewardList();
	public List<RewardDto> findByRname(String r_name);
	public List<RewardDto> findByBname(String b_name);
	public RewardDto rewardOne(int r_seq);
}
