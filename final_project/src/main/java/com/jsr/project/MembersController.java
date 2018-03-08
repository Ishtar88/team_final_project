package com.jsr.project;

import java.lang.ProcessBuilder.Redirect;
import java.net.PasswordAuthentication;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsr.project.dtos.MembersDto;
import com.jsr.project.services.IMembersService;

@Controller
public class MembersController {

	@Autowired
	private IMembersService memberService;
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request,MembersDto mdto, HttpSession session) {

		MembersDto loginDto=memberService.login(mdto);
		System.out.println(loginDto);
		if(loginDto==null){
			return "redirect:index.jsp";
		}else {
			session.setAttribute("loginDto", loginDto);
			session.setMaxInactiveInterval(60*60);
			return "home";	
		}
	}

	@RequestMapping(value = "/regist1.do", method = RequestMethod.GET)
	public String regist1(HttpServletRequest request, HttpSession session) {
		return "member/regist1";
	}

	@RequestMapping(value = "/regist2.do", method = RequestMethod.POST)
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

	@RequestMapping(value = "/regist3.do", method = RequestMethod.POST)
	public String regist3(HttpServletRequest request,MembersDto mdto ,HttpSession rsession) {

		MembersDto reg1=(MembersDto)rsession.getAttribute("mdto");

		mdto.setId(reg1.getId());
		mdto.setM_name(reg1.getM_name());
		mdto.setM_password(reg1.getM_password());
		mdto.setM_email(reg1.getM_email());
		mdto.setM_phone(reg1.getM_phone());
		mdto.setM_birthDate(reg1.getM_birthDate());
		mdto.setM_gender(reg1.getM_gender());
		
		String zipNo=request.getParameter("zipNo");
		String roadAdd=request.getParameter("addrRoad");
		String addrDetail=request.getParameter("addrDetail");
		String m_address=zipNo+" "+roadAdd+" "+addrDetail;
		mdto.setM_address(m_address);

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
	
	@ResponseBody
	@RequestMapping(value = "/mailChkAjax.do", method = RequestMethod.POST)
	public Map<String, String> mailChkAjax(HttpServletRequest request) {
		
		final String user="ddudeen@gmail.com";
		final String password="wmfwmfdl3";
		String m_email=request.getParameter("m_email");
		System.out.println(m_email);
		
		Random rnd=new Random();
		StringBuffer temp=new StringBuffer();
		for (int i = 0; i < 20; i++) {
			 int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
		}
		String chkNum=temp.substring(0);
		System.out.println(chkNum);

		Map<String, String>map=new HashMap<String,String>();
		map.put("chkNum", chkNum);
		
		Properties prop=new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session=Session.getDefaultInstance(prop, new Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(user, password);
			}
		});
		
		try {

			
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(m_email));
			message.setSubject("���� ���� ��ȣ�Դϴ�.");
			message.setText(chkNum);
			
			Transport.send(message);
			System.out.println("���Ϲ߽ż���");
			
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return map;

	}
	
	@RequestMapping(value = "/searchAdd.do", method = RequestMethod.GET)
	public String searchAdd(HttpServletRequest request, HttpSession session) {
		return "member/searchAdd";
	}
	
	@RequestMapping(value = "/getUser.do", method = RequestMethod.GET)
	public String getUser(Model model,HttpServletRequest request, HttpSession session) {
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		MembersDto mdto=memberService.getUser(loginDto.getId());
		model.addAttribute("mdto",mdto);
		System.out.println(mdto);
		return "member/memberInfo";
	}
	
	@RequestMapping(value = "/modifyUser.do", method = RequestMethod.GET)
	public String modifyUser(Model model,HttpServletRequest request, HttpSession session) {
		
		return "member/memberModify";
	}
	
		
	@RequestMapping(value = "/imgForm.do", method = RequestMethod.GET)
	public String imgForm(Model model,HttpServletRequest request, HttpSession session) {
		return "member/imgForm";
	}
	
	@RequestMapping(value = "/imgChange.do", method = RequestMethod.GET)
	public String imgChange(HttpServletRequest request, HttpSession session,MembersDto mdto,Model model) {
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		mdto.setId(loginDto.getId());
		boolean isS=memberService.changeProfile(mdto);
		if(isS) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		MembersDto memDto=memberService.getUser(loginDto.getId());
		System.out.println(memDto);
		model.addAttribute("mdto",memDto);
		return "member/memberInfo";
	}
}
