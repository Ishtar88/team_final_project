package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsr.project.dtos.*;
import com.jsr.project.services.IAcountService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AcountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AcountController.class);
	
	@Autowired
	private IAcountService acountService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//자산관리 메인페이지 이동
	@RequestMapping(value = "/acount.do", method = RequestMethod.GET)
	public String goal_main(Model model ,HttpSession session) {
		logger.info("acount main page");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		
		String id=lDto.getId();
		
		System.out.println(id);
		
		//자산 총합 조회
		AcountDto aDto=acountService.acountTotalSearch(lDto);
		session.setAttribute("aDto", aDto);
		
		System.out.println("AcountDto:"+aDto);
		
		//주식,펀드,저축 내역 조회
		//저축
		List<SaveDto> svList=(List<SaveDto>)acountService.saveAllSearch(id);
		model.addAttribute("svList", svList);
		
		//주식
		List<StockDto> sList=(List<StockDto>)acountService.stockAllSearch(id);
		model.addAttribute("sList", sList);
		
		//펀드
		List<FundDto> fList=(List<FundDto>)acountService.fundAllSearch(id);
		model.addAttribute("fList", fList);
		
		//대출
		List<LoanDto> lList=(List<LoanDto>)acountService.loanAllSearch(id);
		model.addAttribute("lList", lList);
		
		logger.info("acount main page end.");
		return "acount/acount_main";
	}
	
	//목표관리 페이지 이동
	@RequestMapping(value = "/goal_main.do", method = RequestMethod.GET)
	public String goal_main() {
		logger.info("goal main page");
		
		
		return "acount/goal_main";
	}
	
	//목표설정 페이지 이동
	@RequestMapping(value = "/goal_insert_page.do", method = RequestMethod.GET)
	public String acount_insert_page() {
		logger.info("goal insert page");
		
		return "acount/goal_insert";
	}

	//목표설정
	@RequestMapping(value = "/goal_insert.do", method = RequestMethod.POST)
	public String goal_insert(Locale locale, Model model,GoalDto dto,HttpSession session) {
		logger.info("goal insert start", locale);
		
		MembersDto mDto=(MembersDto)session.getAttribute("loginDto");
		
		dto.setId(mDto.getId());
		
		System.out.println("id:"+mDto.getId());
		
		System.out.println(dto);
		
		acountService.goalPointInsert(dto);
		boolean isc=acountService.goalInsert(dto);
		System.out.println("goalInsert action end");
		if (isc) {
			logger.info("acount insert end",locale);
			return "acount/goal_main";
		}else {
			logger.info("acount insert end",locale);
			return "acount/goal_insert";
		}
		
	}
	
	//목표수정 페이지 이동
	@RequestMapping(value = "/goal_update_page.do", method = RequestMethod.GET)
	public String acount_update_page() {
		logger.info("goal update page");
		
		return "acount/goal_update";
	}
	
	//목표수정
	@RequestMapping(value = "/goal_update.do", method = RequestMethod.GET)
	public String acount_update() {
		logger.info("goal update page");
		
		return "acount/goal_main";
	}

	@RequestMapping(value = "/save_detail.do", method = RequestMethod.GET)
	public String save_detail(Model model,String seq) {
		logger.info("save detail start");

		System.out.println("seq: "+seq);
		
		int s_seq=Integer.parseInt(seq);
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		model.addAttribute("svDto", svDto);
		
		System.out.println("svDto: "+svDto);
		
		logger.info("save detail end");
		return "acount/save/save_detail";
	}
	
	@RequestMapping(value = "/save_update_page.do", method = RequestMethod.GET)
	public String save_update_page(Model model,String seq) {
		logger.info("save update page");
		
		int s_seq=Integer.parseInt(seq);
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		model.addAttribute("svDto", svDto);
		
		return "acount/save/save_update_page";
	}

	@RequestMapping(value = "/save_cancel.do", method = RequestMethod.GET)
	public String save_cancel(Model model,String seq) {
		logger.info("save cancel");
		
		int s_seq=Integer.parseInt(seq);
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		model.addAttribute("svDto", svDto);
		
		return "acount/save/save_detail";
	}

	@RequestMapping(value = "/save_delete.do", method = RequestMethod.GET)
	public String save_delete(String seq) {
		logger.info("save delete start");
		
		int s_seq=Integer.parseInt(seq);
		
		boolean isc=acountService.saveDelete(s_seq);
		if (isc) {
			
		}else {
			jsForward("self.close();");
		}
		
		return "acount/save/save_detail";
	}
	
	@RequestMapping(value = "/save_update.do", method = RequestMethod.POST)
	public String save_update(Model model,SaveDto dto) {
		logger.info("save update start");
		
		try {
			String stDate=dto.getS_startdate().toString();
			SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
			String st=df.format(stDate);
			Date startDate=df.parse(st);
			dto.setS_startdate((java.sql.Date) startDate);
			
			String enDate=dto.getS_startdate().toString();
			SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
			String en=df2.format(enDate);
			Date endDate=df2.parse(en);
			dto.setS_enddate((java.sql.Date) endDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean isc=acountService.saveUpdate(dto);
		if (isc) {
			System.out.println("save update end");
		}else {
			System.out.println("save update fail");
		}
		
		
		return "acount/save/save_detail";
	}
	
	
	public String jsForward(String msg){
		String str="<script type='text/javascript'> "
						+msg+
				"   </script> ";
		
	return str;
	}
	
	
}
