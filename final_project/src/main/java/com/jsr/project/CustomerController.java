package com.jsr.project;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.annotation.AnnotationsWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;
import com.jsr.project.services.NoticeService;

import com.jsr.project.util.Paging; 

@Controller
@SessionAttributes("id")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	@Autowired
	private INoticeService noticeService;
	
	
	//고객센터 메인보기
	@RequestMapping(value = "/customer.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String customer_home(Locale locale,String snum,String ennum, Model model,HttpSession session) {
		logger.info("customer board main page");
		
		
		if (snum==null) {
			snum=(String)session.getAttribute("snum");
			ennum=(String)session.getAttribute("ennnum");
		}else {
			session.setAttribute("snum", snum);
			session.setAttribute("ennum", ennum);
		}
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String grade=lDto.getM_grade();
		
		QnaBoardDto qDto=new QnaBoardDto();
		qDto.setSnum(snum);
		qDto.setEnnum(ennum);
		qDto.setQ_title(grade);
		
		List<QnaBoardDto> q_lists=qnaService.q_getAlllist(qDto);
		List<NoticeBoardDto> n_lists=noticeService.n_getAllList(qDto); 
		model.addAttribute("q_lists", q_lists);
		model.addAttribute("n_lists", n_lists);
		
		logger.info("q_lists(size):"+q_lists.size()+" / q_lists: "+q_lists);
		logger.info("n_lists(size):"+n_lists.size()+" / n_lists: "+n_lists);
		
		return "customer/Customer_main";
	}
	

	///////////////
	//공지게시판 명령 
	
	@RequestMapping(value="notice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice_home(Model model,String snum,String ennum,HttpSession session) {
		logger.info("notice board main page");
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId(); 
		System.out.println(id);
		
		if (snum==null) {
			snum=(String)session.getAttribute("snum");
			ennum=(String)session.getAttribute("ennnum");
		}else {
			session.setAttribute("snum", snum);
			session.setAttribute("ennum", ennum);
		}
		
		QnaBoardDto qDto=new QnaBoardDto();
		qDto.setSnum(snum);
		qDto.setEnnum(ennum);
		
		List<NoticeBoardDto> lists=noticeService.n_getAllList(qDto); 
		int count=qnaService.n_pageCount();
		model.addAttribute("lists", lists);
		model.addAttribute("count", count);
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
	public String qnalist(Model model, HttpSession session,String snum,String ennum, HttpServletRequest request) {
		logger.info("qna board main page"); 
//		
//		int currentPageNo = 1; 
//		int maxPost = 10;
//		
//		if(request.getParameter("pages")!=null) {
//			currentPageNo=Integer.parseInt(request.getParameter("pages"));
//		}
//		
//		Paging paging = new Paging(currentPageNo, maxPost); 
//		
//		int offset=(paging.getCurrentPageNo()-1)*paging.getMaxPost(); 
		
		if (snum==null) {
			snum=(String)session.getAttribute("snum");
			ennum=(String)session.getAttribute("ennnum");
		}else {
			session.setAttribute("snum", snum);
			session.setAttribute("ennum", ennum);
		}
		
		QnaBoardDto qDto=new QnaBoardDto();
		qDto.setSnum(snum);
		qDto.setEnnum(ennum);
				
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId(); 
		System.out.println(id);
		
			List<QnaBoardDto> lists=qnaService.q_getAlllist(qDto);
			int count=qnaService.q_pageCount();
			model.addAttribute("lists", lists);
			model.addAttribute("count", count);
			session.setAttribute("id", id);
		return "customer/qnaboardmain"; 
	}
	
	//질문게시판 게시글 상세페이지 보기 
	@RequestMapping(value="/qnadetail.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String qnadetail(Model model, int q_seq, String count, HttpSession session) {
		logger.info("customer board detail page");
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId(); 
		System.out.println(id);
		
		QnaBoardDto dto = qnaService.q_getBoard(q_seq,count); 
		model.addAttribute("dto", dto); 
		return "customer/qnaboarddetail";
	}
	
	//질문게시판 게시글 새로 입력하는 페이지 
	@RequestMapping(value="/insertform.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertqna(QnaBoardDto dto, Model model, HttpSession session){
		logger.info("질문게시판 입력폼 이동");
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId();
		dto.setId(id);
		model.addAttribute(dto);
		System.out.println(id);
		return "customer/insertqna";
	}
	
	//질문게시판 게시글 입력 완료 후 처리하는 페이지 
	@RequestMapping(value="/submitqna.do", method={RequestMethod.POST,RequestMethod.GET})
	public String submitqna(QnaBoardDto dto, HttpSession session) {
		logger.info("customer board insert page");
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId();
		dto.setId(id);
		boolean isc=qnaService.q_insertBoard(dto); 
		System.out.println(isc);
		if(isc) {
			//resolcver가 아니라 기존 요청ㅈ방식으로 qnaboardmain을 요청
			return "redirect:qnamain.do"; 
		}else {
			return "redirect:insertform.do"; 
		}
	}
	
	//질문게시판 게시글 수정폼 이동 
		@RequestMapping(value="/updateForm.do", method={RequestMethod.POST,RequestMethod.GET})
		public String updateForm(Model model, QnaBoardDto dto, String count, HttpSession session) {
			logger.info("customer board update form page");
			MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
			String id =IDto.getId();
			dto.setId(id);
			System.out.println(dto);
			dto=qnaService.q_getBoard(dto.getQ_seq(), count); 
			model.addAttribute("dto", dto);
			return "customer/qnaboardupdate"; 
		}
	
	//질문게시판 게시글 수정 
	@RequestMapping(value="/updateboard.do", method={RequestMethod.POST,RequestMethod.GET})
	public String updateboard(Model model, QnaBoardDto dto, HttpSession session) {
		logger.info("customer board update complete");
		MembersDto IDto =(MembersDto)session.getAttribute("loginDto");
		String id =IDto.getId();
		dto.setId(id);
		System.out.println(id);
		System.out.println(dto);
		boolean isc=qnaService.q_updateBoard(dto); 
		if (isc) {
			return "redirect:qnamain.do"; 
		}else
		return "redirect:qnamain.do";
	}
	
	//질문게시판 게시글 삭제 
	@RequestMapping(value="/deleteBoard.do",  method={RequestMethod.POST,RequestMethod.GET})
	public String deleteBoard(int q_seq,HttpSession session) {
		logger.info("customer board delete");
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc=qnaService.q_deleteBoard(q_seq);
		if (isc) {
			return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum;
		}else {
			return "redirect:qnadetail.do?q_seq="+q_seq+"&count=count"; 
		}
	}

	//qnaBoard검색 조회 기능
	@ResponseBody
	@RequestMapping(value="/qnaDetailAjax.do",  method={RequestMethod.POST,RequestMethod.GET})
	public Map<String, List<QnaBoardDto>> qnaDetailAjax(String category,String search,HttpSession session) {
		logger.info("qnaBoard qnaDetailAjax search start");
		
		MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
		String id=lDto.getId();
		
		Map<String, List<QnaBoardDto>> map=new HashMap<>();
		
		logger.info("입력하는 매개변수 id: "+"category: "+category+"search: "+search);
		
		QnaBoardDto dto=new QnaBoardDto();
		dto.setId(id);
		dto.setQ_title(category);
		dto.setQ_content(search);
		
		List<QnaBoardDto> list=qnaService.qnaDetailAjax(dto);
		logger.info("list: "+list);
		map.put("list", list);
		
		logger.info("qnaBoard qnaDetailAjax search end.");
		
		return map;
	}



}
	
	
	
