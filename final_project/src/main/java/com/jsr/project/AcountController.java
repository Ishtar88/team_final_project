package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping(value = "/stock_detail.do", method = RequestMethod.GET)
	public String stock_detail(Model model,String seq) {
		logger.info("stock detail start");

		System.out.println("seq: "+seq);
		
		int st_seq=Integer.parseInt(seq);
		
		StockDto sDto=acountService.stockDetailSearch(st_seq);
		model.addAttribute("sDto", sDto);
		
		System.out.println("sDto: "+sDto);
		
		logger.info("stock detail end");
		return "acount/stock/stock_detail";
	}
	
	@RequestMapping(value = "/fund_detail.do", method = RequestMethod.GET)
	public String fund_detail(Model model,String seq) {
		logger.info("fund detail start");

		System.out.println("seq: "+seq);
		
		int f_seq=Integer.parseInt(seq);
		
		FundDto fDto=acountService.fundDetailSearch(f_seq);
		model.addAttribute("fDto", fDto);
		
		System.out.println("fDto: "+fDto);
		
		logger.info("fund detail end");
		return "acount/fund/fund_detail";
	}
	
	@RequestMapping(value = "/loan_detail.do", method = RequestMethod.GET)
	public String loan_detail(Model model,String seq) {
		logger.info("loan detail start");

		System.out.println("seq: "+seq);
		
		int l_seq=Integer.parseInt(seq);
		
		LoanDto lDto=acountService.loanDetailSearch(l_seq);
		model.addAttribute("lDto", lDto);
		
		System.out.println("lDto: "+lDto);
		
		logger.info("loan detail end");
		return "acount/loan/loan_detail";
	}
	
	
	
	@RequestMapping(value = "/save_update_page.do", method = RequestMethod.GET)
	public String save_update_page(Model model,String seq) {
		logger.info("save update page");
		
		int s_seq=Integer.parseInt(seq);
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		
		//java.util.Date일때
/*		try {
			Date date=svDto.getS_startdate();
			SimpleDateFormat stDf=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
			String stDate=stDf.format(date);
			SimpleDateFormat stDf2=new SimpleDateFormat("YYYY-MM-DD");
			Date s_startdate= stDf2.parse(stDate);
			svDto.setS_startdate(s_startdate);
			System.out.println(s_startdate);
			
			Date date2=svDto.getS_enddate();
			SimpleDateFormat enDf=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
			String enDate=enDf.format(date2);
			SimpleDateFormat enDf2=new SimpleDateFormat("YYYY-MM-DD");
			Date s_enddate= enDf2.parse(enDate);
			svDto.setS_startdate(s_enddate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
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
	public String save_delete(Model model,String seq,HttpServletResponse response) {
		logger.info("save delete start");
		
		int s_seq=Integer.parseInt(seq);
		
		boolean isc=acountService.saveDelete(s_seq);
		if(isc) {
			model.addAttribute("isc", isc);
		}else {
			model.addAttribute("isc", isc);
		}
		
		return "acount/save/save_detail";
	}
	
	@RequestMapping(value = "/save_update.do", method = RequestMethod.POST)
	public String save_update(Model model,SaveDto dto) throws ParseException {
		logger.info("save update start");
		
			Date stDate=dto.getS_startdate();
			
			SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
			String st=df.format(stDate);
			java.sql.Date startDate = java.sql.Date.valueOf(st);
			System.out.println(startDate);
			
			dto.setS_startdate(startDate);
			
			Date enDate=dto.getS_startdate();
			SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
			String en=df2.format(enDate);
			java.sql.Date endDate = java.sql.Date.valueOf(en);
			
			System.out.println(endDate);
			
			dto.setS_startdate(endDate);
			
		
		boolean isc=acountService.saveUpdate(dto);
		if (isc) {
			System.out.println("save update end");
		}else {
			System.out.println("save update fail");
		}
		
		int s_seq=dto.getS_seq();
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		model.addAttribute("svDto", svDto);
		
		
		return "acount/save/save_detail";
	}
	
	@RequestMapping(value = "/acount_insert_page.do", method = RequestMethod.GET)
	public String save_insert_page(Model model,String seq,HttpSession session) {
		logger.info("save insert page");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		
		model.addAttribute("lDto", lDto);
		
		return "acount/acount_insert";
	}

	@RequestMapping(value = "/save_insert.do", method = RequestMethod.POST)
	public String save_insert(SaveDto dto) {
		logger.info("save insert start");
		
/*		//시작날짜
		Date stInputDate=dto.getS_startdate();
		SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		String stInput=df.format(stInputDate);
		java.sql.Date stDate = java.sql.Date.valueOf(stInput);
		dto.setS_startdate(stDate);
		
		//만기날짜
		Date enInputDate=dto.getS_enddate();
		SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		String enInput=df2.format(enInputDate);
		java.sql.Date enDate = java.sql.Date.valueOf(enInput);
		dto.setS_startdate(enDate);*/
		
		
		boolean isc=acountService.saveInsert(dto);
		if (isc) {
			System.out.println("save insert success.");
		}else {
			System.out.println("save insert fail.");
		}
		
		
		
		
		return "redirect:acount.do";
	}
	
	public static void jsClose(HttpServletResponse response){
		String str="<script type='text/javascript'>"
				 + "	self.close();"
				 + "</script> ";
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
