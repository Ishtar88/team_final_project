package com.jsr.project;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.services.IQnaService;

@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
//	private INoticeService noticeService;
	

	//고객센터 메인보기
	@RequestMapping(value = "/customer.do", method = RequestMethod.GET)
	public String home() {
		logger.info("customer board main page");
		return "customer/Customer_main";
	}
	
	//질문게시판 목록페이지 보기 
	@RequestMapping(value="/qnamain.do", method=RequestMethod.GET)
	public String qnalist(Locale locale, Model model) {
		logger.info("qna board main page"); 
			List<QnaBoardDto> lists=qnaService.getAlllist();
			model.addAttribute("lists", lists);
			System.out.println(lists.size());
		return "customer/qnaboardmain"; 
	}
	
	//질문게시판 게시글 상세페이지 보기 
	@RequestMapping(value="/qnadetail.do", method=RequestMethod.GET)
	public String qnadetail() {
		logger.info("customer board detail page");
		
		return "customer/qnaboarddetail";
	}
	
	
	//질문게시판 게시글 새로 입력 
	@RequestMapping(value="/insertqna.do", method=RequestMethod.GET)
	public String insertqna() {
		logger.info("customer board insert page");
		return "customer/insertqna";
	}
	
	//질문게시판 게시글 수정 
	@RequestMapping(value="/updateqna.do", method=RequestMethod.GET)
	public String updateqna() {
		logger.info("customer board update page");
		return "customer/qnaboardupdate";
	}
	
	//질문게시판 게시글 삭제 '
//	@RequestMapping(value="/")
	
	
	

}
