package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.MemberDAO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO loginCheck(MemberVO vo){
		return memberDAO.checkLogin(vo);
	}
	public List<AreaVO> searchArea(){
		return memberDAO.searchArea();
	}
	public MemberVO findMemberById(String id){
		return memberDAO.findMemberById(id);
	}
	public MemberVO findMemberByNick(String nick){
		return memberDAO.findMemberByNick(nick);
	}
	public void registerMember(MemberVO vo){
		memberDAO.registerMember(vo);
	}
	public String findUpdateNickCheck(String nick){
		return memberDAO.findUpdateNickCheck(nick);
	}
	public void updateMember(MemberVO vo){
		memberDAO.updateMember(vo);
	}
	@Override
	public int checkPassword(MemberVO vo) {
		return memberDAO.checkPassword(vo);
	}
}
