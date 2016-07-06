package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

public interface MemberDAO {

	public abstract MemberVO checkLogin(MemberVO vo);
	public List<AreaVO> searchArea();
	public MemberVO findMemberById(String id);
	public MemberVO findMemberByNick(String nick);
	public void registerMember(MemberVO vo);
	public String findUpdateNickCheck(String nick);
	public void updateMember(MemberVO vo);
	public int checkPassword(MemberVO vo);
}