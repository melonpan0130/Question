package com.example.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.BoardDAOImpl;
import com.example.project.model.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAOImpl boardDao;
	
	@Override
	public void create(BoardVO vo) {
		boardDao.create(vo);
	}

	@Override
	public BoardVO read(int bno) {
		return boardDao.read(bno);
	}

	@Override
	public void update(BoardVO vo) {
		boardDao.update(vo);
	}

	@Override
	public void delete(int bno) {
		boardDao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		return boardDao.listAll(start, end, searchOption, keyword);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time = 0;
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5 * 1000) {
			boardDao.increaseViewcnt(bno);
		}
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
		return boardDao.countArticle(searchOption, keyword);
	}
	
}
