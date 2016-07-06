package org.kosta.finalproject.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.finalproject.model.vo.member.MemberVO;

public interface AdminDAO {

	//public abstract List<MemberVO> memberList();
	public abstract int checkPass(MemberVO vo);
	public abstract void deleteMember(String id);
	public abstract List<MemberVO> adminList();
	public abstract List<MemberVO> memberById(String id);
	public abstract List<MemberVO> memberByNick(String nickname);
	public abstract MemberVO checkMemberId(String id);
	public abstract void appointAdmin(String id);
	public abstract void fireAdmin(String id);
	public abstract List<MemberVO> memberList(Map<String, Integer> pagingConfig);
	public abstract int totalMember();
	public abstract void deleteReplyCommentById(String id);
	public abstract void deleteCommCommentById(String id);
	public abstract void deleteCommLikeById(String id);
	public abstract void deleteCommunityById(String id);
	public abstract void deleteNoticeById(String id);
	public abstract void deleteCombineCartById(String id);
	public abstract void deleteRecMessageById(String id);
	public abstract void deleteSenMessageById(String id);
}