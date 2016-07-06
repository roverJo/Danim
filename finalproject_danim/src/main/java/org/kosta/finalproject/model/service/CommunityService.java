package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;

public interface CommunityService {

	public List<CommunityVO> getCommList(int rownum);
	
	public int getCountCommlist();

	public void registerComm(CommunityVO paramVO);

	public void updateCommunity(CommunityVO paramVO);
	
	public void deleteCommunity(CommunityVO paramVO);
	
	public int updateLikePosted(CommLikeVO paramVO);

	public int findLikeByIdAndNo(CommLikeVO paramVO);
	
	public CommunityVO findCommByNo(int commNo);

	public List<CommentVO> getCommentList(int comm_no);
	
	public int updateComment(CommentVO paramVO);

	public int deleteComment(int comment_no);

	public void registerComment(CommentVO paramVO);

	public CommentVO getCommentByNo(int comm_no);

//	public List<ReplyVO> getReplyList(int comment_no);
	
	public List<CommLikeVO> getLikeRank();

	public void registerReply(ReplyVO paramVO);

	public void deleteReply(int replyNo);
	
	public int updateReply(ReplyVO paramVO);

}