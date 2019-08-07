package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("member.insertMember", vo);
	}

	@Override
	public MemberVO viewMember(String userId) {
		return sqlSession.selectOne("member.ViewMember", userId);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("member.updateMember", vo);
	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.delete("member.deleteMember", userId);
	}

	@Override
	public boolean checkPw(String userId, String userPw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		int result = sqlSession.selectOne("member.checkPw", map);
		if(result == 1)
			return true;
		return false;
	}
}
