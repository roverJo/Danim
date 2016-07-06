package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.StationVO;
import org.kosta.finalproject.model.vo.traffic.TerminalVO;

import org.kosta.finalproject.model.vo.traffic.TrafficVO;

import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrafficController 
{
	@Resource
	private TrafficService trafficService;
	
	@RequestMapping("searchArea.do")
	@ResponseBody
	public ArrayList<AreaVO> searchArea()
	{
		ArrayList<AreaVO> areaList = (ArrayList<AreaVO>) trafficService.searchArea();
		return areaList;
	}
	
	@RequestMapping("searchTerminal.do")
	@ResponseBody
	public ArrayList<TerminalVO> searchTerminal(String area_name)
	{
		ArrayList<TerminalVO> terminalList = (ArrayList<TerminalVO>) trafficService.searchTerminal(area_name);
		return terminalList;
	}
	
	@RequestMapping("searchStation.do")
	@ResponseBody
	public ArrayList<StationVO> searchStation(String area_name)
	{
		ArrayList<StationVO> stationList = (ArrayList<StationVO>) trafficService.searchStation(area_name);
		return stationList;
	}
	
	@RequestMapping("searchEndAreaByTer.do")
	@ResponseBody
	public ArrayList<String> searchEndAreaByTer(String terminalName)
	{
		ArrayList<String> endAreaList = (ArrayList<String>) trafficService.searchEndAreaByTer(terminalName);
		return endAreaList;
	}
	
	@RequestMapping("searchEndAreaBySta.do")
	@ResponseBody
	public ArrayList<String> searchEndAreaBySta(String stationName)
	{
		ArrayList<String> endAreaList = (ArrayList<String>) trafficService.searchEndAreaBySta(stationName);
		return endAreaList;
	}
	
	@RequestMapping("searchTraffic.do")
	@ResponseBody
	public TrafficVO searchTraffic(String kind,TerminalVO terminalVO,StationVO stationVO,BusVO busVO,TrainVO trainVO)
	{
		TrafficVO trafficVO = new TrafficVO();
		if(kind.equals("버스"))
		{
			busVO.setTerminalVO(terminalVO);
			ArrayList<BusVO> busList = (ArrayList<BusVO>) trafficService.getBusList(busVO);
			trafficVO.setBusList(busList);
		}
		else if(kind.equals("기차"))
		{
			trainVO.setStationVO(stationVO);
			ArrayList<TrainVO> trainList = (ArrayList<TrainVO>) trafficService.getTrainList(trainVO);
			trafficVO.setTrainList(trainList);
		}
		
		return trafficVO;
	}
	
	//로그인 상태면 false
	//로그아웃 상태면 true
	@RequestMapping("chkLogging.do")
	@ResponseBody
	public boolean chkLogging(HttpServletRequest request)
	{
		Boolean flag = false;
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");
		if(memberVO == null)
		{
			flag = true;
		}
		return flag;
	}
	
}
