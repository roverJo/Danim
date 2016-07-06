package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<CommunityVO> getCommList(int rownum){
		return template.selectList("community.getCommlist", rownum);
	}
	
	@Override
	public int getCountCommlist(){
		return template.selectOne("community.getCountCommlist");
	}
	
	/**
	 * 커뮤니티 게시판 글 작성
	 */
	@Override
	public void registerComm(CommunityVO paramVO){
		template.insert("community.registerComm", paramVO);
	}
	
	/**
	 * 커뮤니티 게시판 글 수정
	 */
	@Override
	public void updateCommunity(CommunityVO paramVO){
		template.update("community.updateCommunity", paramVO);
	}
	
	/**
	 * 커뮤니티 게시판 글 삭제
	 */
	@Override
	public void deleteCommunity(CommunityVO paramVO){
		template.delete("community.deleteCommunity", paramVO);
	}
	
	/*@Override
	public List<CommLikeVO> getLikePosted(){
		return template.selectList("community.getLikePosted");
	}*/
	
	/**
	 * 커뮤니티 게시글 좋아요 증가
	 */
	@Override
	public int updateLikePosted(CommLikeVO paramVO){
		return template.insert("community.updateLikePosted",paramVO);
	}
	
	/**
	 * 커뮤니티 게시글 좋아요 삭제
	 */
	@Override
	public void deleteLikePosted(CommLikeVO paramVO){
		template.delete("community.deleteLikePosted",paramVO);
	}

	/*@Override
	public int findLikeByCommNo(int comm_no) {
		if((template.selectOne("community.findLikeByNo",comm_no))==null){
			return 0;
		}
		return template.selectOne("community.findLikeByNo",comm_no);
	}*/

	/**
	 * 이 메서드는 해당 게시판 no에 해당 아이디가 
	 * 좋아요를 클릭하였는지 여부를 count를 통하여 확인 가능하다. 
	 */
	@Override
	public int findLikeByIdAndNo(CommLikeVO paramVO){
		return template.selectOne("community.findLikeByIdAndNo",paramVO);
	}
	
	/**
	 * 해당 게시판 no에 정보를 가져온다.
	 */
	@Override
	public CommunityVO findCommByNo(int commNo){
		return template.selectOne("community.findCommByNo",commNo);
	}
	
	/*@Override
	public int updateComm(CommunityVO paramVO){
		return template.update("community.updateComm", paramVO);
	}
	*/
	
	/**
	 * 커뮤니티 댓글 추가
	 */
	@Override
	public void registerComment(CommentVO paramVO){
		template.insert("community.registerComment",paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 수정 
	 */
	@Override
	public int updateComment(CommentVO paramVO){
		return template.update("community.updateComment",paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 삭제 
	 */
	@Override
	public int deleteComment(int comment_no){
		return template.delete("community.deleteComment",comment_no);
	}
	
	/**
	 * 커뮤니티 댓글 보기
	 */
	@Override
	public List<CommentVO> getCommentList(int comm_no){
		return template.selectList("community.getCommentList", comm_no);
	}

	/**
	 * 커뮤니티 댓글 정보
	 */
	@Override
	public CommentVO getCommentByNo(int comm_no) {
		return template.selectOne("community.getCommentByNo",comm_no);
	}
	
	/**
	 * 커뮤니티 댓글의 댓글 보기
	 */
	@Override
	public List<ReplyVO> getReplyList(int comment_no){
		return template.selectList("community.getReplyList",comment_no);
	}
	/**
	 * 커뮤니티 댓글의 댓글 추가
	 */
	@Override
	public void registerReply(ReplyVO paramVO){
		template.insert("community.registerReply",paramVO);
	}
	
	/**
	 * 커뮤니티 댓글의 댓글 삭제
	 */
	@Override
	public void deleteReply(int replyNo){
		template.delete("community.deleteReply",replyNo);
	}

	@Override
	public int updateReply(ReplyVO paramVO) {
		return template.update("community.updateReply",paramVO);
	}
	
	/**
	 * 좋아요 순위별 글내용 리스트
	 */
	@Override
	public List<CommLikeVO> getLikeRank(){
		return template.selectList("community.getLikeRank");
	}
}
