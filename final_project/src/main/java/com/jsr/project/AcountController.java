package com.jsr.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsr.project.dtos.AcountDto;
import com.jsr.project.dtos.PointDto;
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
	@RequestMapping(value = "/acount.do", method = RequestMethod.GET)
	public String home() {
		logger.info("acount main page");
		
		return "acount/goal_main";
	}
	
	@RequestMapping(value = "/goal_insert_page.do", method = RequestMethod.GET)
	public String acount_insert_page() {
		logger.info("goal insert page");
		
		return "acount/goal_insert";
	}
	
	@RequestMapping(value = "/goal_insert.do", method = RequestMethod.POST)
	public String goal_insert(Locale locale, Model model,AcountDto dto) {
		logger.info("goal insert start", locale);
		
		dto.setId("ASD");
		
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
	
}
