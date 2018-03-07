package com.jsr.project;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.services.IMembersService;

@Controller
public class MembersController {
	
	@Autowired
	private IMembersService memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request,MembersDto mdto, HttpSession session) {
		
		MembersDto loginDto=memberService.login(mdto);
		System.out.println(loginDto);
		if(loginDto==null){
			return "redirect:index.jsp";
		}else {
			session.setAttribute("loginDto", loginDto);
			return "home";	
		}
	}
	
	@RequestMapping(value = "/regist1.do", method = RequestMethod.GET)
	public String regist1(HttpServletRequest request, HttpSession session) {
		return "member/regist1";
	}
	
	@RequestMapping(value = "/regist2.do", method = RequestMethod.GET)
	public String regist2(HttpServletRequest request,HttpSession session,HttpSession rSession,MembersDto mdto) {
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String m_email=email1+"@"+email2;
		mdto.setM_email(m_email);
		
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String m_phone=phone1+"-"+phone2+"-"+phone3;
		mdto.setM_phone(m_phone);
		
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String m_address=address1+" "+address2;
		mdto.setM_address(m_address);
		
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		String m_birthDate=year+"-"+month+"-"+date;
		mdto.setM_birthDate(m_birthDate);
		
		rSession.setAttribute("mdto", mdto);
		System.out.println("regist2"+mdto);

		return "member/regist2";
	}
	
	@RequestMapping(value = "/regist3.do", method = RequestMethod.GET)
	public String regist3(HttpServletRequest request,MembersDto mdto ,HttpSession rsession) {
		
		MembersDto reg1=(MembersDto)rsession.getAttribute("mdto");
		
		mdto.setId(reg1.getId());
		mdto.setM_name(reg1.getM_name());
		mdto.setM_password(reg1.getM_password());
		mdto.setM_email(reg1.getM_email());
		mdto.setM_phone(reg1.getM_phone());
		mdto.setM_birthDate(reg1.getM_birthDate());
		mdto.setM_gender(reg1.getM_gender());
		
		  boolean isS=memberService.regist(mdto);
		  if(isS==true){
		   return "home";
		  }else {
		   return "member/regist1";
		  }
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChkAjax.do")
	public Map<String, MembersDto> idChkAjax(String id) {
		MembersDto mdto=memberService.idChk(id);
		Map<String,MembersDto> map=new HashMap<String,MembersDto>();
		map.put("mdto", mdto);
		return map;
	}
	
	
}
