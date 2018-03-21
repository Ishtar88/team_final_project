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
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.RewardDto;
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
		int iMonth=Integer.parseInt(month);
		if (iMonth<10) {
			month="0"+iMonth;
		}
		String p_regdate=year+"-"+month;
		
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		String id=loginDto.getId();
		
		String a="-2";
		String b="-1";
		int total_spending=analysisService.total_spending(a,b,id);
		int invest_spending=analysisService.invest_spending(p_regdate, id);
		int expense_spending=analysisService.expense_spending(p_regdate, id);
		int invest_ratio=analysisService.invest_ratio(p_regdate, id);
		int expense_ratio=analysisService.expense_ratio(p_regdate, id);
		int total_goal=analysisService.total_goal(id);
		int total_expense=analysisService.total_expense(id, p_regdate);
		List<GoalDto> goalList=analysisService.category_goal(id);
		List<SpendingDto> spendList=analysisService.category_expense(id, p_regdate);
		List<SpendingDto> GSList=analysisService.goalVerseExpense(id, p_regdate);

		int goal_ratio=0;
		if(total_goal-total_expense>=0) {
			goal_ratio=100;
		}else {
			goal_ratio=(1-((total_goal-total_expense)/total_goal))*100;
		}
		

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
		model.addAttribute("invest_ratio", invest_ratio);
		model.addAttribute("expense_ratio", expense_ratio);
		model.addAttribute("total_goal", total_goal);
		model.addAttribute("total_expense", total_expense);
		model.addAttribute("goalList", goalList);
		model.addAttribute("spendList", spendList);
		model.addAttribute("goal_ratio", goal_ratio);
		model.addAttribute("GSList", GSList);
		model.addAttribute("spendMinusGoal", spendMinusGoal);
		model.addAttribute("goalMinusSpend", goalMinusSpend);
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

		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		String id=loginDto.getId();

		List<SpendingDto> GSList=analysisService.goalVerseExpense(id, p_regdate);

		String a="-2";
		String b="-1";
		int total_spending=analysisService.total_spending(a,b, id);
		int total_goal=analysisService.total_goal(id);
		List<GoalDto> goalList=analysisService.category_goal(id);
		List<SpendingDto> spendList=analysisService.category_expense(id, p_regdate);
		
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
		return "analysis/an_consumption_main";
	}




}
