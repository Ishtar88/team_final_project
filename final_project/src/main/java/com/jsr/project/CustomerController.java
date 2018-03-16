package com.jsr.project;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.javassist.bytecode.annotation.AnnotationsWriter;
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
import com.jsr.project.services.NoticeService;

@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	@Autowired
	private INoticeService noticeService;
	
	
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
	

	///////////////
	//공지게시판 명령 
	
	@RequestMapping(value="notice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice_home(Model model) {
		logger.info("notice board main page");
		List<NoticeBoardDto> lists=noticeService.n_getAllList(); 
		model.addAttribute("lists", lists);
		return "customer/noticeboardmain";
	}
	@RequestMapping (value="notice_detail.do", method={RequestMethod.POST, RequestMethod.GET})
	public String notice_detail(Model model, String n_seq, String count){
		logger.info("notice board detail page"); 
		
		int seq=Integer.parseInt(n_seq);
		
		NoticeBoardDto dto = noticeService.n_detailBoard(seq,count);
		model.addAttribute("dto", dto);
		
		return "customer/noticeboard_detail"; 
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//QnA게시판 명령 
	
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
	public String qnadetail(Model model, int q_seq, String count) {
		logger.info("customer board detail page");
		QnaBoardDto dto = qnaService.q_getBoard(q_seq, count); 
		model.addAttribute("dto", dto); 
		return "customer/qnaboarddetail";
	}
	
	//질문게시판 게시글 새로 입력하는 페이지 
	@RequestMapping(value="/insertform.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String insertqna(){
		logger.info("customer board detail page");
		
		return "customer/insertqna";
	}
	
	//질문게시판 게시글 입력 완료 후 처리하는 페이지 
	@RequestMapping(value="/submitqna.do", method={RequestMethod.POST,RequestMethod.GET})
	public String submitqna(Model model,QnaBoardDto dto) {
		logger.info("customer board insert page");
		
		boolean isc=qnaService.q_insertBoard(dto); 
		System.out.println(isc);
		if(isc) {
			//resolcver가 아니라 기존 요청ㅈ방식으로 qnaboardmain을 요청
			return "redirect:customer/qnamain.do"; 
		}else {
			return "redirect:submitqna.do"; 
		}
	}
	
	//질문게시판 게시글 수정폼 이동 
		@RequestMapping(value="/updateform.do", method={RequestMethod.POST,RequestMethod.GET})
		public String updateform(Model model, int q_seq, String count) {
			logger.info("customer board update form page");
			QnaBoardDto dto = qnaService.q_getBoard(q_seq, count); 
			model.addAttribute("dto", dto);
			return "qnaUpdateForm"; 
		}
	
	//질문게시판 게시글 수정 
	@RequestMapping(value="/updateqna.do", method={RequestMethod.POST,RequestMethod.GET})
	public String updateqna(QnaBoardDto dto) {
		logger.info("customer board update complete");
		boolean isc=qnaService.q_updateBoard(dto); 
		if (isc) {
			return "redirect:qnadetail.do?seq="+dto.getQ_seq(); 
		}else
		return "redirect:updateform.do?seq="+dto.getQ_seq();
	}
	
	//질문게시판 게시글 삭제 
	@RequestMapping(value="/deleteBoard.do",  method={RequestMethod.POST,RequestMethod.GET})
	public String deleteBoard(QnaBoardDto dto) {
		logger.info("customer board delete");
		boolean isc=qnaService.q_deleteBoard(dto);
		if (isc) {
			return "redirect:qnamain.do";
		}else {
			return "redirect:qnadetail.do?seq="+dto.getQ_seq(); 
		}
	}

//
//	//질문게시판 답글달기 
	@RequestMapping(value="/replyboard.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String replyboard(Locale locale, QnaBoardDto dto) {
		logger.info("reply");;
		boolean isS=qnaService.q_replyBoard(dto);
		if (isS) {
			return "redirect:qnamain.do";
		} else {
			logger.info("답글추가 실패", locale);
			return "qnadetail.do?seq="+dto.getQ_seq(); 
		}
	}
//			




}
	
	
	
