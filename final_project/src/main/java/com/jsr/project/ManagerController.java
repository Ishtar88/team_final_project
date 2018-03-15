package com.jsr.project;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.services.IManagerService;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;
import com.jsr.project.services.MembersService;


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




	//	회원 열람 페이지로 이동하기 
	@RequestMapping(value="showMember.do", method= RequestMethod.GET)
	public String showMember(Model model) {
		logger.info("회원정보 열람으로이동합니다");
		List<MembersDto> lists=managerService.getAllMember();
		model.addAttribute("lists", lists);
		System.out.println(lists.size());
		return "manager/showMember";
	}

	//	회원 검색 결과 출력 페이지 
	//	@ResponseBody
	//	@RequestMapping(value="searchMember.do", method=RequestMethod.GET)
	//	public Map<String, MemberDto>searchMember(HttpServletRequest request, HttpSession session, MembersDto dto) {
	//		logger.info("회원 검색결과 페이지로 이동합니다.");
	//		MembersDto chkId = managerService.searchMember(dto); 
	//		
	//		
	//		return "manager/searchedMember"; 
	//	}
	//	

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

