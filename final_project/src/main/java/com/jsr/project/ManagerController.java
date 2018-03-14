package com.jsr.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.services.IManagerService;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;


@Controller
public class ManagerController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private INoticeService noticeService;
	
	@Autowired
	private IManagerService managerService; 
	
	
	@RequestMapping(value="showMember.do", method= RequestMethod.GET)
	public String manager_home() {
		logger.info("회원정보 열람으로이동합니다");
		List<MembersDto> lists=managerService.getAllMember();
		return "manager/showMember";
	}
	
	
//고객센터 관리////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
//매니저 게시판 보기    
@RequestMapping(value="manager_notice.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_notice(Model model) {
logger.info("notice board main page");
List<NoticeBoardDto> lists=noticeService.n_getAllList(); 
model.addAttribute("lists", lists);
return "manager/manager_noticeboard";
}

//qna 게시판 보기 
@RequestMapping(value="manager_qna.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_qna(Model model) {
logger.info("qna board main page");
List<QnaBoardDto> lists=qnaService.q_getAlllist(); 
model.addAttribute("lists", lists);
return "manager/manager_qnaboard";
}

//공지게시판 새로운 게시글 입력 폼으로 이동 
@RequestMapping(value="insertnoticeform.do", method= {RequestMethod.POST,RequestMethod.GET})
public String insertnoticeform() {
	logger.info("notice board insert page");
	return "manager_noticeinsertform"; 
}

//공지게시판 새로운 게시글 등록 
@RequestMapping(value="insertnotice.do", method= {RequestMethod.GET})
public String insertnotice(NoticeBoardDto dto) {
	logger.info("notice board insert page");
	boolean isS=noticeService.n_insertBoard(dto); 
	if (isS) {
		return "redirect:manager_notice.do"; 
	}else {
		return "redirect:insertnoticeform.do"; 
	}
}

//공지게시판 글 상세내역 읽기 
@RequestMapping (value="manager_notice_detail.do", method={RequestMethod.POST, RequestMethod.GET})
public String notice_detail(Model model, String n_seq,String count){
	logger.info("notice board detail page"); 
	
	int seq=Integer.parseInt(n_seq);
	
	NoticeBoardDto dto = noticeService.n_detailBoard(seq,count);
	model.addAttribute("dto", dto);
	
	return "manager/noticeboard_detail"; 
}


}

