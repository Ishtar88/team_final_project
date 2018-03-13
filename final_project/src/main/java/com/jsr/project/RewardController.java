package com.jsr.project;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.qrcode.QRCodeWriter;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.services.IRewardService;
import com.jsr.project.util.QRUtil;

@Controller
public class RewardController {
	
	@Autowired
	private IRewardService rewardService;

	@RequestMapping(value = "/reward.do", method = RequestMethod.GET)
	public String reward() {
		return "reward/rewardMain";
		
	}
	@RequestMapping(value = "/insertReward.do", method = RequestMethod.GET)
	public String insertReward() {
		return "reward/insertReward";
		
	}
	@RequestMapping(value = "/addReward.do", method = RequestMethod.POST)
	public String addReward(HttpServletRequest request,RewardDto rdto) {
		String r_name=request.getParameter("r_name");
		rdto.setR_name(r_name);
		String b_seq=request.getParameter("b_seq");
		rdto.setB_seq(b_seq);
		int r_point=Integer.parseInt(request.getParameter("r_point"));
		rdto.setR_point(r_point);
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		MultipartFile multiFile=multi.getFile("uploadFile");
		String r_file=multiFile.getOriginalFilename();
		//String r_file=originName.substring(originName.indexOf("."));
		rdto.setR_file(r_file);
		
		File f=new File("C:/Users/Owner/git/team_final_project/final_project/src/main/webapp/resources/upload/"+r_file);
		try {
			multiFile.transferTo(f);
			boolean isS=rewardService.insertReward(rdto);
			if(isS) {
				System.out.println("등록성공");
				return "reward/insertReward";
			}else {
				System.out.println("등록실패");
				return "reward/insertReward";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	@RequestMapping(value = "/rewardList.do", method = RequestMethod.GET)
	public String rewardList(Model model) {
		List<RewardDto> rewardList=rewardService.rewardList();
		model.addAttribute("list", rewardList);
		return "reward/rewardMain";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/findReward.do", method = RequestMethod.POST)
	public Map<String, List<RewardDto>> findReward(HttpServletRequest request,HttpSession session,RewardDto rdto) {
		String category=request.getParameter("category");
		String search=request.getParameter("search");
		Map<String, List<RewardDto>> map=new HashMap<String, List<RewardDto>>();
		
		if(category.equals("r_name")){
			List<RewardDto> list1=rewardService.findByRname(search);
			map.put("list", list1);
		}else if(category.equals("b_name")) {
			List<RewardDto> list2=rewardService.findByBname(search);
			map.put("list", list2);
		}
		return map;
	}
	
	@RequestMapping(value = "/buyForm.do", method = RequestMethod.GET)
	public String buyForm(HttpServletRequest request,Model model) {
		int r_seq=Integer.parseInt(request.getParameter("r_seq"));
		System.out.println(r_seq);
		RewardDto rdto=rewardService.rewardOne(r_seq);
		System.out.println(rdto);
		model.addAttribute("rdto", rdto);
		return "reward/buyReward";
		
	}
	
	@RequestMapping(value = "/makeQR.do", method = RequestMethod.GET)
	public void makeQR() throws WriterException, IOException {
		String url="http://sgroom.tistory.com";
		int width=150;
		int height=150;
		
		String file_path="C:/Users/Owner/git/team_final_project/final_project/src/main/webapp/resources/qr/";
		
		Random rnd=new Random();
		
		StringBuffer temp=new StringBuffer();
		for (int i = 0; i < 20; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String file_name=temp.substring(0)+".png";
		
		QRUtil.makeQR(url, width, height, file_path, file_name);
		System.out.println("큐알생성");
	}
}
