package org.kosta.finalproject.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	/*@Override
	public List<MemberVO> memberList(){
		return template.selectList("admin.memberList");
	}*/
	public int checkPass(MemberVO vo){
		return template.selectOne("admin.checkPass",vo);
	}
	public void deleteMember(String id){
		template.delete("admin.deleteMember",id);
	}
	public List<MemberVO> adminList(){
		return template.selectList("admin.adminList");
	}
	public List<MemberVO> memberById(String id){
		return template.selectList("admin.memberById",id);
	}
	public List<MemberVO> memberByNick(String nickname){
		return template.selectList("admin.memberByNick",nickname);
	}
	public MemberVO checkMemberId(String id){
		return template.selectOne("admin.checkMemberId", id);
	}
	public void appointAdmin(String id){
		template.update("admin.appointAdmin",id);
	}
	public void fireAdmin(String id){
		template.update("admin.fireAdmin",id);
	}
	@Override
	public List<MemberVO> memberList(Map<String, Integer> pagingConfig) {
		return template.selectList("admin.memberList", pagingConfig);
	}
	@Override
	public int totalMember() {
		return template.selectOne("admin.totalMember");
	}
	
	//탈퇴관련
	@Override
	public void deleteReplyCommentById(String id) 
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteReplyCommentById",id);
	}
	@Override
	public void deleteCommCommentById(String id) 
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteCommCommentById",id);
	}
	@Override
	public void deleteCommLikeById(String id)
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteCommLikeById",id);
	}
	@Override
	public void deleteCommunityById(String id) 
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteCommunityById",id);
	}
	@Override
	public void deleteNoticeById(String id)
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteNoticeById",id);
	}
	@Override
	public void deleteCombineCartById(String id) 
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteCombineCartById",id);
	}
	@Override
	public void deleteRecMessageById(String id) 
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteRecMessageById",id);
	}
	@Override
	public void deleteSenMessageById(String id)
	{
		// TODO Auto-generated method stub
		template.delete("admin.deleteSenMessageById",id);
	}
}
