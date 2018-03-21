package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.jsr.project.dtos.GoalDto;
import com.jsr.project.dtos.MembersDto;
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
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		AcountPatternDto dto=new AcountPatternDto();
		dto.setId(id);
		
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
	public Map<String, List<AcountPatternDto>> acountDateChartAjax(Model model,HttpSession session) {
		logger.info("analysis acountDateChartAjax start");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		AcountPatternDto dto=new AcountPatternDto();
		dto.setId(id);
		
		logger.info("acountPatternDto: "+dto);
		
		Map<String, List<AcountPatternDto>> map=analysisService.acountDateChartAjax(dto);
		
		logger.info("acountDateChart: "+map);
		logger.info("analysis acountDateChartAjax end.");
		
		return map;
	}
	
	//투자 분류 내역 조회
	public boolean acountTotalDetail(Model model,HttpSession session) {
		logger.info("analysis acountTotalDetailAjax start");
		
		int count=0;
		
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		AcountPatternDto dto=new AcountPatternDto();
		dto.setId(id);
		
		List<AcountPatternDto> totalDetailAjax=analysisService.acountTotalDetailAjax(dto);
		
		model.addAttribute("totalDetailAjax", totalDetailAjax);
		
		logger.info("totalDetailAjax: "+totalDetailAjax);
		logger.info("analysis acountTotalDetailAjax end.");
		
		return count>0?true:false;
	}
	
	//투자 금액 TOP5
	public boolean acountMoneyTop5(Model model,HttpSession session) {
		logger.info("analysis acountMoneyTop start");
		
		int count=0;
		
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		AcountPatternDto dto=new AcountPatternDto();
		dto.setId(id);
		
		List<AcountPatternDto> acountMoneyTop=analysisService.acountMoneyTop(dto);
		model.addAttribute("acountMoneyTop", acountMoneyTop);
		
		logger.info("acountMoneyTop: "+acountMoneyTop);
		logger.info("analysis acountMoneyTop end.");
		
		return count>0?true:false;
	}

	
	
	
	
	
	//투자패턴-유라
	@RequestMapping(value="/an_consumption_main.do")
	public String an_consumption_main(Model model, HttpSession session) {
		logger.info("analysis main page");
		return "analysis/an_consumption_main";
	}
	
	


}
