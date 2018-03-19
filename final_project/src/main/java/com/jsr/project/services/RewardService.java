package com.jsr.project.services;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jsr.project.daos.IRewardDao;
import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.ProductDto;
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
	public List<RewardDto> findByRname(String r_detail,String r_name,String sNum,String eNum) {
		return IRewardDao.findByRname(r_detail, r_name, sNum, eNum);
	}

	@Override
	public List<RewardDto> findByBname(String r_detail,String b_name,String sNum,String eNum) {
		return IRewardDao.findByBname(r_detail, b_name, sNum, eNum);
	}

	@Override
	public RewardDto rewardOne(int r_seq) {
		return IRewardDao.rewardOne(r_seq);
	}

	@Transactional
	@Override
	public boolean buyReward(ProductDto prodto, PointDto podto) {
		IRewardDao.buyReward(prodto);
		return IRewardDao.minusPoint(podto);
	}

	@Override
	public List<ProductDto> getMyOrder(String id) {
		return IRewardDao.getMyOrder(id);
	}

	@Override
	public ProductDto getQrReceipt(int pro_seq) {
		return IRewardDao.getQrReceipt(pro_seq);
	}

	@Override
	public List<CompanyDto> companyList() {
		return IRewardDao.companyList();
	}

	@Override
	public boolean useQR(ProductDto prodto) {
		return IRewardDao.useQR(prodto);
	}

	@Override
	public List<RewardDto> listOfCategory(String r_detail,String sNum,String eNum) {
		return IRewardDao.listOfCategory(r_detail, sNum, eNum);
	}

	@Override
	public int pageCount(String r_detail) {
		return IRewardDao.pageCount(r_detail);
	}


}
