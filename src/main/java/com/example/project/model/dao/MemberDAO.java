package com.example.project.model.dao;

import java.util.List;

import com.example.project.model.dto.MemberVO;

public interface MemberDAO {
	// 1. ȸ�� ��� ����
	public List<MemberVO> memberList();
	
	// 2. ȸ�� �Է��ϱ�
	public void insertMember(MemberVO vo);
	
	// 3. ȸ�� ���� �󼼺���
	public MemberVO viewMember(String userId);
	
	// 4. ȸ�� ���� �����ϱ�
	public void updateMember(MemberVO vo);
	
	// 5. ȸ�� ���� �����ϱ�
	public void deleteMember(String userId);
	
	// 6. ��й�ȣ Ȯ��
	public boolean checkPw(String userId, String userPw);
}