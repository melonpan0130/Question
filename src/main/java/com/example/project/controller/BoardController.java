package com.example.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.BoardVO;
import com.example.project.service.BoardPager;
import com.example.project.service.BoardService;
import com.example.project.service.BoardServiceImpl;

@Controller
public class BoardController {
	@Inject
	BoardServiceImpl boardService;
	
	@RequestMapping("/board/list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption
			, @RequestParam(defaultValue="")String keyword
			, @RequestParam(defaultValue="1")int curPage) {
		int count = boardService.countArticle(searchOption, keyword);
		
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		
		mav.addObject("map", map);
		mav.setViewName("board/list");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/board/view.do")
	public ModelAndView view(@RequestParam int bno, HttpSession session) {
		boardService.increaseViewcnt(bno, session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		
		return mav;
	}
	
	@RequestMapping("/board/update.do")
	public String update(@ModelAttribute BoardVO vo) {
		boardService.update(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("/board/delete.do")
	public String delete(@RequestParam int bno) {
		boardService.delete(bno);
		return "redirect:list.do";
	}
	
	@RequestMapping("/board/write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("/board/insert.do")
	public String insertBoard(@ModelAttribute BoardVO vo, HttpSession session) {
		String writer = (String)session.getAttribute("userId");
		vo.setWriter(writer);
		
		boardService.create(vo);
		return "redirect:list.do";
	}
}
