package com.jsr.project;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletResponse;
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
import com.jsr.project.dtos.ProductDto;
import com.jsr.project.services.IMembersService;

@Controller
public class MembersController {

	@Autowired
	private IMembersService memberService;
	//@Autowired
	//private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request,MembersDto mdto, HttpSession session,HttpServletResponse response) throws IOException {

		MembersDto loginDto=memberService.login(mdto);
		System.out.println(loginDto);
		if(loginDto==null){
			return "redirect:index.jsp";
		}else if(loginDto.getM_grade().equals("ADMIN")){
			jsFoward("관리자 페이지 로그인 성공", response);
			session.setAttribute("loginDto", loginDto);
		    return "manager/manager_home"; 
		}else {
			 jsFoward("로그인성공", response);
			session.setAttribute("loginDto", loginDto);
			session.setMaxInactiveInterval(100*100);
			return "home";
		}
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,MembersDto mdto, HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";

	}

	@RequestMapping(value = "/gohome.do", method = RequestMethod.GET)
	public String home(HttpServletRequest request,HttpSession session) {
		return "home";
	}

	@RequestMapping(value = "/manager_home.do", method = RequestMethod.GET)
	public String manager_home(HttpServletRequest request, HttpSession session) {
		return "manager/manager_home";
	}
	
	@RequestMapping(value = "/regist1.do", method = RequestMethod.GET)
	public String regist1(HttpServletRequest request, HttpSession session) {
		return "member/regist1";
	}

	@RequestMapping(value = "/regist2.do", method = RequestMethod.POST)
	public String regist2(HttpServletRequest request,HttpSession session,HttpSession rSession,MembersDto mdto) {
		String email1=request.getParameter("email1");
		if(request.getParameter("mailadd").equals("self")) {
			String email2=request.getParameter("email2");
			String m_email=email1+"@"+email2;
			mdto.setM_email(m_email);
		}else {
			String email2=request.getParameter("mailadd");
			String m_email=email1+"@"+email2;
			mdto.setM_email(m_email);
		}
		

		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String m_phone=phone1+"-"+phone2+"-"+phone3;
		mdto.setM_phone(m_phone);

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
	public String regist3(HttpServletRequest request,MembersDto mdto ,HttpSession rsession,Model model) {

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
		String m_address=zipNo+"+"+roadAdd+"+"+addrDetail;
		mdto.setM_address(m_address);

		String po_point="";
		if(mdto.getM_address().equals("++")&&mdto.getM_job().equals("")&&mdto.getM_mariable()==null&&mdto.getM_favorite()==null) {
			po_point="100";
			boolean isS=memberService.regist(mdto,mdto.getId(),po_point);
			if(isS) {
				System.out.println("추가정보X:가입성공");
				model.addAttribute("isS",isS);
				return "member/regist2";
			}else {
				model.addAttribute("isS",isS);
				System.out.println("추가정보X:가입실패");
				return "member/regist2";
			}
		}else {
			po_point="200";
			boolean isS=memberService.regist(mdto,mdto.getId(),po_point);
			if(isS) {
				model.addAttribute("isS",isS);
				System.out.println("추가정보O:가입성공");
				return "member/regist2";
			}else {
				model.addAttribute("isS",isS);
				System.out.println("추가정보O:가입실패");
				return "member/regist2";
			}
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
		
		//String m_email=request.getParameter("m_email");
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
			message.setSubject("본인확인 인증 번호입니다.");
			message.setText(chkNum);

			Transport.send(message);
			System.out.println("발신 성공");


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

		return "member/memberInfo";
	}
	

	@RequestMapping(value = "/getModiForm.do", method = RequestMethod.GET)
	public String getModiForm(Model model,HttpServletRequest request, HttpSession session) {

		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		MembersDto mdto=memberService.getUser(loginDto.getId());
		model.addAttribute("mdto",mdto);

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
			model.addAttribute("isS",isS);
			System.out.println("변경완료");
			return "member/imgForm";
		}else {
			model.addAttribute("isS",isS);
			System.out.println("변경실패");
			return "member/imgForm";
		}
//		MembersDto memDto=memberService.getUser(loginDto.getId());
//		System.out.println(memDto);
//		model.addAttribute("mdto",memDto);
	}

	@RequestMapping(value = "/modifyUser.do", method = RequestMethod.POST)
	public String modifyUser(Model model,HttpServletRequest request, HttpSession session,MembersDto mdto) {
		
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		
		
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String m_phone=phone1+"-"+phone2+"-"+phone3;
		mdto.setM_phone(m_phone);

		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		String m_birthDate=year+"-"+month+"-"+date;
		mdto.setM_birthDate(m_birthDate);

		String zipNo=request.getParameter("zipNo");
		String roadAdd=request.getParameter("addrRoad");
		String addrDetail=request.getParameter("addrDetail");
		String m_address=zipNo+"+"+roadAdd+"+"+addrDetail;
		mdto.setM_address(m_address);
		boolean isS=memberService.modifyUser(mdto);
		if(isS) {
			System.out.println("수정완료");
		}else {
			System.out.println("수정실패");
		}

		MembersDto memDto=memberService.getUser(loginDto.getId());
		System.out.println(memDto);
		model.addAttribute("mdto",memDto);
		return "member/memberInfo";
	}

	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(HttpServletRequest request,MembersDto mdto,HttpSession session,Model model) {
		
		String kakaoId=request.getParameter("kakaoId");
		String m_password="kakao_"+kakaoId;

		mdto.setId(request.getParameter("m_email"));
		mdto.setM_password(m_password);

		String name=request.getParameter("name");
		String m_name=name.substring(1, name.lastIndexOf("\""));
		mdto.setM_name(m_name);
		
		System.out.println("카카오로그인정보"+mdto);

		MembersDto loginDto=memberService.login(mdto);
		System.out.println(loginDto);
		
	
		if(loginDto==null){
			boolean isS=memberService.kakaoLogin(mdto);
			if(isS) {
				System.out.println("최초로그인:회원가입성공");
				
				MembersDto loginDto2=memberService.login(mdto);
				System.out.println(loginDto2);
				session.setAttribute("loginDto", loginDto2);
				session.setMaxInactiveInterval(60*60);
				return "home";
			}else {
				System.out.println("최초로그인:회원가입실패");
				return "redirect:index.jsp";
			}
		}else {
			System.out.println("최초로그인X:로그인");
			session.setAttribute("loginDto", loginDto);
			session.setMaxInactiveInterval(60*60);
			return "home";
		}

	}

	@RequestMapping(value = "/leaveUser.do", method = RequestMethod.GET)
	public String leaveUser(HttpServletRequest request, HttpSession session) {
		return "member/leaveUser";
	}

	@ResponseBody
	@RequestMapping(value = "/chkPw.do", method = RequestMethod.POST)
	public Map<String,MembersDto> chkPw(HttpServletRequest request, HttpSession session) {

		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		MembersDto mdto=memberService.chkPw(loginDto);

		Map<String,MembersDto> map=new HashMap<String,MembersDto>();
		map.put("mdto", mdto);

		return map;

	}

	@ResponseBody
	@RequestMapping(value = "/getoutUser.do", method = RequestMethod.POST)
	public Map<String,String> getoutUser(HttpServletRequest request, HttpSession session) {
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		boolean isS=memberService.leaveUser(loginDto);

		Map<String,String> map=new HashMap<String,String>();
		if(isS) {
			map.put("useable", "y");
			System.out.println("탈퇴성공");
		}else {
			map.put("useable", "n");
			System.out.println("탈퇴실패");
		}
		return map;
	}

	@RequestMapping(value = "/findIdPw.do", method = RequestMethod.GET)
	public String findIdPw(HttpServletRequest request,HttpSession session) {
		return "member/findIdPw";
	}

	@ResponseBody
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public Map<String, MembersDto> findId(HttpServletRequest request,HttpSession session,MembersDto mdto) {
		String m_name=request.getParameter("m_name");
		String m_email=request.getParameter("m_email");
		mdto.setM_name(m_name);
		mdto.setM_email(m_email);

		MembersDto chkDto=memberService.findId(mdto);
		Map<String, MembersDto> map=new HashMap<String, MembersDto>();
		map.put("chkDto", chkDto);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public Map<String, String> findPw(HttpServletRequest request,MembersDto mdto) {
		final String user="ddudeen@gmail.com";
		final String password="wmfwmfdl3";

		String id=request.getParameter("id");
		String m_email=request.getParameter("m_email");
		mdto.setId(id);
		mdto.setM_email(m_email);

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

		String m_password=temp.substring(0);
		System.out.println(m_password);

		MembersDto chkDto=memberService.findPw(mdto,id,m_password);

		Map<String, String>map=new HashMap<String,String>();

		if(chkDto==null) {
			map.put("chkDto", "nomatch");

		}else {

			map.put("m_password", m_password);

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
				message.setSubject("임시 비밀번호입니다.");
				message.setText(m_password);

				Transport.send(message);
				System.out.println("메일발신성공");


			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}

		return map;
	}
	
	@RequestMapping(value = "/changePw.do", method = RequestMethod.GET)
	public String changePw(HttpServletRequest request,ProductDto prodto) {
		return "member/changePw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/changePassword.do", method = RequestMethod.POST)
	public Map<String, String> changePassword(HttpServletRequest request,ProductDto prodto,HttpSession session) {
		String m_password=request.getParameter("m_password");
		MembersDto loginDto=(MembersDto)session.getAttribute("loginDto");
		boolean isS=memberService.changePW(loginDto.getId(), m_password);
		Map<String, String> map=new HashMap<String, String>();
		if(isS) {
			map.put("change", "y");
			return map;
		}else {
			map.put("change", "n");
			return map;
		}
		
	}
	
	public void jsFoward(String msg,HttpServletResponse response) throws IOException{
		  String str="<script type='text/javascript'>"
		    + "alert('"+msg+"');"
		    +  "</script>";
		  PrintWriter pw=response.getWriter();
		  pw.print(str);
		 }


}
