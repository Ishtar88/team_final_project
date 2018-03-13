package com.jsr.project.daos;

import java.util.List;

import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.common.BitMatrix;
import com.jsr.project.dtos.RewardDto;

public interface IRewardDao {

	public boolean insertReward(RewardDto rdto);
	public List<RewardDto> rewardList();
	public List<RewardDto> findByRname(String r_name);
	public List<RewardDto> findByBname(String b_name);
	public RewardDto rewardOne(int r_seq);
	public BitMatrix makeQRMatix(String url,int width,int height);
	public MatrixToImageConfig makeColorConfig(String qrColor, String backColor);
}
