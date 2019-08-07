package com.example.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.MemberVO;
import com.example.project.service.LoginService;

@Controller
public class LoginController {
	@Inject
	LoginService loginService;
	
	@RequestMapping("login/login.do")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/login/loginCheck.do")
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) {
		
		boolean result = loginService.LoginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.setViewName("login/home");
		} else {
			mav.setViewName("login/login");
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	@RequestMapping("/login/logout.do")
	public ModelAndView Logout(HttpSession session) {
		loginService.Logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		mav.addObject("msg", "logout");
		
		return mav;
	}
}
