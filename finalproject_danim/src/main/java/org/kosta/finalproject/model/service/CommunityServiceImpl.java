package org.kosta.finalproject.model.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.CommunityDAO;
import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Resource
	private CommunityDAO commDAO;
	
	@Override
	public List<CommunityVO> getCommList(int rownum){
		List<CommunityVO> list = commDAO.getCommList(rownum);
		
		/* 정규 표현식을 이용하여 Community의 content에서 이미지 태그 src만 추출 */
		for (CommunityVO cvo : list) {
			String text = cvo.getContent();
			if(text.length()>10){
				cvo.setContent(text.substring(0,30)+"\n...");
			}
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
	        Matcher matcher = pattern.matcher(text);
	         
	        while(matcher.find()){
	            cvo.setContent(matcher.group(0));
	        }
		}
		
		return list;
	}
	
	@Override
	public int getCountCommlist(){
		return commDAO.getCountCommlist();
	}
	
	@Override
	public void registerComm(CommunityVO paramVO){
		commDAO.registerComm(paramVO);
	}

	@Override
	public void updateCommunity(CommunityVO paramVO){
		commDAO.updateCommunity(paramVO);
	}
	
	@Override
	public void deleteCommunity(CommunityVO paramVO){
		commDAO.deleteCommunity(paramVO);
	}

	/**
	 * 1. 커뮤니티 게시판 글에 '좋아요' 버튼 클릭 이벤트 발생 시 해당 메서드가 작동된다.
	 * 2. 해당 회원이 해당 글 번호에 이미 likePosted 값을 증가시킨 경우(클릭한 경우), 
	 * 		likePosted 값을 삭제시킨다.
	 * 3. 2번이 아닌 경우, likePosted 값을 증가시킨다.
	 */
	@Override
	public int updateLikePosted(CommLikeVO paramVO){
		int findNo = findLikeByIdAndNo(paramVO);
		int result=0;
		if(findNo==1){
			commDAO.deleteLikePosted(paramVO);
		}else{
			result = commDAO.updateLikePosted(paramVO);
		}
		return result;
	}
	
	@Override
	public int findLikeByIdAndNo(CommLikeVO paramVO){
		return commDAO.findLikeByIdAndNo(paramVO);
	}
	
	@Override
	public CommunityVO findCommByNo(int commNo){
		return commDAO.findCommByNo(commNo);
	}

	/**
	 * 커뮤니티 댓글 추가 
	 */
	@Override
	public void registerComment(CommentVO paramVO){
		commDAO.registerComment(paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 수정 
	 */
	@Override
	public int updateComment(CommentVO paramVO){
		return commDAO.updateComment(paramVO);
		/*List<CommentVO> list = commDAO.getCommentList(comm_no);
		for (CommentVO clvo : list) {
			System.out.println("[service]"+clvo);
			clvo.setReplyList(commDAO.getReplyList(clvo.getComment_no()));
		}
		return list;*/
	}
	
	
	/**
	 * 커뮤니티 댓글 삭제 
	 */
	@Override
	public int deleteComment(int comment_no){
		return commDAO.deleteComment(comment_no);
	}
	
	/**
	 * 커뮤니티 댓글 보기
	 */
	@Override
	public List<CommentVO> getCommentList(int comm_no){
		List<CommentVO> list = commDAO.getCommentList(comm_no);
		for (CommentVO clvo : list) {
			clvo.setReplyList(commDAO.getReplyList(clvo.getComment_no()));
		}
		return list;
	}

	@Override
	public CommentVO getCommentByNo(int comm_no) {
		return commDAO.getCommentByNo(comm_no);
	}
	
/*	@Override
	public List<ReplyVO> getReplyList(int comment_no){
		return commDAO.getReplyList(comment_no);
	}*/

	@Override
	public void registerReply(ReplyVO paramVO) {
		commDAO.registerReply(paramVO);
	}
	
	@Override
	public void deleteReply(int replyNo) {
		commDAO.deleteReply(replyNo);
	}

	@Override
	public int updateReply(ReplyVO paramVO) {
		return commDAO.updateReply(paramVO);
	}
	
	@Override
	public List<CommLikeVO> getLikeRank(){
		List<CommLikeVO> list = commDAO.getLikeRank();
		
		/* 정규 표현식을 이용하여 Community의 content에서 이미지 태그 src만 추출 */
		for (CommLikeVO cvo : list) {
			String text = cvo.getContent();
			if(text.length()>10){
				cvo.setContent(text.substring(0,10));
			}
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
	        Matcher matcher = pattern.matcher(text);
	         
	        while(matcher.find()){
	            cvo.setContent(matcher.group(0));
	        }
		}
		
		return list;
	}
}
