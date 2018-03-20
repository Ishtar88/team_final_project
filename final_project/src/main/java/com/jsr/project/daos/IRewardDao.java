package com.jsr.project.daos;

import java.util.List;

import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.common.BitMatrix;
import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.ProductDto;
import com.jsr.project.dtos.RewardDto;

public interface IRewardDao {

	public boolean insertReward(RewardDto rdto);
	public List<RewardDto> rewardList();
	public List<RewardDto> findByRname(String r_name,String r_detail);
	public List<RewardDto> findByBname(String b_name,String r_detail);
	public RewardDto rewardOne(int r_seq);
	public BitMatrix makeQRMatix(String url,int width,int height);
	public MatrixToImageConfig makeColorConfig(String qrColor, String backColor);
	public boolean buyReward(ProductDto prodto);
	public boolean minusPoint(PointDto podto);
	public List<ProductDto> getMyOrder(String id);
	public ProductDto getQrReceipt(int pro_seq);
	public List<CompanyDto> companyList();
	public boolean useQR(ProductDto prodto);
	public List<RewardDto> listOfCategory(RewardDto rdto);

}
