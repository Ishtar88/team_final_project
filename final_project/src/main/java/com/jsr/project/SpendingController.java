package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsr.project.dtos.*;
import com.jsr.project.services.ISpendingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SpendingController {
	
	private static final Logger logger = LoggerFactory.getLogger(SpendingController.class);
	
	@Autowired
	private ISpendingService spendingService;
	
	
	
	@RequestMapping(value = "/spending_main.do", method = RequestMethod.GET)
	public String spending_main(Model model,String year,String month,HttpSession session) {
		logger.info("spending main page");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		int lMonth=Integer.parseInt(month);
		if (lMonth<10) {
			month="0"+lMonth;
		}
		
		String regdate=year+"-"+month;
		
		SpendingDto sDto=new SpendingDto();
		sDto.setId(id);
		sDto.setP_location(regdate);
		
		logger.info("파라미터로 입려하는 SpendingDto: "+sDto);

		//지출 총액 조회
		SpendingDto sumMoneyDto=spendingService.spendingSumMoney(sDto);
		model.addAttribute("sumMoneyDto", sumMoneyDto);
		
		logger.info("sumMoneyDto: "+sumMoneyDto);
		
		//지출건수top3
		List<SpendingDto> countDto=spendingService.spendingCountTop(sDto);
		model.addAttribute("countDto", countDto);
		
		logger.info("countDto: "+countDto);
		
		//지출top3
		List<SpendingDto> moneyDto=spendingService.spendingMoneyTop(sDto);
		model.addAttribute("moneyDto", moneyDto);
		
		logger.info("money: "+moneyDto);
		
		//지출내역 리스트 조회
		List<SpendingDto> sList=(List<SpendingDto>)spendingService.spendingAllSearch(sDto);
		model.addAttribute("sList", sList);
		
		logger.info("sList: "+sList);

		logger.info("spending main page end.");
		
		
		return "spending/spending_main";
	}
	
	@RequestMapping(value = "/spending_insert_page.do", method = RequestMethod.GET)
	public String spending_insert_page(Model model,String command,HttpSession session) {
		logger.info("spending insert page");

		String searchDate=(String)session.getAttribute("searchDate");
		model.addAttribute("command", command);
		model.addAttribute("searchDate", searchDate);
		
		return "spending/spending_insert_page";
	}
	
	@RequestMapping(value = "/spending_insert.do", method = RequestMethod.POST)
	public String spending_insert(Model model,SpendingDto dto,String buydate,HttpSession session) {
		logger.info("spending insert page");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		dto.setId(id);
		
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date p_regdate=null;
		try {
			p_regdate=df.parse(buydate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		dto.setP_regdate(p_regdate);
		
		logger.info("p_regdate: "+p_regdate);
		
		int p_sat=dto.getP_sat();
		
		System.out.println(p_sat);
		
		boolean isc=spendingService.spendingInsert(dto);
		if (isc) {
			model.addAttribute("isc", isc);
		}else {
			model.addAttribute("isc", isc);
		}
		
		return "spending/spending_insert_page";
	}

	@ResponseBody
	@RequestMapping(value = "/spendingDetailSearch.do", method = RequestMethod.GET)
	public Map<String, List<SpendingDto>> spendingDetailSearch(Model model,String pick,String year,String month,HttpSession session) {
		logger.info("spending detail search start");

		Map<String, List<SpendingDto>> map=new HashMap<>();
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		SpendingDto dto=new SpendingDto();
		
		System.out.println(year);
		
		String sYear=year.substring(0, year.indexOf("년"));
		String sMonth=month.substring(0, month.lastIndexOf("월"));
		
		String regdate=sYear+"-"+sMonth;
		System.out.println(regdate);
		
		dto.setId(id);
		dto.setP_location(regdate);
		System.out.println(dto);
		
		if (pick.equals("date")) {
			
			List<SpendingDto> lists=spendingService.spendingDateSearch(dto);
			map.put("lists", lists);
			
			System.out.println("map: "+map);
			
		}else if (pick.equals("category")) {
			
			List<SpendingDto> lists=spendingService.spendingCategorySearch(dto);
			map.put("lists", lists);
			System.out.println("map: "+map);
			
		}else if (pick.equals("some")) {
			
			List<SpendingDto> lists=spendingService.spendingCategorySearch(dto);
			map.put("lists", lists);
			
			System.out.println("map: "+map);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/spending_detail.do", method = RequestMethod.GET)
	public String spending_detail(Model model,String seq) {
		logger.info("spending insert page");
		
		int p_seq=Integer.parseInt(seq);
		
		SpendingDto sDto=spendingService.spendingDetailSearch(p_seq);
		model.addAttribute("sDto", sDto);
		
		System.out.println("sDto: "+sDto);
		
		
		return "spending/spending_detail";
	}

	@RequestMapping(value = "/spending_update_page.do", method = RequestMethod.GET)
	public String spending_update_page(Model model,String seq) {
		logger.info("spending update page");
		
		int p_seq=Integer.parseInt(seq);
		
		SpendingDto sDto=spendingService.spendingDetailSearch(p_seq);
		model.addAttribute("sDto", sDto);
		
		
		return "spending/spending_update_page";
	}
	
	@RequestMapping(value = "/spending_update.do", method = RequestMethod.POST)
	public String spending_update(Model model,SpendingDto dto,String seq) {
		logger.info("spending update page");
		
		int p_seq=Integer.parseInt(seq);
		
		dto.setP_seq(p_seq);
		
		
		boolean isc=spendingService.spendingUpdate(dto);
		if (isc) {
			model.addAttribute("isc", isc);
		}else {
			model.addAttribute("isc", isc);
		}
		
		
		return "spending/spending_update_page";
	}
	
	@RequestMapping(value = "/spending_cancel.do", method = RequestMethod.GET)
	public String spending_cancel(Model model,String seq) {
		logger.info("spending cancel");
		
		int p_seq=Integer.parseInt(seq);
		
		SpendingDto sDto=spendingService.spendingDetailSearch(p_seq);
		model.addAttribute("sDto", sDto);
		
		
		return "spending/spending_detail";
	}
	
	
	
	@RequestMapping(value = "/spending_delete.do", method = RequestMethod.GET)
	public String spending_delete(Model model,String seq) {
		logger.info("spending update page");
		
		int p_seq=Integer.parseInt(seq);
		
		boolean isc=spendingService.spendingDelete(p_seq);
		if (isc) {
			model.addAttribute("isc", isc);
		}else {
			model.addAttribute("isc", isc);
		}
		
		
		return "spending/spending_update_page";
	}


}
