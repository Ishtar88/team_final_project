package com.jsr.project;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.services.IRewardService;

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
}
