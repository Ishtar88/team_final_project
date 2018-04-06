
package com.jsr.project;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
	@RequestMapping(value="getAllMember.do", method= RequestMethod.GET)
	public String getAllMember(Model model) {
		List<MembersDto> list=managerService.getAllMember();
		model.addAttribute("list", list);
		return "manager/showMember";
	}
	
	@ResponseBody
	@RequestMapping(value="searchUser.do", method= RequestMethod.POST)
	public Map<String, List<MembersDto>> searchUser(Model model,MembersDto mdto,String category,String search) {
		
		List<MembersDto> list=null;
		
		if(category.equals("id")){
			list=managerService.searchById(search);
		}else if(category.equals("m_name")) {
			list=managerService.searchByName(search);
		}else if(category.equals("m_phone")) {
			list=managerService.searchByPhone(search);
		}
		
		System.out.println(list.size());

		Map<String, List<MembersDto>> map=new HashMap<String,List<MembersDto>>();
		map.put("list", list);
		
		return map;
	}
	

	@RequestMapping(value="deleteMember.do", method= RequestMethod.GET)
	public String deleteMember(MembersDto mdto) {
		boolean isS=managerService.deleteMember(mdto);
		if(isS) {
			System.out.println("탈퇴성공");
			return "redirect:getAllMember.do";
		}else {
			System.out.println("탈퇴실패");
			return "redirect:getAllMember.do";
		}
		
	}

////////////////회사/상품 관리 ///////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="company.do", method=RequestMethod.GET)
	public String manager_company(Model model) {
		logger.info("기업 조회 페이지로 이동"); 
		List<CompanyDto> lists = companyService.getAllCompany(); 
		model.addAttribute("lists", lists);
		return "manager/showCompany";
	}
	
	@RequestMapping(value="modifyCompany.do", method=RequestMethod.GET)
	public String modifyCompany(Model model) {
		logger.info("기업 수정 페이지로 이동"); 
		List<CompanyDto> lists = companyService.getAllCompany(); 
		model.addAttribute("lists", lists);
		return "manager/modifyCompany";
	}
	
	@RequestMapping(value="updateCompany.do", method=RequestMethod.GET)
	public String updateCompany(Model model,CompanyDto cdto) {
		
		if(cdto.getB_address().equals("")) {
			cdto.setB_address(null);
		}
		if(cdto.getB_tel().equals("")) {
			cdto.setB_tel(null);
		}
		
		boolean isS=companyService.updateCompany(cdto);
		if(isS) {
			System.out.println("수정성공");
			model.addAttribute("isS", isS);
			return "redirect:modifyCompany.do";
		}else {
			System.out.println("수정실패");
			model.addAttribute("isS", isS);
			return "redirect:modifyCompany.do";
		}
		
	}
	
	@RequestMapping(value="insertCompanyGo.do", method=RequestMethod.GET)
	public String insertCompanyGo(Model model) {
		logger.info("기업 등록 페이지로 이동"); 
		return "manager/insertCompany";
	}
	
	@RequestMapping(value="insertCompany.do", method=RequestMethod.POST)
	public String insertCompany(Model model,CompanyDto cdto) {
		
		boolean isS=companyService.insertCompany(cdto);
		if(isS) {
			System.out.println("회사등록성공");
		}else {
			System.out.println("회사등록실패");
		}
		
		return "manager/insertCompany";
	}
	
	//고객센터 관리////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//게시판 메뉴 선택 페이지     
	@RequestMapping(value="manager_customer.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String manager_customer(String snum,String ennum, Model model,HttpSession session) {
	logger.info("게시판 메뉴 선택");
	
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
	
	
	return "manager/manager_customer";
	}
	
	
	
//공지 게시판 목록 보기    
@RequestMapping(value="manager_notice.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_notice(Model model,String snum,String ennum,HttpSession session) {
logger.info("notice board main page");

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

logger.info("lists: "+lists);

return "manager/manager_noticeboard";
}

