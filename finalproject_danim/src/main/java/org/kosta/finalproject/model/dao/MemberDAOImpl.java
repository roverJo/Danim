package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public MemberVO checkLogin(MemberVO vo){
		return template.selectOne("member.checkLogin",vo);
	}
	public List<AreaVO> searchArea(){
		return template.selectList("area.searchArea");
	}
	public MemberVO findMemberById(String id){
		return template.selectOne("member.findMemberById",id);
	}
	public MemberVO findMemberByNick(String nick){
		return template.selectOne("member.findMemberByNick",nick);
	}
	public void registerMember(MemberVO vo){
		template.insert("member.registerMember",vo);
	}
	public String findUpdateNickCheck(String nick){
		return template.selectOne("member.findUpdateNickCheck",nick);
	}
	public void updateMember(MemberVO vo){
		template.update("member.updateMember",vo);
	}
	public int checkPassword(MemberVO vo){
		return template.selectOne("member.checkPassword",vo);
	}
}
