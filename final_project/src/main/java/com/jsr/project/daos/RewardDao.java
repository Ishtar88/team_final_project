package com.jsr.project.daos;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.ProductDto;
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

	@Override
	public List<RewardDto> rewardList() {
		return sqlSession.selectList(namespace+"rewardList");
	}

	@Override
	public List<RewardDto> findByRname(String r_name,String r_detail) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("r_name", r_name);
		map.put("r_detail", r_detail);
		return sqlSession.selectList(namespace+"findByRname", map);
	}

	@Override
	public List<RewardDto> findByBname(String b_name,String r_detail) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("b_name", b_name);
		map.put("r_detail", r_detail);
		return sqlSession.selectList(namespace+"findByBname", map);
	}

	@Override
	public RewardDto rewardOne(int r_seq) {
		Map<String, Integer>map=new HashMap<String,Integer>();
		map.put("r_seq", r_seq);
		return sqlSession.selectOne(namespace+"rewardOne", map);
	}

	@Override
	public BitMatrix makeQRMatix(String url, int width, int height) {
		QRCodeWriter qrCodeWriter=new QRCodeWriter();
		BitMatrix matrix=null;
		MatrixToImageConfig comfig=null;
		try {
			url=new String(url.getBytes("UTF-8"), "ISO-8859-1");
			try {
				matrix=qrCodeWriter.encode(url, BarcodeFormat.QR_CODE, width, height);
			} catch (WriterException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return matrix;
	}

	@Override
	public MatrixToImageConfig makeColorConfig(String qrColor, String backColor) {
		int intQrColor=0;
		int intBackColor=0;
		try {
			intQrColor=Integer.parseUnsignedInt(qrColor, 16);
		} catch (NumberFormatException e) {
			intQrColor=0xff000000;
		}
		
		try{
			intBackColor = Integer.parseUnsignedInt(backColor,16);	
		}catch(Exception e){
			intBackColor = 0xffffffff;
		}
		
		return new MatrixToImageConfig(intQrColor, intBackColor);
	}
	
	@Override
	public boolean buyReward(ProductDto prodto) {
		int count=0;
		count=sqlSession.insert(namespace+"buyReward", prodto);
		return count>0?true:false;
	}

	@Override
	public boolean minusPoint(PointDto podto) {
		int count=0;
		count=sqlSession.insert(namespace+"minusPoint", podto);
		return count>0?true:false;
	}

	@Override
	public List<ProductDto> getMyOrder(String id) {
		Map<String, String>map=new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectList(namespace+"getMyOrder", map);
	}

	@Override
	public ProductDto getQrReceipt(int pro_seq) {
		Map<String, Integer>map=new HashMap<String,Integer>();
		map.put("pro_seq", pro_seq);
		return sqlSession.selectOne(namespace+"qrReceipt", map);
	}

	@Override
	public List<CompanyDto> companyList() {
		return sqlSession.selectList(namespace+"companyList");
	}

	@Override
	public boolean useQR(ProductDto prodto) {
		int count=0;
		count=sqlSession.update(namespace+"useQR", prodto);
		return count>0?true:false;
	}

	@Override
	public List<RewardDto> listOfCategory(RewardDto rdto) {
		return sqlSession.selectList(namespace+"listOfCategory", rdto);
	}

}
