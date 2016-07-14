package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.CommunityService;
import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommController {
	@Resource
	private CommunityService commService;
	
	/**
	 * 1. 커뮤니티 게시판 목록 리스트 가져오기
	 * 2. 회원 로그인
	 */
	@RequestMapping("community_list.do")
	public ModelAndView getCommList(HttpServletRequest request, int rownum){
		List<CommunityVO> list = commService.getCommList(rownum);
		List<CommLikeVO> likeRankList = commService.getLikeRank();
		int count = commService.getCountCommlist();
		
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("mvo") != null) {
			for (CommunityVO clvo : list) {
				int userLike = commService.findLikeByIdAndNo(new CommLikeVO( clvo.getComm_no(), ((MemberVO)session.getAttribute("mvo")).getId()) );
				clvo.setUserLike(userLike);
			}
		}
		ModelAndView mv = new ModelAndView("community_list", "commList", list);
		mv.addObject("rankList", likeRankList);
		mv.addObject("commListsize", count);
		return mv;
	}
	
	/**
	 * 커뮤니티 게시판 글 작성
	 */
	@RequestMapping("login_comm_write.do")
	public String writeCommunity(HttpServletRequest request, CommunityVO paramVO){
		HttpSession session = request.getSession(false);
		if (session != null || session.getAttribute("mvo") != null) {
			paramVO.setMemberVO((MemberVO) session.getAttribute("mvo"));
		}
		commService.registerComm(paramVO);
		return "redirect:community_list.do?rownum=5";
	}
	
	@RequestMapping("login_comm_update_click.do")
	public ModelAndView updateClickTest(CommunityVO paramVO){
		CommunityVO commVO = commService.findCommByNo(paramVO.getComm_no());
		return new ModelAndView("community_update", "commVO", commVO);
	}
	/**
	 * 커뮤니티 게시판 글 수정
	 */
	@RequestMapping("comm_update.do")
	public String updateCommunity(HttpServletRequest request, CommunityVO paramVO){
		HttpSession session = request.getSession(false);
		if (session != null || session.getAttribute("mvo") != null) {
			paramVO.setMemberVO((MemberVO) session.getAttribute("mvo"));
		}
		commService.updateCommunity(paramVO);
		return "redirect:community_list.do?rownum=5";
	}
	
	/**
	 * 커뮤니티 게시판 글 삭제
	 */
	@RequestMapping("login_comm_delete.do")
	public String deleteCommunity(HttpServletRequest request, CommunityVO paramVO){
		HttpSession session = request.getSession(false);
		if (session != null || session.getAttribute("mvo") != null) {
			paramVO.setMemberVO((MemberVO) session.getAttribute("mvo"));
		}
		commService.deleteCommunity(paramVO);
		return "redirect:community_list.do?rownum=5";
	}
	
	/**
	 * 1. 커뮤니티 게시판 글에 '좋아요' 버튼 클릭 이벤트 발생 시 해당 메서드가 작동된다.
	 * 2. 회원의 로그인된 상태를 확인하여 commNo에 해당하는 likePosted 값을 증가시킨다.
	 * 3. 만약 회원이 이미 commNo에 해당하는 likePosted 값을 증가시킨 경우(클릭한 경우),
	 * 		likePosted 값을 삭제시킨다.
	 */
	@RequestMapping("comm_updateLike.do")
	@ResponseBody
	public int updateContentsLike(HttpServletRequest request, int commNo){
		HttpSession session = request.getSession(false);
		
		CommLikeVO clvo = new CommLikeVO(commNo);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (session != null || mvo != null) {
			clvo.setId(mvo.getId());
		}
		int result = commService.updateLikePosted(clvo);
		return result;
	}
	
	/**
	 * 1. 커뮤니티 게시판에서 게시글의 '상세보기'를 클릭하였을 때 해당 메서드가 동작된다.
	 * 2. 상세글 내용 화면을 반환해준다.
	 * 3. 글에 해당하는 댓글 리스트를 반환한다.
	 */
	@RequestMapping("findCommByNo.do")
	public ModelAndView findCommByNo(int commNo){
		CommunityVO cvo = commService.findCommByNo(commNo);
		List<CommentVO> commentList = commService.getCommentList(commNo);
		ModelAndView mv = new ModelAndView("community_detail","commVO",cvo);
		mv.addObject("commentList",commentList);
		return mv;
	}

	/**
	 * 댓글 등록 
	 */
	@RequestMapping("registerComment.do")
	@ResponseBody
	public List<CommentVO> registerComment(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		int commNo = Integer.parseInt(request.getParameter("comm_no"));
		
		CommentVO commentVO = new CommentVO();
		MemberVO mvo = null;
		if(session!=null || session.getAttribute("mvo")!=null){
			mvo = (MemberVO) session.getAttribute("mvo");
		}
		commentVO.setCommunityVO(new CommunityVO(commNo, mvo));
		commentVO.setContent(request.getParameter("commentParentText"));
		commService.registerComment(commentVO);
		
//		return commService.getCommentByNo(commentVO.getComment_no());
//		System.out.println("[registerComment]"+commService.getCommentList(commNo));
		return commService.getCommentList(commNo);
	}
	
	/**
	 * 댓글 삭제 
	 */
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(int comment_no){
		commService.deleteComment(comment_no);
	}

	/**
	 * 댓글 수정 
	 */
	@RequestMapping("updateComment.do")
	@ResponseBody
	public List<CommentVO> updateComment(CommentVO paramVO, int comm_no){
		int result = commService.updateComment(paramVO);
		List<CommentVO> commentList = commService.getCommentList(comm_no);
		return commentList;
	}

	/**
	 * 댓글의 댓글 등록 
	 */
	@RequestMapping("registerReply.do")
	@ResponseBody
	public List<CommentVO> registerReply(HttpServletRequest request, ReplyVO paramVO){
		HttpSession session = request.getSession(false);
		int commentNo = Integer.parseInt(request.getParameter("comment_no"));
		int commNo = Integer.parseInt(request.getParameter("comm_no"));
		
		MemberVO mvo = null;
		if(session!=null || session.getAttribute("mvo")!=null){
			mvo = (MemberVO) session.getAttribute("mvo");
		}
		ReplyVO replyVO = new ReplyVO(new CommentVO(commentNo,new CommunityVO(commNo)),mvo,paramVO.getContent());
		commService.registerReply(replyVO);
//		System.out.println("[controller-registerReply]"+replyVO);
		
		return commService.getCommentList(replyVO.getCommentVO().getCommunityVO().getComm_no());
	}
	/**
	 * 댓글의 댓글 삭제 
	 */
	@RequestMapping("deleteReply.do")
	@ResponseBody
	public void deleteReply(int reply_no){
		commService.deleteReply(reply_no);
	}
	
	/**
	 * 댓글의 댓글 수정 
	 */
	@RequestMapping("updateReply.do")
	@ResponseBody
	public List<CommentVO> updateReply(ReplyVO paramVO, int comm_no){
		int result = commService.updateReply(paramVO);
		return commService.getCommentList(comm_no);
	}
}
