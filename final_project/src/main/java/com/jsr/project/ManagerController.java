
package com.jsr.project;

import java.util.HashMap;
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

import com.jsr.project.dtos.CompanyDto;
import com.jsr.project.dtos.MembersDto;
import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.dtos.RewardDto;
import com.jsr.project.services.CompanyService;
import com.jsr.project.services.ICompanyService;
import com.jsr.project.services.IManagerService;
import com.jsr.project.services.INoticeService;
import com.jsr.project.services.IQnaService;
import com.jsr.project.services.IRewardService;
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
	
	@Autowired
	private IRewardService rewardService; 
	
	@Autowired
	private ICompanyService companyService;
	
	
/////////////////////////////////////////회원메뉴///////////////////////////	
	
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
	@ResponseBody
	@RequestMapping(value="searchMember.do", method=RequestMethod.GET)
	public Map<String, List<MembersDto>> searchMember(HttpServletRequest request,MembersDto dto) {
		logger.info("회원 검색결과 페이지로 이동합니다.");
		String id = request.getParameter("id");
		Map<String, List<MembersDto>>  map=new HashMap<String, List<MembersDto>>();
		List<MembersDto> list=managerService.getSearchedMember(id);
		map.put("list", list);
		return map;  //페이지로 이동해야지!!! 
	}
	
	@RequestMapping(value="modifyMember.do", method=RequestMethod.GET)
	public String modifyMember(Model model, String id) {
		logger.info("하아아아아아.....");
		MembersDto dto = managerService.modifyMember(id); 
		model.addAttribute(dto); 
		return "manager/modifyMember"; 
	}
	
	@RequestMapping(value="afterModifyMember.do", method=RequestMethod.POST)
	public String modifyMember(MembersDto dto) {
		logger.info("하아아아아아.....");
		boolean isc=managerService.afterModifyMember(dto); 
		if (isc) {
			return "redirect:manager/showMember.do";
		}else {
			return "redirect:manager/modifyMember.do";
		}
	}
	
	@RequestMapping(value="deleteMember.do", method=RequestMethod.GET)
	public String deleteMember(Model model, String id) {
		logger.info("회원삭제 확인페이지로 이동하기.....");
		MembersDto dto = managerService.deleteMember(id); 
		model.addAttribute(dto); 
		return "manager/deleteMember"; 
	}
	
	@RequestMapping(value="confirmDelete.do", method=RequestMethod.GET)
	public String confirmDelete(String id) {
		logger.info("회원삭제 확인페이지로 이동하기.....");
		boolean isS = managerService.confirmDelete(id); 
		if (isS) {
			return "redirect:showMember.do"; 
		} else {
			return "redirect:deleteMember.do"; 
		}
	}

////////////////회사/상품 관리 ///////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="manager_commercial.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String manager_commercial() {
		logger.info("상품/회사 관리 페이지"); 
		return "manager/manager_commercial";
	}
	
	@RequestMapping(value="product.do", method=RequestMethod.GET)
	public String manager_product() {
		logger.info("상품 관리 페이지로 이동 "); 
		return "manager/manager_product";
	}
	
	@RequestMapping(value="company.do", method=RequestMethod.GET)
	public String manager_company(Model model) {
		logger.info("회사 관리 페이지로 이동"); 
		List<CompanyDto> lists = companyService.getAllCompany(); 
		model.addAttribute("lists", lists);
		return "manager/manager_company";
	}
	

	
	
	
	
//고객센터 관리////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//게시판 메뉴 선택 페이지     
	@RequestMapping(value="manager_customer.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manager_customer() {
	logger.info("게시판 메뉴 선택");
	return "manager/manager_customer";
	}
	
	
	
//공지 게시판 목록 보기    
@RequestMapping(value="manager_notice.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_notice(Model model) {
logger.info("notice board main page");
List<NoticeBoardDto> lists=noticeService.n_getAllList(); 
model.addAttribute("lists", lists);
return "manager/manager_noticeboard";
}

//공지게시판 글 상세내역 읽기 
@RequestMapping (value="manager_notice_detail.do", method={RequestMethod.POST, RequestMethod.GET})
public String manager_notice_detail(Model model, int n_seq,String count){
	logger.info("notice board detail page"); 
	NoticeBoardDto dto = noticeService.n_detailBoard(n_seq,count);
	model.addAttribute("dto", dto);
	
	return "manager/manager_noticeboard_detail"; 
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





//qna 게시판 보기 
@RequestMapping(value="manager_qna.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_qna(Model model) {
logger.info("qna board main page");
List<QnaBoardDto> lists=qnaService.q_getAlllist(); 
model.addAttribute("lists", lists);
return "manager/manager_qnaboard";
}


//qna 게시판 상세보기 
@RequestMapping(value="manager_qnadetail.do")
public String manager_qnadetail(Model model, int q_seq) {
	logger.info("manager qnaboard detail page"); 
	QnaBoardDto dto = qnaService.q_getAllBoard(q_seq);
	model.addAttribute("dto", dto);
	return "manager/manager_qna_detail"; 
}

//qna 게시판 새 글 추가폼 
@RequestMapping(value="manager_insertqna.do")
public String manager_insertqna() {
	logger.info("manager qnaboard insert page");
	return "manager/manager_insertqna"; 
}

//qna 게시판 글 추가 처리
@RequestMapping(value="notice_submitqna.do")
public String notice_submitqna(QnaBoardDto dto) {
	String id = "ASD";
	dto.setId(id);
	boolean isc=qnaService.q_insertBoard(dto); 
	if(isc) {
		return "redirect:manager_qna.do"; 
	}else {
		return "redirect:manager_insertqna.do"; 
	}
	
	
}
	
	//질문게시판 게시글 수정폼 이동 
	@RequestMapping(value="/notice_updateForm.do", method={RequestMethod.POST,RequestMethod.GET})
	public String notice_updateForm(Model model, QnaBoardDto dto, String count, HttpSession session) {
		dto=qnaService.q_getBoard(dto.getQ_seq(), count); 
		model.addAttribute("dto", dto);
		return "manager/notice_qnaboardupdate"; 
	}

	//질문게시판 게시글 수정 
	@RequestMapping(value="/manager_updateboard.do", method={RequestMethod.POST,RequestMethod.GET})
	public String updateboard(Model model, QnaBoardDto dto) {
		logger.info("customer board update complete");
		boolean isc=qnaService.q_updateBoard(dto); 
		if (isc) {
			return "redirect:manager_qna.do"; 
		}else
		return "redirect:manager_qna.do";
	}



}
