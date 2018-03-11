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
import org.springframework.web.bind.annotation.RequestParam;

import com.jsr.project.dtos.*;
import com.jsr.project.services.IAcountService;
import com.jsr.project.services.I_IncomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IncomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(IncomeController.class);
	
	@Autowired
	private I_IncomeService incomeService;
	
	
	@RequestMapping(value = "/income_main.do", method = RequestMethod.GET)
	public String income_main(Model model,String year,String month) {
		logger.info("income main page");

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return "income/income_main";
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
