package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SavedRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jsr.project.dtos.*;
import com.jsr.project.services.IAcountService;
import com.jsr.project.services.IRewardService;

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
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		
		if (acount.equals("save")) {
			
			SaveDto svDto=acountService.saveDetailSearch(a_seq);
			Date stDate=svDto.getS_startdate();
			Date enDate=svDto.getS_enddate();
			String st_date=df.format(stDate);
			String en_date=df.format(enDate);
			Date s_startdate=null;
			Date s_enddate=null;
			try {
				s_startdate=df.parse(st_date);
				s_enddate=df.parse(en_date);
				svDto.setS_startdate(s_startdate);
				svDto.setS_enddate(s_enddate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			System.out.println("dto에 담겨져있었던 stDate: "+stDate);
			System.out.println("format으로 변환한 st_date: "+st_date);
			System.out.println("parse로 Date타입으로 변환한 s_startdate: "+s_startdate);
			
			model.addAttribute("svDto", svDto);
			System.out.println("svDto: "+svDto);
			
			reVal="acount/save/save_detail";
			
		}else if (acount.equals("stock")) {

			StockDto sDto=acountService.stockDetailSearch(a_seq);
			Date stDate=sDto.getSt_buydate();
			String st_date=df.format(stDate);
			Date st_buydate=null;
			try {
				st_buydate=df.parse(st_date);
				sDto.setSt_buydate(st_buydate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			model.addAttribute("sDto", sDto);
			System.out.println("sDto: "+sDto);
			
			reVal="acount/stock/stock_detail";
			
		}else if (acount.equals("fund")) {

			FundDto fDto=acountService.fundDetailSearch(a_seq);
			Date stDate=fDto.getF_buydate();
			Date enDate=fDto.getF_enddate();
			String st_date=df.format(stDate);
			String en_date=df.format(enDate);
			Date s_startdate=null;
			Date f_enddate=null;
			try {
				s_startdate=df.parse(st_date);
				f_enddate=df.parse(en_date);
				fDto.setF_buydate(s_startdate);
				fDto.setF_enddate(f_enddate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			model.addAttribute("fDto", fDto);
			System.out.println("fDto: "+fDto);
			
			reVal="acount/fund/fund_detail";
			
		}else if (acount.equals("loan")) {

			LoanDto lDto=acountService.loanDetailSearch(a_seq);
			Date stDate=lDto.getL_startdate();
			Date enDate=lDto.getL_enddate();
			String st_date=df.format(stDate);
			String en_date=df.format(enDate);
			Date l_startdate=null;
			Date l_enddate=null;
			try {
				l_startdate=df.parse(st_date);
				l_enddate=df.parse(en_date);
				lDto.setL_startdate(l_startdate);
				lDto.setL_enddate(l_enddate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
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
		
		logger.info("매개변수로 입력받은 seq: "+a_seq);
		
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
	
	
	//자산 만기등록 기능 factory
	public String endable_factory(Model model,String seq,@RequestParam(name = "enddate")@DateTimeFormat(pattern = "yyyy-MM") Date enddate,String acount) {
		logger.info("acount endable factory start");
		
		int a_seq=Integer.parseInt(seq);
		
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
		String date=df.format(enddate);
		
		logger.info("매개변수로 입력받은 seq: "+a_seq);
		
		if (acount.equals("save")) {
			logger.info("save endable start");

			SaveDto dto=new SaveDto();
			dto.setS_seq(a_seq);
			dto.setS_enddate(enddate);
			
			logger.info("saveDto: "+dto);
				
			boolean isc=acountService.saveEnd(dto);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("save endable success");
			}else {
				model.addAttribute("isc", isc);
				logger.info("save endable fail");
			}
			
			reVal="acount/save/save_detail";
				
		}else if (acount.equals("stock")) {
			logger.info("stock endable start");
			
			StockDto dto=new StockDto();
			dto.setSt_seq(a_seq);
			dto.setSt_selldate(enddate);
			
			boolean isc=acountService.stockEnd(dto);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("stock endable success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("stock endable fail.");
			}
			reVal="acount/stock/stock_detail";
			
		}else if (acount.equals("fund")) {
			logger.info("fund endable start");

			FundDto dto=new FundDto();
			dto.setF_seq(a_seq);
			dto.setF_enddate(enddate);
			
			boolean isc=acountService.fundEnd(dto);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("fund endable success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("fund endable fail.");
			}
			reVal="acount/fund/fund_detail";
			
		}else if (acount.equals("loan")) {
			logger.info("loan endable start");
			
			LoanDto dto=new LoanDto();
			dto.setL_seq(a_seq);
			dto.setL_enddate(enddate);
			
			boolean isc=acountService.loanEnd(dto);
			if(isc) {
				model.addAttribute("isc", isc);
				logger.info("loan endable success.");
			}else {
				model.addAttribute("isc", isc);
				logger.info("loan endable fail.");
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
	public String acount_main(Model model ,HttpSession session) {
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
	public String goal_main(HttpSession session,Model model) {
		logger.info("goal main page");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		GoalDto totalmoneyDto=acountService.goalTotalMoney(id);
		List<GoalDto> goalAllSearchList=acountService.goalAllSearch(id);
		model.addAttribute("totalMoneyDto", totalmoneyDto);
		model.addAttribute("goalAllSearchList", goalAllSearchList);
		
		logger.info("totalMoneyDto: "+totalmoneyDto);
		logger.info("goalAllSearchList: "+goalAllSearchList);
		
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
		
		String id=mDto.getId();
		
		dto.setId(id);
		
		System.out.println("id:"+mDto.getId());
		
		System.out.println(dto);
		
		acountService.goalPointInsert(id);
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
	
	
	@RequestMapping(value = "/acount_update_page.do", method = RequestMethod.GET)
	public String save_update_page(Model model,String seq,String acount) {
		logger.info("acount update page");
		
		if (acount.equals("save")) {
			
			detail_factory(acount, seq, model);
			reVal="acount/save/save_update_page";
		}else if (acount.equals("stock")) {
			
			detail_factory(acount, seq, model);
			reVal="acount/stock/stock_update_page";
			
		}else if (acount.equals("fund")) {
			
			detail_factory(acount, seq, model);
			reVal="acount/fund/fund_update_page";
			
		}else if (acount.equals("loan")) {
			
			detail_factory(acount, seq, model);
			reVal="acount/loan/loan_update_page";
			
		}

		
		return reVal;
	}
	
	@RequestMapping(value = "/goal_cancel.do", method = RequestMethod.GET)
	public String goal_cancel(Model model,String seq,String acount) {
		logger.info("goal cancel start");
		
		
		return "redirect:goal_main.do";
	}

	@RequestMapping(value = "/acount_cancel.do", method = RequestMethod.GET)
	public String acount_cancel(Model model,String seq,String acount) {
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
	
	
	@RequestMapping(value = "/acount_end.do", method = RequestMethod.POST)
	public String acount_endable(Model model,String seq,@RequestParam(name = "enddate")@DateTimeFormat(pattern = "yyyy-MM") Date enddate,String acount) {
		logger.info("acount endable start");
		

		
		reVal=endable_factory(model, seq, enddate, acount);
		
		logger.info("acount endable end.");
		
		return reVal;
	}
	
	@RequestMapping(value = "/save_update.do", method = RequestMethod.POST)
	public String save_update(Model model,SaveDto dto,String st_date,String en_date) {
		logger.info("save update start");
		
		Date stDate=null;
		Date enDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			stDate=df.parse(st_date);
			
			dto.setS_startdate(stDate);

			enDate=df.parse(en_date);
			
			dto.setS_enddate(enDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			
		
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
	public String stock_update(Model model,StockDto dto,String buy_date) {
		logger.info("save update start");
		
		Date buyDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			buyDate=df.parse(buy_date);
			
			dto.setSt_buydate(buyDate);

		} catch (ParseException e) {
			e.printStackTrace();
		}
			
		
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
	public String fund_update(Model model,FundDto dto,String buy_date,String en_date) {
		logger.info("save update start");
		
		Date buyDate=null;
		Date enDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			buyDate=df.parse(buy_date);
			
			dto.setF_buydate(buyDate);

			enDate=df.parse(en_date);
			
			dto.setF_enddate(enDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			
		
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
	public String loan_update(Model model,LoanDto dto,String st_date,String en_date) {
		logger.info("save update start");
		
		Date stDate=null;
		Date enDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			stDate=df.parse(st_date);
			
			dto.setL_startdate(stDate);

			enDate=df.parse(en_date);
			
			dto.setL_enddate(enDate);
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
	public String save_insert(SaveDto dto,String st_date,String en_date) {
		logger.info("save insert start");

		Date stDate=null;
		Date enDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			stDate=df.parse(st_date);
			
			dto.setS_startdate(stDate);

			enDate=df.parse(en_date);
			
			dto.setS_enddate(enDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("input saveDto: "+dto);
		
		boolean isc=acountService.saveInsert(dto);
		if (isc) {
			System.out.println("save insert success.");
		}else {
			System.out.println("save insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/stock_insert.do", method = RequestMethod.POST)
	public String stock_insert(StockDto dto,String buydate) {
		logger.info("stock insert start");
		
		Date st_buydate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			st_buydate=df.parse(buydate);
			
			dto.setSt_buydate(st_buydate);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		logger.info("stockDto: "+dto);
		
		boolean isc=acountService.stockInsert(dto);
		if (isc) {
			System.out.println("stock insert success.");
		}else {
			System.out.println("stock insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/fund_insert.do", method = RequestMethod.POST)
	public String fund_insert(FundDto dto,String buydate,String enddate) {
		logger.info("fund insert start");
		
		Date f_buydate=null;
		Date f_enddate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			f_buydate=df.parse(buydate);
			
			dto.setF_buydate(f_buydate);

			f_enddate=df.parse(enddate);
			
			dto.setF_enddate(f_enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("input fundDto: "+dto);
		
		boolean isc=acountService.fundInsert(dto);
		if (isc) {
			System.out.println("fund insert success.");
		}else {
			System.out.println("fund insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/loan_insert.do", method = RequestMethod.POST)
	public String loan_insert(LoanDto dto,String st_date,String en_date) {
		logger.info("stock insert start");
		
		Date stDate=null;
		Date enDate=null;
		try {
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			stDate=df.parse(st_date);
			
			dto.setL_startdate(stDate);

			enDate=df.parse(en_date);
			
			dto.setL_enddate(enDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("input loanDto: "+dto);
		
		
		boolean isc=acountService.loanInsert(dto);
		if (isc) {
			System.out.println("loan insert success.");
		}else {
			System.out.println("loan insert fail.");
		}
		
		return "redirect:acount.do";
	}
	
	@RequestMapping(value = "/calendar_main.do", method = RequestMethod.GET)
	public String calendar_main(Model model,String year,String month,HttpSession session) {
		logger.info("calendar main page");
		
		int lMonth=Integer.parseInt(month);
		if (lMonth<10) {
			month="0"+lMonth;
		}
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		String regdate=year+"-"+month;
		
		System.out.println("searchDate: "+regdate);
				
		SpendingDto dto1=new SpendingDto();
		dto1.setId(id);
		dto1.setP_location(regdate);
		
		List<SpendingDto> pList = acountService.calendarSpendingSearch(dto1);
		logger.info("지출내역: "+pList);
		
		
		IncomeDto dto2=new IncomeDto();
		dto2.setId(id);
		dto2.setI_memo(regdate);
		
		List<IncomeDto> iList = acountService.calendarIncomeSearch(dto2);
		logger.info("수입내역: "+iList);
		
		model.addAttribute("pList", pList);
		model.addAttribute("iList", iList);
		
		
		return "calendar/calendar_main";
	}
	
	@RequestMapping(value = "/calendar_detail.do", method = RequestMethod.GET)
	public String calendar_detail(Model model,String searchDate,HttpSession session) {
		logger.info("calendar detail start");
		
		session.setAttribute("searchDate", searchDate);
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		IncomeDto iDto=new IncomeDto();
		iDto.setId(id);
		iDto.setI_memo(searchDate);
		
		System.out.println(searchDate);
		logger.info("수입목록(iDto): "+iDto);
		
		List<IncomeDto> iList=acountService.calendarIncomeDetailSearch(iDto);
		model.addAttribute("iList", iList);
		logger.info("수입목록(iList): "+iList);
		
		SpendingDto pDto=new SpendingDto();
		pDto.setId(id);
		pDto.setP_location(searchDate);
		model.addAttribute("pDto", pDto);
		
		List<SpendingDto> pList= acountService.calendarSpendingDetailSearch(pDto);
		model.addAttribute("pList", pList);
		
		logger.info("지출목록(pList): "+pList);
		
		logger.info("calendar detail end.");
		
		return "calendar/calendar_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/acountChartAjax.do", method = RequestMethod.GET)
	public Map<String, Object> acountChartAjax(String command,HttpSession session) {
		logger.info("calendar detail start");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		SaveDto svMoney=acountService.saveTotalMoney(id);
		StockDto sMoney=acountService.stockTotalMoney(id);
		FundDto fMoney=acountService.fundTotalMoney(id);
		LoanDto lMoney=acountService.loanTotalMoney(id);
		
		Map<String, Object> map=new HashMap<>();
		map.put("svMoney", svMoney);
		map.put("sMoney", sMoney);
		map.put("fMoney", fMoney);
		map.put("lMoney", lMoney);
		
		logger.info("svMoney: =>"+svMoney);
		logger.info("sMoney: =>"+sMoney);
		logger.info("fMoney: =>"+fMoney);
		logger.info("lMoney: =>"+lMoney);
		
		
		logger.info("calendar detail end.");
		
		return map;
	}
	
	private IRewardService rewardService;
	
	//뽑기상품등록
	@RequestMapping(value = "/dobak_insert.do", method = RequestMethod.POST)
	public String dobak_insert(Model model,RewardDto rdto,String command,HttpServletRequest request) {
		logger.info("product insert start");
		
		if (command.equals("dobak")) {
			
			int r_number=(int)(Math.random()*3+1);
			rdto.setR_number(r_number);
			
			logger.info("뽑기 숫자생성 pNum: "+r_number);
			
			
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
			
		logger.info("product insert end.");
		return command;
		
	}
	
	//뽑기를 뽑았을때 번호조회 기능
	@ResponseBody
	@RequestMapping(value = "/dobak_check.do", method = RequestMethod.POST)
	public String dobak_check(Model model,PointDto poDto,ProductDto proDto,HttpSession session) {
		logger.info("product check start");
		
		String reVal="";
		
		int point=poDto.getPo_point();
		
		String beforePoint="-"+point;
		int po_point=Integer.parseInt(beforePoint);
		poDto.setPo_point(po_point);
		
		int r_number=(int)(Math.random()*3+1);
		
		RewardDto rdto=new RewardDto();
		rdto.setR_number(r_number);
		
		RewardDto dto=acountService.dobakCheck(rdto);
		if (dto!=null) {
			logger.info("상품 뽑기 성공");
			
			boolean isc=acountService.buyDobakSuccess(poDto, proDto);
			if (isc) {
				reVal="";
			}else {
				reVal="";
			}
			
		}else {
			logger.info("상품 뽑기 실패");
			
			boolean isc=acountService.buyDobakFail(poDto);
			if (isc) {
				reVal="";
			}else {
				reVal="";
			}
			
		}
			
		logger.info("product check end.");
		
		return reVal;
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
