
package com.jsr.project;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.services.CompanyService;
import com.jsr.project.services.ICompanyService;
import com.jsr.project.services.IManagerService;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;
import com.jsr.project.services.IRewardService;
import com.jsr.project.services.MembersService;


@Controller
public class ManagerController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private INoticeService noticeService;
	
	@Autowired
	private IManagerService managerService; 
	
	@Autowired
	private IRewardService rewardService; 
	
	@Autowired
	private ICompanyService companyService;
	
	
/////////////////////////////////////////회원메뉴///////////////////////////	
	
//	회원 열람 페이지로 이동하기 
	@RequestMapping(value="getAllMember.do", method= RequestMethod.GET)
	public String getAllMember(Model model) {
		List<MembersDto> list=managerService.getAllMember();
		model.addAttribute("list", list);
		return "manager/showMember";
	}
	
	@ResponseBody
	@RequestMapping(value="searchUser.do", method= RequestMethod.POST)
	public Map<String, List<MembersDto>> searchUser(Model model,MembersDto mdto,String category,String search) {
		
		List<MembersDto> list=null;
		
		if(category.equals("id")){
			list=managerService.searchById(search);
		}else if(category.equals("m_name")) {
			list=managerService.searchByName(search);
		}else if(category.equals("m_phone")) {
			list=managerService.searchByPhone(search);
		}
		
		System.out.println(list.size());
		System.out.println(list.get(0));
		Map<String, List<MembersDto>> map=new HashMap<String,List<MembersDto>>();
		map.put("list", list);
		
		return map;
	}
	


////////////////회사/상품 관리 ///////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="manager_commercial.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String manager_commercial() {
		logger.info("상품/회사 관리 페이지"); 
		return "manager/manager_commercial";
	}
	
	@RequestMapping(value="product.do", method=RequestMethod.GET)
	public String manager_product() {
		logger.info("상품 관리 페이지로 이동 "); 
		return "manager/manager_product";
	}
	
	@RequestMapping(value="company.do", method=RequestMethod.GET)
	public String manager_company(Model model) {
		logger.info("회사 관리 페이지로 이동"); 
		List<CompanyDto> lists = companyService.getAllCompany(); 
		model.addAttribute("lists", lists);
		return "manager/manager_company";
	}
	



}
