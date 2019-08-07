package com.example.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.dto.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(int bno, HttpSession session);
	public void create(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(int rno);
}
