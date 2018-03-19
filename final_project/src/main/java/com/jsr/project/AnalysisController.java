package com.jsr.project;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AnalysisController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnalysisController.class);
	
	
	
	
	@RequestMapping(value = "/analysis_main.do", method = RequestMethod.GET)
	public String spending_main(Model model,HttpSession session) {
		logger.info("analysis main page");
		
		
		
		return "analysis/analysis_main";
	}
	
	
	@RequestMapping(value = "/acount_pattern_main.do", method = RequestMethod.GET)
	public String acount_pattern_main(Model model,HttpSession session) {
		logger.info("analysis main page");
		
		
		
		return "analysis/acount_pattern_main";
	}
	
	
	
	
	


}
