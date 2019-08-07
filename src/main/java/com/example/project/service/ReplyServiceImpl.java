package com.example.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.ReplyDAO;
import com.example.project.model.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	ReplyDAO replyDao;
	
	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}
	
	@Override
	public List<ReplyVO> list(int bno, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno);
		String userId = (String)session.getAttribute("userId");
		for(ReplyVO vo : items) {
			if(vo.isSecret()) {
				if(userId==null) {
					vo.setReplytext("회원만 볼 수 있는 댓글입니다.");
				} else {
					
				}
			}
		}
		
		
//		if(session.getAttribute("userId") != null)
//			return replyDao.list(bno);
		return items;
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(int rno) {
		replyDao.delete(rno);
	}
	
}
