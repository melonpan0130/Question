package com.example.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.ReplyVO;
import com.example.project.service.ReplyService;

@RestController
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@RequestMapping("/reply/insert.do")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session, @RequestParam boolean secret) {
		String userId = (String)session.getAttribute("userId");
		vo.setReplyer(userId);
		vo.setSecret(secret);
		replyService.create(vo);
	}
	
//	@RequestMapping("/reply/list.do") // 화면(view)을 리턴
//	public ModelAndView list(@RequestParam int bno, ModelAndView mav) {
//		List<ReplyVO> list = replyService.list(bno);
//		mav.setViewName("board/replyList");
//		mav.addObject("list", list);
//		return mav;
//	}
	
	@RequestMapping("/reply/listJson.do")
	@ResponseBody // 리턴 데이터를 JSON으로 변환해서 처리
	public List<ReplyVO> listJson(@RequestParam int bno, HttpSession session) {
		List<ReplyVO> list = replyService.list(bno, session);
		
		return list;
	}
	
	@RequestMapping("/reply/modify.do")
	public void modify() {
		
	}
	
	@RequestMapping("/reply/update.do")
	public void update(@ModelAttribute ReplyVO vo, HttpSession session) {
		// String userId = (String)session.getAttribute("userId");
		
		// if(userId.equals(vo.getUserName()))
			replyService.update(vo);
	}
	
	@RequestMapping("/reply/delete.do")
	// @ResponseBody
	public String delete(@RequestParam int rno) {
		replyService.delete(rno);
		return "	<script>\r\n" + 
				"		window.onload= function() {\r\n" + 
				"			history.back();\r\n" + 
				"		}\r\n" + 
				"	</script>";
	}
}
