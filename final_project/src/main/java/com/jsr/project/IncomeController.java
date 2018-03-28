package com.jsr.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.jsr.project.services.I_IncomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IncomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(IncomeController.class);
	
	@Autowired
	private I_IncomeService incomeService;
	
	private String reVal="";
	
	
	@RequestMapping(value = "/income_main.do", method = RequestMethod.GET)
	public String income_main(Model model,String year,String month,HttpSession session) {
		logger.info("income main page");
		
		int lMonth=Integer.parseInt(month);
		if (lMonth<10) {
			month="0"+lMonth;
		}
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		String regdate=year+"-"+month;
		
		IncomeDto iDto=new IncomeDto();
		iDto.setId(id);
		iDto.setI_memo(regdate);
		
		List<IncomeDto> iList=incomeService.incomeAllSearch(iDto);
		model.addAttribute("iList", iList);

		List<IncomeDto> dtos=incomeService.incomeTopSearch(id);
		model.addAttribute("dtos", dtos);
		
		return "income/income_main";
	}

	@RequestMapping(value = "/income_insert_page.do", method = RequestMethod.GET)
	public String income_insert_page(Model model,String command,HttpSession session) {
		logger.info("income insert page");
		
		String searchDate=(String)session.getAttribute("searchDate");
		model.addAttribute("command", command);
		model.addAttribute("searchDate", searchDate);
		
		return "income/income_insert_page";
	}
	
	@RequestMapping(value = "/income_insert.do", method = RequestMethod.POST)
	public String income_insert(Model model,HttpSession session,IncomeDto dto) {
		logger.info("income insert start");
		
		MembersDto iDto=(MembersDto)session.getAttribute("loginDto");
		String id=iDto.getId();
		
		dto.setId(id);
		
		boolean isc=incomeService.incomeInsert(dto);
		model.addAttribute("isc", isc);
		if (isc) {
			logger.info("income insert success.");
			reVal="income/income_insert_page";
		}else {
			logger.info("income insert fail.");
			reVal="income/income_insert_page";
		}
		
		logger.info("income insert end.");
		
		return reVal;
	}
	
	@RequestMapping(value = "/income_update_page.do", method = RequestMethod.GET)
	public String income_update_page(Model model,HttpSession session,String seq) {
		logger.info("income update page");
		
		int i_seq=Integer.parseInt(seq);
		
		IncomeDto iDto=incomeService.incomeDetailSearch(i_seq);
		model.addAttribute("iDto", iDto);
		
		return "income/income_update_page";
	}
	
	
	@RequestMapping(value = "/income_update.do", method = RequestMethod.POST)
	public String income_update(Model model,HttpSession session,IncomeDto dto,String reg_date) {
		logger.info("income update start");
		
		MembersDto iDto=(MembersDto)session.getAttribute("loginDto");
		String id=iDto.getId();
		
		dto.setId(id);
		
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date=null;
		try {
			date=df.parse(reg_date);
			dto.setI_regdate(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean isc=incomeService.incomeInsert(dto);
		model.addAttribute("isc", isc);
		if (isc) {
			logger.info("income update success.");
			reVal="income/income_update_page";
		}else {
			logger.info("income update fail.");
			reVal="income/income_update_page";
		}
		
		logger.info("income update end.");
		
		return reVal;
	}
	
	@RequestMapping(value = "/income_delete.do", method = RequestMethod.GET)
	public String income_delete(Model model,String seq) {
		logger.info("income update start");
		
		int i_seq=Integer.parseInt(seq);
		
		boolean isc=incomeService.incomeDelete(i_seq);
		model.addAttribute("isc", isc);
		if (isc) {
			logger.info("income update success.");
			reVal="income/income_update_page";
		}else {
			logger.info("income update fail.");
			reVal="income/income_update_page";
		}
		
		logger.info("income update end.");
		
		return reVal;
	}
	
	@RequestMapping(value = "/income_detail.do", method = RequestMethod.GET)
	public String income_detail(Model model,String i_seq) {
		logger.info("income detail page");
		
		int seq=Integer.parseInt(i_seq);
		
		IncomeDto iDto=incomeService.incomeDetailSearch(seq);
		model.addAttribute("iDto", iDto);
		
		return "income/income_detail";
	}
	
	@RequestMapping(value = "/income_cancel.do", method = RequestMethod.GET)
	public String income_cancel(Model model,String i_seq) {
		logger.info("income cancel page");
		
		int seq=Integer.parseInt(i_seq);
		
		IncomeDto iDto=incomeService.incomeDetailSearch(seq);
		model.addAttribute("iDto", iDto);
		
		return "income/income_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/incomeChartAjax.do", method = RequestMethod.GET)
	public Map<String, List<IncomeDto>> incomeChartAjax(String year,String month,HttpSession session) {
		logger.info("income cancel page");
		
		logger.info("year: "+year+" / month: "+month);
		
		year=year.substring(0, year.lastIndexOf("년"));
		month=month.substring(0, month.lastIndexOf("월"));
		int lMonth=Integer.parseInt(month);
		if (lMonth<10) {
			month="0"+lMonth;
		}
		String searchDate=year+"-"+month;
		
		logger.info("searchDate: "+searchDate);
		
		Map<String, List<IncomeDto>> map =new HashMap<>();
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		IncomeDto dto=new IncomeDto();
		dto.setId(id);
		dto.setI_memo(searchDate);
		
		List<IncomeDto> iList=incomeService.incomeChartAjax(dto);
		map.put("iList", iList);
		
		logger.info("iList => "+iList);
		
		return map;
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
