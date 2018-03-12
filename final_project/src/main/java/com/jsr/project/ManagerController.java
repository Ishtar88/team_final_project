package com.jsr.project;

import java.util.List;

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
public class ManagerController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	//Qnaservice랑 NoticeService를 넣을거예요. 
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private INoticeService noticeService;
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//매니저 게시판 보기    
@RequestMapping(value="manager_notice.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_notice(Model model) {
logger.info("notice board main page");
List<NoticeBoardDto> lists=noticeService.n_getAllList(); 
model.addAttribute("lists", lists);
return "manager/manger_noticeboard";
}

@RequestMapping(value="manager_qna.do", method = {RequestMethod.POST, RequestMethod.GET})
public String manager_qna(Model model) {
logger.info("qna board main page");
List<QnaBoardDto> lists=qnaService.q_getAlllist(); 
model.addAttribute("lists", lists);
return "manager/manager_qnaboard";
}


}

