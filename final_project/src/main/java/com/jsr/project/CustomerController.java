
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

import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;



@Controller
public class CustomerController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private INoticeService noticeService;
	

	///////////////
	//공지게시판 명령 
	
	@RequestMapping(value="notice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice_home(Model model) {
		logger.info("notice board main page");
		List<NoticeBoardDto> lists=noticeService.n_getAllList(); 
		System.out.println(lists.size());
		model.addAttribute("lists", lists);
		return "customer/noticeboardmain";
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//QnA게시판 명령 
	
	
	
	//고객센터 메인보기
	@RequestMapping(value = "/customer.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String customer_home(Locale locale, Model model) {
		logger.info("customer board main page");
		List<QnaBoardDto> q_lists=qnaService.q_getAlllist();
		List<NoticeBoardDto> n_lists=noticeService.n_getAllList(); 
		model.addAttribute("q_lists", q_lists);
		model.addAttribute("n_lists", n_lists);
		return "customer/Customer_main";
	}
	
	//질문게시판 목록페이지 보기 
	@RequestMapping(value="/qnamain.do", method={RequestMethod.POST,RequestMethod.GET})
	public String qnalist(Model model) {
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


	
	
	