//공지게시판 글 상세내역 읽기 
@RequestMapping (value="manager_noticeboard_detail.do", method={RequestMethod.POST, RequestMethod.GET})
public String manager_notice_detail(Model model,int n_seq,String count){
	logger.info("notice board detail page"); 
	NoticeBoardDto dto = noticeService.n_detailBoard(n_seq,count);
	model.addAttribute("dto", dto);
	
	logger.info("dto: "+dto); 
	
	
	return "manager/manager_noticeboard_detail"; 
}



//공지게시판 새로운 게시글 입력 폼으로 이동 
@RequestMapping(value="insertnoticeform.do", method= {RequestMethod.POST,RequestMethod.GET})
public String insertnoticeform() {
	logger.info("notice board insert page");
	
	return "manager/manager_noticeinsertform"; 
}

//공지게시판 새로운 게시글 등록 
@RequestMapping(value="insertnotice.do", method= {RequestMethod.POST})
public String insertnotice(HttpSession session,NoticeBoardDto dto) {
	logger.info("notice board insert page");
	boolean isS=noticeService.n_insertBoard(dto); 
	
	String snum=(String)session.getAttribute("snum");
	String ennum=(String)session.getAttribute("ennum");
	
	if (isS) {
		return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
	}else {
		return "redirect:insertnoticeform.do"; 
	}
}

//공지게시판 수정폼
@RequestMapping(value="/manager_notice_delete.do")
public String manager_notice_delete(int n_seq,HttpSession session) {
	logger.info("manager manager_notice_delete start");
	
	String snum=(String)session.getAttribute("snum");
	String ennum=(String)session.getAttribute("ennum");
	
	
	boolean isc= noticeService.n_deleteBoard(n_seq);
	
	
	logger.info("manager manager_notice_delete end.");
	
	if (isc) {
		return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
	} else {
		return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
	}
}


@RequestMapping(value="/manager_noticeupdateboard.do")
public String manager_noticeupdateboard(NoticeBoardDto dto,HttpSession session) {
	logger.info("manager manager_notice_delete start");
	
	String snum=(String)session.getAttribute("snum");
	String ennum=(String)session.getAttribute("ennum");
	
	boolean isc=noticeService.n_updateBoard(dto);
	
	logger.info("manager manager_notice_delete end.");
	
	if (isc) {
		return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
	} else {
		return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
	}
}



//qna 게시판 보기 
@RequestMapping(value="manager_qna.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_qna(Model model,String snum,String ennum,HttpSession session) {
logger.info("qna board main page");

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

List<QnaBoardDto> lists=qnaService.q_getAlllist(qDto); 
int count=qnaService.q_pageCount();
model.addAttribute("lists", lists);
model.addAttribute("count", count);
return "manager/manager_qnaboard";
}


