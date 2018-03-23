package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
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
	public String patternMain(HttpServletRequest request,HttpSession session,Model model,String year,String month) {
		String p_regdate="2018-02";
//		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
//		Date p_regdate=null;
//		try {
//			p_regdate=df.parse(regdate);
//			System.out.println("변환값"+p_regdate);
//			sdto.setP_regdate(p_regdate);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		String id=loginDto.getId();
		int total_spending=analysisService.total_spending(p_regdate, id);
		int invest_spending=analysisService.invest_spending(p_regdate, id);
		int expense_spending=analysisService.expense_spending(p_regdate, id);
		int invest_ratio=analysisService.invest_ratio(p_regdate, id);
		int expense_ratio=analysisService.expense_ratio(p_regdate, id);
		int total_goal=analysisService.total_goal(id);
		int total_expense=analysisService.total_expense(id, p_regdate);
		List<GoalDto> goalList=analysisService.category_goal(id);
		List<SpendingDto> spendList=analysisService.category_expense(id, p_regdate);
		
		int goal_ratio=0;
		if(total_goal-total_expense>=0) {
			goal_ratio=100;
		}else {
			goal_ratio=(1-((total_goal-total_expense)/total_goal))*100;
		}
		System.out.println("목표달성률"+goal_ratio);
		
		model.addAttribute("total_spending", total_spending);
		model.addAttribute("invest_spending", invest_spending);
		model.addAttribute("expense_spending", expense_spending);
		model.addAttribute("invest_ratio", invest_ratio);
		model.addAttribute("expense_ratio", expense_ratio);
		model.addAttribute("total_goal", total_goal);
		model.addAttribute("total_expense", total_expense);
		model.addAttribute("goalList", goalList);
		model.addAttribute("spendList", spendList);
		model.addAttribute("goal_ratio", goal_ratio);
		return "analysis/total_pattern_main";
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
		
		int iMonth=Integer.parseInt(month);
		if (iMonth<10) {
			month="0"+iMonth;
		}
		String sDate=year+"-"+month;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
		Date date=null;
		try {
			date=df.parse(sDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		AcountDto aDto=acountService.acountTotalSearch(lDto);
		model.addAttribute("aDto", aDto);
		return "analysis/acount_pattern_main";
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
