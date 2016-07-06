package org.kosta.finalproject.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.MemberService;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,HttpServletResponse response,MemberVO vo){
		HttpSession session=request.getSession(false);
		
		
		MemberVO mvo=memberService.loginCheck(vo);
		if(mvo!=null)
		{
			session.setAttribute("mvo", mvo);
			if(mvo.getAdmin()>=1)
			{
				return "admin_admin_login";
			}
			else
			{
				String url= request.getHeader("referer");
				if(url != null)
				{
					if(url.substring(url.lastIndexOf("/") + 1).equals("logout.do"))
					{
						return "home";
					}
					
					try 
					{
						response.sendRedirect(url);
					} 
					catch (IOException e)
					{
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return "home";
			}			
		}
		return "member_login_result";
	}
	@RequestMapping("login_logout.do")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession();
		int admin = ((MemberVO)session.getAttribute("mvo")).getAdmin();
		String url= request.getHeader("referer");
		if(session!=null)
		{
			session.invalidate();
		}
		if(url != null && admin == 0)
		{
			System.out.println(url);
			return new ModelAndView("redirect:"+url);
		}
		return new ModelAndView("home");
	}
	@RequestMapping("inregi.do")
	public ModelAndView innerRegister(){
		List<AreaVO> alist=memberService.searchArea();
		return new ModelAndView("member_register","area",alist);
	}
	@RequestMapping("findJSONId.do")
	@ResponseBody
	public int findIdCheck(String id){
		MemberVO vo=memberService.findMemberById(id);
		int val=0;
		if(vo!=null){
			val=1;
		}
		return val;
	}
	@RequestMapping("findJSONNick.do")
	@ResponseBody
	public int findNickCheck(String nick){
		MemberVO vo=memberService.findMemberByNick(nick);
		int val=0;
		if(vo!=null){
			val=1;
		}
		return val;
	}
	@RequestMapping(value="register.do", method = RequestMethod.POST)
	public String registerMember(MemberVO	vo){
		memberService.registerMember(vo);
		return "member_register_result";
	}
	@RequestMapping("login_update.do")
	public ModelAndView update(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		List<AreaVO> alist=memberService.searchArea();
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		if(mvo==null){
			return mv;
		}else
		mv.setViewName("member_update");
		mv.addObject("area", alist);
		mv.addObject("mvo", mvo);
		return mv;
	}
	@RequestMapping("login_findJSONUpadteNick.do")
	@ResponseBody
	public int findUpdateNickCheck(HttpServletRequest request,String nick){
		HttpSession session=request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("mvo");
		int val=1;
		String myNick=memberService.findUpdateNickCheck(nick);
		if(myNick==null||vo.getNickname().equals(myNick)){
			val=0;
		}
		return val;
	}
	@RequestMapping(value="login_updateResult.do", method = RequestMethod.POST)
	public String updateResult(HttpServletRequest request,MemberVO vo){
		HttpSession session = request.getSession(false);
		//관리자 정보수정시 관리자페이지 보여주기 위해 admin값을 따로 주입
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		vo.setAdmin(mvo.getAdmin());
		
		memberService.updateMember(vo);
		session.setAttribute("mvo", vo);
//		System.out.println(vo);
		return "member_update_result";
	}
	@RequestMapping("login_member_updateCheck.do")
	public String moveUpdate(){
		return "member_update_check";
	}
	@RequestMapping(value="member_updateCheckPass.do", method = RequestMethod.POST)
	public String checkPassword(HttpServletRequest request,String password){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		MemberVO vo = new MemberVO();
		vo.setId(mvo.getId());
		vo.setPassword(password);
		int check=memberService.checkPassword(vo);
		
		if(check==0){
			return "member_update_fail";
		}else{
			return "redirect:login_update.do";
		}
	}
	
}
