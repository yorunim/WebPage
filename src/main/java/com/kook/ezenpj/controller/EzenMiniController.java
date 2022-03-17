package com.kook.ezenpj.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kook.ezenpj.dao.MiniDao;
import com.kook.ezenpj.miniCommand.JoinCommand;
import com.kook.ezenpj.miniCommand.MiniCommand;
import com.kook.ezenpj.util.Constant;

@Controller
public class EzenMiniController {
	
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	//bean �����Ͽ� constant
	private MiniDao mdao;
	@Autowired
	public void setMdao(MiniDao mdao) {
		this.mdao = mdao;
		Constant.mdao = mdao;
	}
	
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	
	private MiniCommand mcom; // command�� �������̽� ��ü�� �����Ͽ� �������� ���� ���� Ŭ���� ��ü�� ���� ��� 
	
//	=================== Join ========================
	@RequestMapping("/join_view")
	public String join_view() {
		return "join_view";
	}
	
	@RequestMapping(value= "/join",produces = "application/text; charset=UTF8")
	@ResponseBody //jsp�� �ƴ� ���ڿ��̳� ��ü�� ������ ������ �ʿ�
	public String join(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("join");
		mcom = new JoinCommand(); //join��û�� ���� commandŬ������ MinuCommand�������̽� ���� Ŭ����
		mcom.execute(model, request);
		String result = (String)request.getAttribute("result");
		System.out.println(result);
		if(result.equals("success"))
			return "join-success";
		else 
			return "join-failed";
	}
//	=================== Login =======================
	@RequestMapping("login_view")
	public String login_view(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,Model model) {
		System.out.println("login_view");
		
		return "login_view";
	}
	
	@RequestMapping(value = "/processLogin", method = RequestMethod.GET)
	public ModelAndView processLogin(
			@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpSession session
			)	{
		System.out.println("processLogin");
		ModelAndView model = new ModelAndView();
		if(log != null && log !="") {
			model.addObject("log", "before login!");
		}
		if(error != null && error !="") { //�α��ν� �����߻��ϸ� security���� ��û(���� 1)
			model.addObject("error", "Invalid username or password");
		}
		if(logout != null && logout !="") { // �α׾ƿ� ������ security���� ��û(���� 1)
			model.addObject("logout", "You've been logged out successfully");
		}
		model.setViewName("login_view");
		
		return model;
	}
	
	
	
//	============== product ==================
	@RequestMapping("/product")
	public String product(HttpServletRequest request,HttpServletResponse response,
			Model model, Authentication authentication) {
		System.out.println("product");
//		id�� role������ ���� ���
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println(userDetails.getUsername()); //hsk5410@naver.com(�α����� ���̵�)
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString(); // role�� �� ���ڿ��� ��ȯ
		System.out.println(auth); // [ROLE_USER]����
		return "product_view";
	}
	
}