//qna 게시판 상세보기 
@RequestMapping(value="manager_qnadetail.do")
public String manager_qnadetail(Model model, int q_seq) {
	logger.info("manager qnaboard detail page"); 
	
	
	
	QnaBoardDto dto = qnaService.q_getAllBoard(q_seq);
	qnaService.q_pageCount();
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
public String notice_submitqna(QnaBoardDto dto,HttpSession session) {
	
	MembersDto lDto=(MembersDto)session.getAttribute("loginDto");
	String id=lDto.getId();
	dto.setId(id);
	
	String snum=(String)session.getAttribute("snum");
	String ennum=(String)session.getAttribute("ennum");
	
	boolean isc=qnaService.q_insertBoard(dto); 
	if(isc) {
		return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum; 
	}else {
		return "redirect:manager_insertqna.do"; 
	}
	
	
}
	
	//공지게시판 게시글 수정폼 이동 
	@RequestMapping(value="/notice_updateForm.do", method={RequestMethod.POST,RequestMethod.GET})
	public String notice_updateForm(Model model, int n_seq, String count, HttpSession session) {
		logger.info("notice notice_updateForm start.");
		
		NoticeBoardDto dto=noticeService.n_detailBoard(n_seq, count);
		
		model.addAttribute("dto", dto);
		
		logger.info("dto: "+dto);
		
		logger.info("notice notice_updateForm end.");
		
		return "manager/notice_qnaboardupdate";
	}
	
	//질문게시판 게시글 수정
	@RequestMapping(value="/manager_qnaupdateboard.do", method={RequestMethod.POST,RequestMethod.GET})
	public String manager_qnaupdateboard(Model model,QnaBoardDto dto, HttpSession session) {
		logger.info("qna update start.");
		
		logger.info("dto: "+dto);
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc=qnaService.q_updateBoard(dto);
		logger.info("qna update end.");
		if (isc) {
			return "redirect:manager_qnadetail.do?snum="+snum+"&ennum="+ennum;
		}else {
			return "redirect:manager_qnadetail.do?snum="+snum+"&ennum="+ennum;
		}
		
		
	}
	
	

	//질문게시판 게시글 수정 
	@RequestMapping(value="/manager_updateboard.do", method={RequestMethod.POST,RequestMethod.GET})
	public String updateboard(Model model, QnaBoardDto dto) {
		logger.info("manager qna board update complete");
		
		int q_seq=dto.getQ_seq();
		
		boolean isc=qnaService.q_updateBoard(dto); 
		if (isc) {
			return "redirect:manager_qnadetail.do?q_seq="+q_seq; 
		}else
		return "redirect:manager_qnadetail.do?q_seq="+q_seq;
	}

	
	//질문게시판 게시글 삭제 으아~~~~~~~~~~~~~
	@RequestMapping(value="/notice_deleteBoard.do")
	public String notice_deleteBoard(int q_seq,HttpSession session) {
		logger.info("manager qna board delete");
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc= qnaService.q_deleteBoard(q_seq);
		if (isc) {
			return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
		} else {
			return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
		}
	}


	
	//
//	//질문게시판 답글달기 
	@RequestMapping(value="/replyBoard.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String replyBoard(Locale locale, QnaBoardDto dto,HttpSession session) {
		logger.info("reply");
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isS=qnaService.q_replyBoard(dto);
		if (isS) {
			return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum;
		} else {
			logger.info("답글추가 실패", locale);
			return "qnadetail.do?seq="+dto.getQ_seq(); 
		}
	}
//			
	
	//질문게시판 게시글 삭제 
	@RequestMapping(value="/manager_deleteBoard.do",  method={RequestMethod.POST,RequestMethod.GET})
	public String manager_deleteBoard(int q_seq,HttpSession session) {
		logger.info("manager board delete");
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc=qnaService.q_deleteBoard(q_seq);
		if (isc) {
			return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum;
		}else {
			return "redirect:manager_qnadetail.do?q_seq="+q_seq+"&count=no"; 
		}
	}
	

//공지게시판 다중삭제
	@RequestMapping(value="/notice_multiDel.do", method= {RequestMethod.POST})
	public String notice_multiDel(String[] chk,HttpSession session) {
		logger.info("notice multiDel start");
		
		logger.info("chks: "+chk[0]);
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc=noticeService.notice_multiDel(chk);
		logger.info("notice multiDel end.");
		if (isc) {
			return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum;
		} else {
			return "redirect:manager_notice.do?snum="+snum+"&ennum="+ennum; 
		}
	}

	//qna게시판 다중삭제
	@RequestMapping(value="/qna_multiDel.do", method= {RequestMethod.POST})
	public String qna_multiDel(String[] chk,HttpSession session) {
		logger.info("qna multiDel start");
		
		logger.info("chks: "+chk[0]);
		
		String snum=(String)session.getAttribute("snum");
		String ennum=(String)session.getAttribute("ennum");
		
		boolean isc=qnaService.qna_multiDel(chk);
		logger.info("qna multiDel end.");
		if (isc) {
			return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum;
		} else {
			return "redirect:manager_qna.do?snum="+snum+"&ennum="+ennum; 
		}
	}

}
