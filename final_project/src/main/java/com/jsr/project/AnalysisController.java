package com.jsr.project;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.AcountPatternDto;
import com.jsr.project.dtos.AnalysisDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.dtos.SaveDto;
import com.jsr.project.dtos.SpendingDto;
import com.jsr.project.services.IAcountService;
import com.jsr.project.services.IAnalysisService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AnalysisController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnalysisController.class);
	
	@Autowired
	private IAnalysisService analysisService;
	@Autowired
	private IAcountService acountService;
	
		//소비패턴-수진
		@RequestMapping(value = "/total_pattern_main.do", method = RequestMethod.GET)
		public String patternMain(HttpServletRequest request,HttpSession session,Model model,String year,String month,String lastDay,String sMonth,String eMonth) {
			int iMonth=Integer.parseInt(month);
			if (iMonth<10) {
				month="0"+iMonth;
			}
			String eDate=year+"-"+month+"-"+lastDay;
		
			MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
			String id=loginDto.getId();
			
			int total_spending=analysisService.total_spending(sMonth, eMonth, eDate, id);
			int invest_spending=analysisService.invest_spending(sMonth, eMonth, eDate, id);
			int expense_spending=analysisService.expense_spending(sMonth, eMonth, eDate, id);
			int total_goal=analysisService.total_goal(id);
			int total_expense=analysisService.total_expense(sMonth, eMonth, eDate, id);
			List<GoalDto> goalList=analysisService.category_goal(id);
			List<SpendingDto> spendList=analysisService.category_expense(sMonth, eMonth, eDate, id);
			List<SpendingDto> GSList=analysisService.goalVerseExpense(sMonth, eMonth, eDate, id);

			//토탈유형 구분
			float expenseRatio=(float)expense_spending/total_spending;
			
			AnalysisDto aDto1=null;
			if(expenseRatio<=0.2) {
				aDto1=analysisService.selectAnalysis(6);
			}else if(expenseRatio<=0.4) {
				aDto1=analysisService.selectAnalysis(7);
			}else if(expenseRatio<=0.6) {
				aDto1=analysisService.selectAnalysis(8);
			}else if(expenseRatio<=0.8) {
				aDto1=analysisService.selectAnalysis(9);
			}else {
				aDto1=analysisService.selectAnalysis(10);
			}
			System.out.println(aDto1);
			
			//목표유형
			float goalRatio=0;
			if(total_goal-total_expense>=0) {
				goalRatio=100;
			}else {
				goalRatio=(float)total_goal/total_expense;
			}
			
			AnalysisDto aDto2=null;
			if(goalRatio<=0.2) {
				aDto2=analysisService.selectAnalysis(1);
			}else if(goalRatio<=0.4) {
				aDto2=analysisService.selectAnalysis(2);
			}else if(goalRatio<=0.6) {
				aDto2=analysisService.selectAnalysis(3);
			}else if(goalRatio<=0.8) {
				aDto2=analysisService.selectAnalysis(4);
			}else {
				aDto2=analysisService.selectAnalysis(5);
			}
			System.out.println(aDto2);
			
			
			

			List<SpendingDto> spendMinusGoal=new ArrayList<SpendingDto>();

			for (int i = 0; i < spendList.size(); i++) {
				boolean isS=true;

				for (int j = 0; j < goalList.size(); j++) {
					if(spendList.get(i).getP_name().equals(goalList.get(j).getG_name())) {
						isS=false;
						break;
					}	
				}
				if(isS) {
					SpendingDto sdto=new SpendingDto();
					sdto.setP_name(spendList.get(i).getP_name());
					sdto.setP_money(spendList.get(i).getP_money());
					spendMinusGoal.add(sdto);
				}
			}

			List<GoalDto> goalMinusSpend=new ArrayList<GoalDto>();

			for (int i = 0; i < goalList.size(); i++) {
				boolean isS=true;

				for (int j = 0; j < spendList.size(); j++) {
					if(goalList.get(i).getG_name().equals(spendList.get(j).getP_name())) {
						isS=false;
						break;
					}	
				}
				if(isS) {
					GoalDto gdto=new GoalDto();
					gdto.setG_name(goalList.get(i).getG_name());
					gdto.setG_money(goalList.get(i).getG_money());
					goalMinusSpend.add(gdto);
				}
			}

			model.addAttribute("total_spending", total_spending);
			model.addAttribute("invest_spending", invest_spending);
			model.addAttribute("expense_spending", expense_spending);
			model.addAttribute("total_goal", total_goal);
			model.addAttribute("total_expense", total_expense);
			model.addAttribute("goalList", goalList);
			model.addAttribute("spendList", spendList);
			model.addAttribute("GSList", GSList);
			model.addAttribute("spendMinusGoal", spendMinusGoal);
			model.addAttribute("goalMinusSpend", goalMinusSpend);
			model.addAttribute("aDto1", aDto1);
			model.addAttribute("aDto2", aDto2);
			return "analysis/total_pattern_main";
		}

		@ResponseBody
		@RequestMapping(value = "/total_pattern_main_ajax.do", method = RequestMethod.POST)
		public Map<String, Object> total_pattern_main_ajax(HttpServletRequest request,HttpSession session,Model model,String year,String month) {
			
			int iMonth=Integer.parseInt(month);
			if (iMonth<10) {
				month="0"+iMonth;
			}
			String p_regdate=year+"-"+month;
			String sMonth="-2";
			String eMonth="-1";
			String eDate="2018-03-31";

			MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
			String id=loginDto.getId();

			List<SpendingDto> GSList=analysisService.goalVerseExpense(sMonth, eMonth, eDate, id);

			String a="-2";
			String b="-1";
			int total_spending=analysisService.total_spending(sMonth, eMonth, eDate, id);
			int total_goal=analysisService.total_goal(id);
			List<GoalDto> goalList=analysisService.category_goal(id);
			List<SpendingDto> spendList=analysisService.category_expense(sMonth, eMonth, eDate, id);
			
			List<SpendingDto> spendMinusGoal=new ArrayList<SpendingDto>();

			for (int i = 0; i < spendList.size(); i++) {
				boolean isS=true;

				for (int j = 0; j < goalList.size(); j++) {
					if(spendList.get(i).getP_name().equals(goalList.get(j).getG_name())) {
						isS=false;
						break;
					}	
				}
				if(isS) {
					SpendingDto sdto=new SpendingDto();
					sdto.setP_name(spendList.get(i).getP_name());
					sdto.setP_money(spendList.get(i).getP_money());
					spendMinusGoal.add(sdto);
				}
			}

			List<GoalDto> goalMinusSpend=new ArrayList<GoalDto>();

			for (int i = 0; i < goalList.size(); i++) {
				boolean isS=true;

				for (int j = 0; j < spendList.size(); j++) {
					if(goalList.get(i).getG_name().equals(spendList.get(j).getP_name())) {
						isS=false;
						break;
					}	
				}
				if(isS) {
					GoalDto gdto=new GoalDto();
					gdto.setG_name(goalList.get(i).getG_name());
					gdto.setG_money(goalList.get(i).getG_money());
					goalMinusSpend.add(gdto);
				}
			}
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("GSList", GSList);
			map.put("total_spending", total_spending);
			map.put("total_goal", total_goal);
			map.put("spendMinusGoal", spendMinusGoal);
			map.put("goalMinusSpend", goalMinusSpend);

			return map;
		}

	
	
	
	//지출패턴-병훈
		@RequestMapping(value = "/analysis_main.do", method = RequestMethod.GET)
		public String spending_main(Model model,HttpSession session) {
			logger.info("analysis main page");



			return "analysis/analysis_main";
		}


		@RequestMapping(value = "/acount_pattern_main.do", method = RequestMethod.GET)
		public String acount_pattern_main(Model model,String year,String month,HttpSession session) {
			logger.info("analysis main page");
			
			boolean isc=false;
			
			int iMonth=Integer.parseInt(month);
			if (iMonth<10) {
				month="0"+iMonth;
			}
			String regdate=year+"-"+month;
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
			Date date=null;
			try {
				date=df.parse(regdate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			logger.info("acount_pattern_main.do ==> 전달받은 year-month:"+regdate);
			
			MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
			AcountDto aDto=acountService.acountTotalSearch(lDto);
			//투자 금액 top5
			isc=acountMoneyTop5(model, session);
			//연간 투자 금액 top5
			isc=yearAcountMoneyTop5(model, regdate, session);
			//투자 수익률 TOP5
			isc=acountRateTop5(model, session);
			//연간 수익이 가장 많은 기간 조회
			isc=yearMoneyTop(model, regdate, session);
			//투자분류내역조회
			isc=acountTotalDetail(model, session);
			//가장높은 수익 상품 조회
			isc=yearProductTop(model, regdate, session);
			//당월 투자금액 조회
			isc=acountMonthMoney(model, regdate, session);
			//당월 투자 분류 내역 조회
			isc=currentAcountDetail(model,regdate, session);
			//가장 많이 투자하고 있는 상품 조회
			isc=acountMaxValueProduct(model, regdate, session);
			
			
			
			
			model.addAttribute("aDto", aDto);
			model.addAttribute("year", year);
			model.addAttribute("month", month);
			
			return "analysis/acount_pattern_main";
		}

		//투자비율 차트 기능
		@ResponseBody
		@RequestMapping(value = "/acountTotalRate.do", method = RequestMethod.GET)
		public Map<String, List<AcountPatternDto>> acountTotalRate(Model model,HttpSession session) {
			logger.info("analysis acountTotalRate start");

			Map<String, List<AcountPatternDto>> map=new HashMap<>();
			
			AcountPatternDto dto=inputPatternDto(session);
			
			logger.info("acountPatternDto: "+dto);
			
			List<AcountPatternDto> totalRate=analysisService.acountTotalRate(dto);
			map.put("totalRate", totalRate);
			
			logger.info("totalRate: "+totalRate);
			logger.info("analysis acountTotalRate end.");
			
			return map;
		}
		
		
		//기간별 수익 차트 기능
		@ResponseBody
		@RequestMapping(value = "/acountDateChartAjax.do", method = RequestMethod.GET)
		public Map<String, List<Object>> acountDateChartAjax(Model model,String year,String month,HttpSession session) {
			logger.info("analysis acountDateChartAjax start");

			String regdate=year+"-"+month;
			
			AcountPatternDto dto=inputPatternDto(regdate, session);
			
			Map<String, List<Object>> map=analysisService.acountDateChartAjax((AcountPatternDto) dto);
			
			logger.info("acountDateChart: "+map);
			logger.info("analysis acountDateChartAjax end.");
			
			return map;
		}
		
		
		
		
		//투자별 수익 현황
		@ResponseBody
		@RequestMapping(value = "/acountDetailChart.do", method = RequestMethod.GET)
		public Map<String, List<AcountPatternDto>> acountDetailChart(Model model,String year,String month,HttpSession session) {
			logger.info("analysis acountDetailChart start");

			Map<String, List<AcountPatternDto>> map=new HashMap<>();
			String regdate=year+"-"+month;
			
			AcountPatternDto dto=inputPatternDto(regdate, session);
			
			List<AcountPatternDto> list=analysisService.acountDetailChart(dto);
			map.put("list", list);
			
			logger.info("acountDetailChart: "+map);
			logger.info("analysis acountDetailChart end.");
			
			return map;
		}
		
		
		
		//투자 수익 차트 조회
		@ResponseBody
		@RequestMapping(value = "/acountMaxValueChart.do", method = RequestMethod.GET)
		public Map<String, List<AcountPatternDto>> acountMaxValueChart(Model model,HttpSession session) {
			logger.info("analysis acountMaxValueChart start");
			
			Map<String, List<AcountPatternDto>> map=new HashMap<>();
			
			AcountPatternDto dto=inputPatternDto(session);
			
			List<AcountPatternDto> acountMaxValue=analysisService.acountDetailChart(dto);
			map.put("acountMaxValue", acountMaxValue);
			
			logger.info("acountMaxValue: "+map);
			logger.info("analysis acountMaxValueChart end.");
			
			return map;
		}
		
		
		
		//당월 투자 비율 차트 조회
		@ResponseBody
		@RequestMapping(value = "/CurrentAcountTotalChart.do", method = RequestMethod.GET)
		public Map<String, List<AcountPatternDto>> CurrentAcountTotalChart(Model model,String year,String month,HttpSession session) {
			logger.info("analysis CurrentAcountTotal start");
			
			Map<String, List<AcountPatternDto>> map=new HashMap<>();
			
			String regdate=year+"-"+month;
			
			AcountPatternDto dto=inputPatternDto(regdate,session);
			
			List<AcountPatternDto> CurrentAcountTotal=analysisService.CurrentAcountTotalChart(dto);
			map.put("CurrentAcountTotal", CurrentAcountTotal);
			
			logger.info("CurrentAcountTotal: "+map);
			logger.info("analysis CurrentAcountTotal end.");
			
			return map;
		}
		
		//당월 투자금액 조회
		public boolean acountMonthMoney(Model model,String regdate,HttpSession session) {
			logger.info("analysis acountMonthMoney start");
			
			int count=0;
			
			
			AcountPatternDto dto=inputPatternDto(regdate,session);
			
			AcountDto acountMonthMoney=analysisService.acountMonthMoney(dto);
			
			model.addAttribute("acountMonthMoney", acountMonthMoney);
			
			logger.info("acountMonthMoney: "+acountMonthMoney);
			logger.info("analysis acountMonthMoney end.");
			
			return count>0?true:false;
		}
		
		//투자 분류 내역 조회
		public boolean acountTotalDetail(Model model,HttpSession session) {
			logger.info("analysis acountTotalDetailAjax start");
			
			int count=0;
			
			
			AcountPatternDto dto=inputPatternDto(session);
			
			List<AcountPatternDto> totalDetail=analysisService.acountTotalDetailAjax(dto);
			
			model.addAttribute("totalDetail", totalDetail);
			
			logger.info("totalDetail: "+totalDetail);
			logger.info("analysis acountTotalDetailAjax end.");
			
			return count>0?true:false;
		}
		
		//투자 금액 TOP5
		public boolean acountMoneyTop5(Model model,HttpSession session) {
			logger.info("analysis acountMoneyTop start");
			
			int count=0;
			
			
			AcountPatternDto dto=inputPatternDto(session);
			
			List<AcountPatternDto> acountMoneyTop=analysisService.acountMoneyTop(dto);
			model.addAttribute("acountMoneyTop", acountMoneyTop);
			
			logger.info("acountMoneyTop: "+acountMoneyTop);
			logger.info("analysis acountMoneyTop end.");
			
			return count>0?true:false;
		}
		
		//연간 투자 금액 TOP5
		public boolean yearAcountMoneyTop5(Model model,String regdate,HttpSession session) {
			logger.info("analysis yearAcountMoneyTop start");
			
			int count=0;
			
			
			AcountPatternDto dto=inputPatternDto(regdate, session);
			
			List<AcountPatternDto> yearAcountMoneyTop=analysisService.yearAcountMoneyTop(dto);
			model.addAttribute("yearAcountMoneyTop", yearAcountMoneyTop);
			
			logger.info("yearAcountMoneyTop: "+yearAcountMoneyTop);
			logger.info("analysis yearAcountMoneyTop end.");
			
			return count>0?true:false;
		}
		
		
		//1년중 수익이 가장 많은 기간 조회
		public boolean yearMoneyTop(Model model,String regdate,HttpSession session) {
			logger.info("analysis yearMoneyTop start");
			
			int count=0;
			
			AcountPatternDto dto=inputPatternDto(regdate, session);

			
			SaveDto yearMoneyTop=analysisService.yearMoneyTop(dto);
			model.addAttribute("yearMoneyTop", yearMoneyTop);
			
			logger.info("yearMoneyTop: "+yearMoneyTop);
			logger.info("analysis yearMoneyTop end.");
			
			return count>0?true:false;
		}
		
		//가장 높은 수익 상품 조회
		public boolean yearProductTop(Model model,String regdate,HttpSession session) {
			logger.info("analysis yearProductTop start");
			
			int count=0;
			
			AcountPatternDto dto=inputPatternDto(regdate, session);

			
			AcountPatternDto yearProductTop=analysisService.yearProductTop(dto);
			model.addAttribute("yearProductTop", yearProductTop);
			
			logger.info("yearProductTop: "+yearProductTop);
			logger.info("analysis yearProductTop end.");
			
			return count>0?true:false;
		}
		
		//투자 수익률 TOP5
		public boolean acountRateTop5(Model model,HttpSession session) {
			logger.info("analysis acountRateTop5 start");
			
			int count=0;
			
			AcountPatternDto dto=inputPatternDto(session);
			
			
			List<AcountPatternDto> acountRateTop5=analysisService.acountRateTop5(dto);
			model.addAttribute("acountRateTop5", acountRateTop5);
			
			logger.info("acountRateTop5: "+acountRateTop5);
			logger.info("analysis acountRateTop5 end.");
			
			return count>0?true:false;
		}
		
		//당월 투자 분류 내역 조회
		public boolean currentAcountDetail(Model model,String regdate,HttpSession session) {
			logger.info("analysis currentAcountDetail start");
			
			int count=0;
			
			AcountPatternDto dto=inputPatternDto(regdate,session);
			
			
			List<AcountPatternDto> currentAcountDetail=analysisService.currentAcountDetail(dto);
			model.addAttribute("currentAcountDetail", currentAcountDetail);
			
			logger.info("currentAcountDetail: "+currentAcountDetail);
			logger.info("analysis currentAcountDetail end.");
			
			return count>0?true:false;
		}
		
		//가장 많이 투자하고 있는 상품 조회
		public boolean acountMaxValueProduct(Model model,String regdate,HttpSession session) {
			logger.info("analysis acountMaxValueProduct start");
			
			int count=0;
			
			AcountPatternDto dto=inputPatternDto(session);
			
			
			AcountPatternDto acountMaxValueProduct=analysisService.acountMaxValueProduct(dto);
			model.addAttribute("acountMaxValueProduct", acountMaxValueProduct);
			
			logger.info("acountMaxValueProduct: "+acountMaxValueProduct);
			logger.info("analysis acountMaxValueProduct end.");
			
			return count>0?true:false;
		}

		
		//연간 내역 검색에 사용할 acountPatternDto생성
		AcountPatternDto inputPatternDto(String regdate,HttpSession session) {
			
			MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
			String id=lDto.getId();
			
			AcountPatternDto dto=new AcountPatternDto();
			dto.setId(id);
			dto.setName(regdate);
			
			logger.info("id: "+id+" / "+regdate);
			
			return dto;
		}
		
		//전체 검색에 사용할 acountPatternDto생성
		AcountPatternDto inputPatternDto(HttpSession session) {
			
			MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
			String id=lDto.getId();
			
			AcountPatternDto dto=new AcountPatternDto();
			dto.setId(id);
			
			logger.info("id: "+id);
			
			return dto;
		}
	
	//투자패턴-유라
	@RequestMapping(value="/an_consumption_main.do")
	public String an_consumption_main(Model model, HttpSession session) {
		logger.info("analysis main page");
		MembersDto ldto =(MembersDto)session.getAttribute("loginDto");
		model.addAttribute("ldto", ldto);
		String id= ldto.getId();
		//자기계발형 인간 
		int selfPattern =analysisService.selfPattern(id); 
		//생활중심형 인간
		int lifePattern =analysisService.lifePattern(id);
		//유흥중심형 인간
		int playingPattern = analysisService.playingPattern(id);
		//쇼핑중심형 인간
		int shoppingPattern=analysisService.shoppingPattern(id);
		//저번달보다 얼마나 덜썼는지?
		int compareLastMonth=analysisService.compareLastMonth(id); 
		//가장 지출을 많이 한 요일은? 
		int howMuchDay=analysisService.howMuchDay(id);
		//이번달에 가장 많이 지출한 분야는?  
		int mostCategory=analysisService.mostCategory(id);
		//계획 이행률  
		int goalSuccess=analysisService.goalSuccess(id);  //수진이가 한거에 있는뎅?! 
		//수입을 얼마만큼 투자에 지출했는지 비율
		int howMuchInvest=analysisService.howMuchInvest(id);
		//수입을 얼마만큼 저축에 지출했는지 비율 
		int howMuchSave=analysisService.howMuchSave(id);
		// 지출부분 중 필수 지출 비율  
		int essentialSpending=analysisService.essentialSpending(id);
		//비 필수 지출비율은 
		int optionalSpending=analysisService.optionalSpending(id);
		//평균 구매 신중도는 
		int carefulSpending=analysisService.carefulSpending(id); 
		//평균 소비 만족도는  
		int satisfySpending=analysisService.satisfySpending(id); 
		
		
		model.addAttribute("id", id);
		model.addAttribute("selfPattern", selfPattern); 
		model.addAttribute("lifePattern", lifePattern); 
		model.addAttribute("playingPattern", playingPattern); 
		model.addAttribute("shoppingPattern", shoppingPattern); 
		//
		model.addAttribute("compareLastMonth", compareLastMonth); 
		model.addAttribute("howMuchDay", howMuchDay); 
		model.addAttribute("mostCategory", mostCategory); 
		model.addAttribute("goalSuccess", goalSuccess); 
		model.addAttribute("howMuchInvest", howMuchInvest); 
		model.addAttribute("howMuchSave", howMuchSave); 
		model.addAttribute("essentialSpending", essentialSpending); 
		model.addAttribute("optionalSpending", optionalSpending); 
		model.addAttribute("carefulSpending", carefulSpending); 
		model.addAttribute("satisfySpending", satisfySpending); 
		
		
		return "analysis/an_consumption_main";
	}
	
	


}
