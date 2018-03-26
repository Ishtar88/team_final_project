package com.jsr.project;

import java.awt.Point;
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

import com.fasterxml.jackson.databind.node.POJONode;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.qrcode.QRCodeWriter;
import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.PointDto;
import com.jsr.project.dtos.ProductDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.services.IRewardService;
import com.jsr.project.util.QRUtil;

@Controller
public class RewardController {

	@Autowired
	private IRewardService rewardService;

	@RequestMapping(value = "/rewardMain.do", method = RequestMethod.GET)
	public String reward() {
		return "reward/mallMain";

	}
	@RequestMapping(value = "/insertReward.do", method = RequestMethod.GET)
	public String insertReward(Model model) {
		List<CompanyDto> list=rewardService.companyList();
		model.addAttribute("list", list);
		return "reward/insertReward";

	}
	@RequestMapping(value = "/addReward.do", method = RequestMethod.POST)
	public String addReward(HttpServletRequest request,RewardDto rdto) {

		String r_name=request.getParameter("r_name");
		rdto.setR_name(r_name);
		int b_seq=Integer.parseInt(request.getParameter("b_seq"));
		rdto.setB_seq(b_seq);
		String r_detail=request.getParameter("r_detail");
		rdto.setR_detail(r_detail);
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
				return "redirect:insertReward.do";
			}else {
				System.out.println("등록실패");
				return "redirect:insertReward.do";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "redirect:insertReward.do";
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:insertReward.do";
		}


	}

	@RequestMapping(value = "/rewardList.do", method = RequestMethod.GET)
	public String rewardList(Model model) {
		List<RewardDto> rewardList=rewardService.rewardList();
		List<CompanyDto> companyList=rewardService.companyList();
		
		model.addAttribute("list", rewardList);
		model.addAttribute("cList", companyList);
		return "reward/allList";

	}
	
	@RequestMapping(value = "/listOfCategory.do", method = RequestMethod.GET)
	public String listOfCategory(Model model,String r_detail,String sNum,String eNum,HttpSession session) {
		int pcount=rewardService.pageCount(r_detail);
		
		if(sNum==null) {
			sNum=(String)session.getAttribute("sNum");
			eNum=(String)session.getAttribute("eNum");
		}else {
			session.setAttribute("sNum", sNum);
			session.setAttribute("eNum", eNum);
		}
		List<RewardDto> rewardList=rewardService.listOfCategory(r_detail, sNum, eNum);
		model.addAttribute("pcount", pcount);
		model.addAttribute("list", rewardList);
		model.addAttribute("r_detail", r_detail);
		return "reward/categoryList";

	}

	@ResponseBody
	@RequestMapping(value = "/findReward.do", method = RequestMethod.POST)
	public Map<String, List<RewardDto>> findReward(HttpServletRequest request,String category,String search,String r_detail,String sNum,String eNum) {

		Map<String, List<RewardDto>> map=new HashMap<String, List<RewardDto>>();

		if(category.equals("r_name")){
			List<RewardDto> list1=rewardService.findByRname(r_detail, search, sNum, eNum);
			map.put("list", list1);
			//System.out.println(list1.size());
			//System.out.println(map.get("list"));
		}else if(category.equals("b_name")) {
			List<RewardDto> list2=rewardService.findByBname(r_detail, search, sNum, eNum);
			map.put("list", list2);
		}
		return map;
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

	@RequestMapping(value = "/rewardForm.do", method = RequestMethod.GET)
	public String rewardForm(HttpServletRequest request,Model model,HttpSession session) {
		int r_seq=Integer.parseInt(request.getParameter("r_seq"));
		RewardDto rdto=rewardService.rewardOne(r_seq);
		System.out.println(rdto);

		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");

		System.out.println(loginDto);
//		if(loginDto.getPo_point().getPo_point()==0) {
//			
//		}

		model.addAttribute("rdto", rdto);
		model.addAttribute("loginDto", loginDto);
		System.out.println(loginDto);
		return "reward/buyReward";

	}

	@RequestMapping(value = "/buyReward.do", method = RequestMethod.POST)
	public String buyReward(HttpServletRequest request,ProductDto prodto,PointDto podto,Model model) {
		System.out.println(prodto);
		System.out.println(podto);

		String point=request.getParameter("po_point");
		String po_point="-"+point;
		podto.setPo_point(Integer.parseInt(po_point));

		System.out.println(podto);
		boolean isS=rewardService.buyReward(prodto, podto);
		if(isS) {
			System.out.println("구매성공");
			model.addAttribute("isS", isS);
			return "reward/buyReward";
		}else {
			System.out.println("구매실패");
			model.addAttribute("isS", isS);
			return "reward/buyReward";
		}

	}

	@RequestMapping(value = "/myOrder.do", method = RequestMethod.GET)
	public String myOrder(HttpServletRequest request,Model model,HttpSession session) {
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		List<ProductDto> list=rewardService.getMyOrder(loginDto.getId());
		model.addAttribute("list", list);
		return "reward/myOrder"; 

	}
	
	@RequestMapping(value = "/showQR.do", method = RequestMethod.GET)
	public String showQR(HttpServletRequest request,Model model,HttpSession session) {
		int pro_seq=Integer.parseInt(request.getParameter("pro_seq"));
		ProductDto proDto=rewardService.getQrReceipt(pro_seq);
		model.addAttribute("proDto", proDto);
		return "reward/QR"; 

	}

	@RequestMapping(value = "/qrReceipt.do", method = RequestMethod.GET)
	public String qrReceipt(HttpServletRequest request,Model model,HttpSession session) {
		int pro_seq=Integer.parseInt(request.getParameter("pro_seq"));
		
		ProductDto proDto=rewardService.getQrReceipt(pro_seq);
		if(proDto.getPro_qruse().equals("Y")) {
			return "reward/qrReceipt2"; 
		}else {
			System.out.println(proDto);
			model.addAttribute("proDto",proDto);
			return "reward/qrReceipt"; 
		}
	}
	
	@RequestMapping(value = "/useQR.do", method = RequestMethod.POST)
	public String useQR(HttpServletRequest request,ProductDto prodto,Model model) {
		boolean isS=rewardService.useQR(prodto);
		if(isS) {
			model.addAttribute("isS", isS);
			return "reward/qrReceipt";
		}else {
			model.addAttribute("isS", isS);
			return "redirect:index.jsp";
		}
		
	}
	
	@RequestMapping(value = "/updateReward.do", method = RequestMethod.POST)
	public String updateReward(HttpServletRequest request) {
		RewardDto rdto=new RewardDto();
		int r_seq=Integer.parseInt(request.getParameter("r_seq"));
		rdto.setR_seq(r_seq);
		String r_detail=request.getParameter("r_detail");
		rdto.setR_detail(r_detail);
		String r_name=request.getParameter("r_name");
		rdto.setR_name(r_name);
		int r_point=Integer.parseInt(request.getParameter("r_point"));
		rdto.setR_point(r_point);
		int b_seq=Integer.parseInt(request.getParameter("b_seq"));
		rdto.setB_seq(b_seq);
		String r_sell=request.getParameter("r_sell");
		rdto.setR_sell(r_sell);

		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		MultipartFile multiFile=multi.getFile("r_file");
		String r_file="";
		if(multiFile==null){
			r_file=rdto.getR_file();
		}else {
			r_file=multiFile.getOriginalFilename();
			rdto.setR_file(r_file);			
		}

		File f=new File("C:/Users/Owner/git/team_final_project/final_project/src/main/webapp/resources/upload/"+r_file);
		try {
			multiFile.transferTo(f);
			boolean isS=rewardService.updateReward(rdto);
			if(isS) {
				System.out.println("수정성공");
				return "redirect:rewardList.do";
			}else {
				System.out.println("수정실패");
				return "redirect:rewardList.do";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "redirect:rewardList.do";
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:rewardList.do";
		}

	}

}
