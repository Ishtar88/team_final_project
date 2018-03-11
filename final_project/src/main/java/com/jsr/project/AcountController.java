package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
	
	String reVal="";
	
	public String detail_factory(String acount,String seq,Model model) {
		logger.info("aocunt_detail factory start");
		
		int a_seq=Integer.parseInt(seq);
		
		if (acount.equals("save")) {
			
			SaveDto svDto=acountService.saveDetailSearch(a_seq);
			model.addAttribute("svDto", svDto);
			System.out.println("svDto: "+svDto);
			
			reVal="acount/save/save_detail";
			
		}else if (acount.equals("stock")) {

			StockDto sDto=acountService.stockDetailSearch(a_seq);
			model.addAttribute("sDto", sDto);
			System.out.println("sDto: "+sDto);
			
			reVal="acount/stock/stock_detail";
			
		}else if (acount.equals("fund")) {

			FundDto fDto=acountService.fundDetailSearch(a_seq);
			model.addAttribute("fDto", fDto);
			System.out.println("fDto: "+fDto);
			
			reVal="acount/fund/fund_detail";
			
		}else if (acount.equals("loan")) {

			LoanDto lDto=acountService.loanDetailSearch(a_seq);
			model.addAttribute("lDto", lDto);
			System.out.println("lDto: "+lDto);
			
			reVal="acount/loan/loan_detail";
			
		}
		
		logger.info("save detail end.");
		
		return reVal;
	}
	
	public String delete_factory(Model model,String seq,String acount) {
		logger.info("acount delete factory start");
		
		int a_seq=Integer.parseInt(seq);
		
		if (acount.equals("save")) {
			
			logger.info("save delete start");
				
			boolean isc=acountService.saveDelete(a_seq);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("save delete success");
			}else {
				model.addAttribute("isc", isc);
				logger.info("save delete fail");
			}
			
			reVal="acount/save/save_detail";
				
		}else if (acount.equals("stock")) {
			
			logger.info("stock delete start");
			
			boolean isc=acountService.stockDelete(a_seq);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("stock delete success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("stock delete fail.");
			}
			reVal="acount/stock/stock_detail";
			
		}else if (acount.equals("fund")) {
			
			logger.info("fund delete start");
			
			boolean isc=acountService.fundDelete(a_seq);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("fund delete success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("fund delete fail.");
			}
			reVal="acount/fund/fund_detail";
			
		}else if (acount.equals("loan")) {
			
			logger.info("loan delete start");
			
			boolean isc=acountService.loanDelete(a_seq);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("loan delete success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("loan delete fail.");
			}
			reVal="acount/loan/loan_detail";
			
		}
		
		return reVal;
	}
	
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

	@RequestMapping(value = "/acount_detail.do", method = RequestMethod.GET)
	public String acount_detail(Model model,String seq,String acount) {
		logger.info("save detail start");

		reVal=detail_factory(acount, seq, model);
		
		logger.info("save detail end");
		
		return reVal;
	}
	
	
	@RequestMapping(value = "/save_update_page.do", method = RequestMethod.GET)
	public String save_update_page(Model model,String seq) {
		logger.info("save update page");
		
		int s_seq=Integer.parseInt(seq);
		
		SaveDto svDto=acountService.saveDetailSearch(s_seq);
		
		model.addAttribute("svDto", svDto);
		
		return "acount/save/save_update_page";
	}

	@RequestMapping(value = "/acount_cancel.do", method = RequestMethod.GET)
	public String save_cancel(Model model,String seq,String acount) {
		logger.info("acount cancel start");
		
		reVal=detail_factory(acount, seq, model);
		
		logger.info("acount cancel end.");
		
		return reVal;
	}

	@RequestMapping(value = "/acount_delete.do", method = RequestMethod.GET)
	public String acount_delete(Model model,String seq,String acount,HttpServletResponse response) {
		logger.info("acount delete start");
		
		delete_factory(model, seq, acount);
		
		return reVal;
	}
	
	@RequestMapping(value = "/save_update.do", method = RequestMethod.POST)
	public String save_update(Model model,SaveDto dto) {
		logger.info("save update start");
		
/*			Date stDate=dto.getS_startdate();
			
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
			
			dto.setS_startdate(endDate);*/
			
		
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
	
	@RequestMapping(value = "/stock_update.do", method = RequestMethod.POST)
	public String stock_update(Model model,StockDto dto) {
		logger.info("save update start");
		
			Date stDate=dto.getSt_buydate();
			
			SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
			String st=df.format(stDate);
			java.sql.Date startDate = java.sql.Date.valueOf(st);
			System.out.println(startDate);
			
			dto.setSt_buydate(startDate);
			
			Date enDate=dto.getSt_selldate();
			SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
			String en=df2.format(enDate);
			java.sql.Date endDate = java.sql.Date.valueOf(en);
			
			System.out.println(endDate);
			
			dto.setSt_selldate(endDate);
			
		
		boolean isc=acountService.stockupdate(dto);
		if (isc) {
			System.out.println("save update end");
		}else {
			System.out.println("save update fail");
		}
		
		int s_seq=dto.getSt_seq();
		
		StockDto sDto=acountService.stockDetailSearch(s_seq);
		model.addAttribute("sDto", sDto);
		
		return "acount/stock/stock_detail";
	}
	
	
	@RequestMapping(value = "/fund_update.do", method = RequestMethod.POST)
	public String fund_update(Model model,FundDto dto) {
		logger.info("save update start");
		
			Date stDate=dto.getF_buydate();
			
			SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
			String st=df.format(stDate);
			java.sql.Date startDate = java.sql.Date.valueOf(st);
			System.out.println(startDate);
			
			dto.setF_buydate(startDate);
			
			Date enDate=dto.getF_enddate();
			SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
			String en=df2.format(enDate);
			java.sql.Date endDate = java.sql.Date.valueOf(en);
			
			System.out.println(endDate);
			
			dto.setF_enddate(endDate);
			
		
		boolean isc=acountService.fundUpdate(dto);
		if (isc) {
			System.out.println("save update end");
		}else {
			System.out.println("save update fail");
		}
		
		int s_seq=dto.getF_seq();
		
		FundDto fDto=acountService.fundDetailSearch(s_seq);
		model.addAttribute("fDto", fDto);
		
		
		return "acount/fund/fund_detail";
	}
	
	@RequestMapping(value = "/loan_update.do", method = RequestMethod.POST)
	public String loan_update(Model model,LoanDto dto) {
		logger.info("save update start");
		
			try {
				Date stDate=dto.getL_startdate();
				
				SimpleDateFormat inputDf=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
				SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
				String inputDate=inputDf.format(stDate);
				Date startDate=df.parse(inputDate);
				
				dto.setL_startdate(startDate);
				
				Date enDate=dto.getL_enddate();
				SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
				String en=df2.format(enDate);
				java.sql.Date endDate = java.sql.Date.valueOf(en);
				
				System.out.println(endDate);
				
				dto.setL_enddate(endDate);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		
		boolean isc=acountService.loanUpdate(dto);
		if (isc) {
			System.out.println("save update end");
		}else {
			System.out.println("save update fail");
		}
		
		int s_seq=dto.getL_seq();
		
		LoanDto lDto=acountService.loanDetailSearch(s_seq);
		model.addAttribute("lDto", lDto);
		
		
		return "acount/loan/loan_detail";
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
		
		System.out.println("input saveDto: "+dto);
		
		try {
			//시작날짜
			Date stDate=dto.getS_startdate();
			SimpleDateFormat inputDf=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
			SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-DD");
			String inputDate=inputDf.format(stDate);
			Date startDate=df.parse(inputDate);
					
			dto.setS_startdate(startDate);
			
			
			Date enInputDate=dto.getS_enddate();
			SimpleDateFormat inputDf2=new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
			SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
			String inputDate2=inputDf.format(enInputDate);
			Date enDate=df.parse(inputDate2);
			dto.setS_startdate(enDate);
			
		//만기날짜
/*		Date enInputDate=dto.getS_enddate();
		SimpleDateFormat df2=new SimpleDateFormat("YYYY-MM-DD");
		String enInput=df2.format(enInputDate);
		java.sql.Date enDate = java.sql.Date.valueOf(enInput);
		dto.setS_startdate(enDate);*/
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean isc=acountService.saveInsert(dto);
		if (isc) {
			System.out.println("save insert success.");
		}else {
			System.out.println("save insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/stock_insert.do", method = RequestMethod.POST)
	public String stock_insert(StockDto dto) {
		logger.info("stock insert start");
		
		boolean isc=acountService.stockInsert(dto);
		if (isc) {
			System.out.println("stock insert success.");
		}else {
			System.out.println("stock insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/fund_insert.do", method = RequestMethod.POST)
	public String fund_insert(FundDto dto) {
		logger.info("fund insert start");
		
		boolean isc=acountService.fundInsert(dto);
		if (isc) {
			System.out.println("fund insert success.");
		}else {
			System.out.println("fund insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/loan_insert.do", method = RequestMethod.POST)
	public String loan_insert(LoanDto dto) {
		logger.info("stock insert start");
		
		boolean isc=acountService.loanInsert(dto);
		if (isc) {
			System.out.println("loan insert success.");
		}else {
			System.out.println("loan insert fail.");
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
