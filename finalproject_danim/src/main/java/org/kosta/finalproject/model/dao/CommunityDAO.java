package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;

public interface CommunityDAO {

	public abstract List<CommunityVO> getCommList(int rownum);
	
	public int getCountCommlist();

	/**
	 * 커뮤니티 게시판 글 작성
	 */
	public void registerComm(CommunityVO paramVO);

	/**
	 * 커뮤니티 게시판 글 수정
	 */
	public void updateCommunity(CommunityVO paramVO);
	
	/**
	 * 커뮤니티 게시판 글 삭제
	 */
	public void deleteCommunity(CommunityVO paramVO);

	public int updateLikePosted(CommLikeVO paramVO);

	public void deleteLikePosted(CommLikeVO paramVO);

	public int findLikeByIdAndNo(CommLikeVO paramVO);

	public CommunityVO findCommByNo(int commNo);

	public List<CommentVO> getCommentList(int comm_no);

	/**
	 * 커뮤니티 댓글 수정 
	 */
	public int updateComment(CommentVO paramVO);

	/**
	 * 커뮤니티 댓글 삭제 
	 */
	public int deleteComment(int comment_no);

	/**
	 * 커뮤니티 댓글 추가 
	 */
	public void registerComment(CommentVO paramVO);

	public CommentVO getCommentByNo(int comm_no);

	/**
	 * 커뮤니티 댓글의 댓글 보기 
	 */
	public List<ReplyVO> getReplyList(int comment_no);

	public List<CommLikeVO> getLikeRank();
	
	public void registerReply(ReplyVO paramVO);

	public void deleteReply(int replyNo);

	public int updateReply(ReplyVO paramVO);


}