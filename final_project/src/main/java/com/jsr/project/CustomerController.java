
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
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;



@Controller
public class CustomerController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	private INoticeService noticeService;
	

	///////////////
	//공지게시판 명령 
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//QnA게시판 명령 
	
	
	
	//고객센터 메인보기
	@RequestMapping(value = "/customer.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String home() {
		logger.info("customer board main page");
		return "customer/Customer_main";
	}
	
	//질문게시판 목록페이지 보기 
	@RequestMapping(value="/qnamain.do", method={RequestMethod.POST,RequestMethod.GET})
	public String qnalist(Locale locale, Model model) {
		logger.info("qna board main page"); 
			List<QnaBoardDto> lists=qnaService.q_getAlllist();
			model.addAttribute("lists", lists);
		return "customer/qnaboardmain"; 
	}
	
	//질문게시판 게시글 상세페이지 보기 
	@RequestMapping(value="/qnadetail.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String qnadetail() {
		logger.info("customer board detail page");
		
		return "customer/qnaboarddetail";
	}
	
	
	//질문게시판 게시글 새로 입력 
	@RequestMapping(value="/insertqna.do", method={RequestMethod.POST,RequestMethod.GET})
	public String insertqna(Model model,QnaBoardDto dto) {
		logger.info("customer board insert page");
		
		boolean isc=qnaService.q_insertBoard(dto); 
		if(isc) {
			//resolcver가 아니라 기존 요청ㅈ방식으로 qnaboardmain을 요청
			return "redirect:customer/qnaboardmain.do"; 
		}else {
			return "redirect:detailboard.do?seq="+dto.getQ_seq(); 
		}
	}
	
	//질문게시판 게시글 수정 
	@RequestMapping(value="/updateqna.do", method={RequestMethod.POST,RequestMethod.GET})
	public String updateqna() {
		logger.info("customer board update page");
		return "customer/qnaboardupdate";
	}
	
}
	
	//질문게시판 게시글 삭제 '
//	@RequestMapping(value="/")


	
	
	
