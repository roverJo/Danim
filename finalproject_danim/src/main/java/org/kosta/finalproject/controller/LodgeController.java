package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeCmtVO;
import org.kosta.finalproject.model.vo.lodge.LodgeListVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LodgeController {
	@Resource
	private LodgeService lodgeService;
	//지역 검색
	@RequestMapping("searchAreaLodge.do")
	@ResponseBody
	public List<AreaVO> searchArea()	{
		List<AreaVO> areaList = (List<AreaVO>) lodgeService.searchArea();
		return areaList;
	}
	//세부지역 검색
		@RequestMapping("searchLodgeDetailArea.do")
		@ResponseBody
		public List<DetailAreaVO> searchDetailArea(String area_name){			
			List<DetailAreaVO> detailAreaList=(List<DetailAreaVO>) lodgeService.searchDetailArea(area_name);
			return detailAreaList;
		}
	
	@RequestMapping("showlodge.do")
	public ModelAndView showlodge(HttpServletRequest request,int no){
		/*List<LodgeVO> list=lodgeService.showlodge(no);*/
		/*List<String> rlist=lodgeService.lodgeNo();
		request.setAttribute("rlist", rlist);*/
		lodgeService.updateHits(no);
		return new ModelAndView("redirect:showlodgeInfo.do?no="+no);
	}
	
	@RequestMapping("showlodgeInfo.do")
	public ModelAndView showlodgeInfo(int no)
	{
		List<LodgeVO> list=lodgeService.showlodge(no);	
		List<LodgeCmtVO> cmtList=lodgeService.getCommentList(no);
		ModelAndView mv=new ModelAndView("lodge_lodge_result","list",list);
		mv.addObject("cmtList",cmtList);
		return mv;
	}
	
	@RequestMapping("searchLodgeByNameAndKind.do")
	public ModelAndView searchLodgeByNameAndKind(LodgeVO vo,String pageNo){	
		//System.out.println("vvvvv"+vo);
		LodgeListVO lodgeListVO = lodgeService.searchLodgeByNameAndKind(vo,pageNo);
		//System.out.println(lodgeListVO);
		return new ModelAndView("lodge_searchLodge","list",lodgeListVO);
	}
	
	/*한줄평추가*/
	@RequestMapping("registerCmt.do")
	@ResponseBody
	public List<LodgeCmtVO> registerCmt(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		int cmtNo = Integer.parseInt(request.getParameter("lodge_no"));
//		System.out.println(cmtNo);
		LodgeCmtVO lodgeCmtVO = new LodgeCmtVO();
		MemberVO mvo = null;
		if(session!=null || session.getAttribute("mvo")!=null){
			mvo = (MemberVO) session.getAttribute("mvo");
			lodgeCmtVO.setMemberVO(mvo);
		}
		lodgeCmtVO.setLodgeVO(new LodgeVO(cmtNo));
		lodgeCmtVO.setContent(request.getParameter("cmt"));
		lodgeService.registerCmt(lodgeCmtVO);
		return lodgeService.getCommentList(cmtNo);
	}
	@RequestMapping("deleteCmt.do")
	@ResponseBody
	public void deleteComment(int lodgecmt_no){
		lodgeService.deleteComment(lodgecmt_no);
	}

	@RequestMapping("updateCmt.do")
	@ResponseBody
	public List<LodgeCmtVO> updateComment(LodgeCmtVO paramVO,String lodge_no){
		paramVO.setLodgeVO(new LodgeVO(Integer.parseInt(lodge_no)));
		List<LodgeCmtVO> list = lodgeService.updateComment(paramVO);
		return list;
	}
}
