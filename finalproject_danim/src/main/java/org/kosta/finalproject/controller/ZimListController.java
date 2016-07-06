package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.TrafficVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZimListController 
{
	@Resource
	private TrafficService trafficService;
	@Resource
	private LodgeService lodgeService;
	@Resource
	private BestFoodService bestFoodService;
	
	@RequestMapping("login_zimList.do")
	public String getZimList()
	{
		return "zim_list";
	}
	//교통 타입 체크
	//세션방식
	@RequestMapping("login_checkTypeByTraffic.do")
	public ModelAndView checkTypeByTraffic(String type,String no)
	{
		//overlap
		if(type.equals("bus"))
		{
			return new ModelAndView("redirect:login_addZimListByBus.do?bus_no="+no);
		}
		else if(type.equals("train"))
		{
			return new ModelAndView("redirect:login_addZimListByTrain.do?train_no="+no);
		}
		return new ModelAndView("error");
	}
	
	//버스찜목록추가
	//세션방식
	@RequestMapping("login_addZimListByBus.do")
	public ModelAndView addZimListByBus(HttpSession session,BusVO busVO)
	{
		TrafficVO trafficVO = (TrafficVO) session.getAttribute("trafficList");
		ArrayList<BusVO> busZimList = null;
		if(trafficVO == null)
		{
			trafficVO = new TrafficVO();
			busZimList = new ArrayList<BusVO>();
		}
		else
		{
			busZimList = trafficVO.getBusList();
			if(busZimList == null)
			{
				busZimList = new ArrayList<BusVO>();
			}
			else
			{
				for(int i = 0; i < busZimList.size(); i++)
				{
					if(busZimList.get(i).getBus_no() == busVO.getBus_no())
					{
						return new ModelAndView("zim_list");
					}
				}
			}
		}	
		busVO = trafficService.getBusInfo(busVO.getBus_no());
		busZimList.add(busVO);
		trafficVO.setBusList(busZimList);
		session.setAttribute("trafficList", trafficVO);
		return new ModelAndView("zim_list");
	}
	
	//기차찜목록추가
	//세션방식
	@RequestMapping("login_addZimListByTrain.do")
	public ModelAndView addZimListByTrain(HttpSession session,TrainVO trainVO)
	{
		TrafficVO trafficVO = (TrafficVO) session.getAttribute("trafficList");
		ArrayList<TrainVO> trainZimList = null;
		if(trafficVO == null)
		{
			trafficVO = new TrafficVO();
			trainZimList = new ArrayList<TrainVO>();
		}
		else
		{
			trainZimList = trafficVO.getTrainList();
			if(trainZimList == null)
			{
				trainZimList = new ArrayList<TrainVO>();
			}
			else
			{
				for(int i = 0; i < trainZimList.size(); i++)
				{
					if(trainZimList.get(i).getTrain_no() == trainVO.getTrain_no())
					{
						return new ModelAndView("zim_list");
					}
				}
			}
		}
		trainVO = trafficService.getTrainInfo(trainVO.getTrain_no());
		trainZimList.add(trainVO);
		trafficVO.setTrainList(trainZimList);
		session.setAttribute("trafficList", trafficVO);
		return new ModelAndView("zim_list");
	}
	
	
	@RequestMapping("login_deleteTrafficZim.do")
	public ModelAndView deleteTrafficCart(HttpSession session,String[] bus_no,String[] train_no)
	{
		TrafficVO trafficVO = (TrafficVO) session.getAttribute("trafficList");
		if(bus_no != null)
		{
			ArrayList<BusVO> busList = trafficVO.getBusList();
			for(int i = 0; i < busList.size(); i++)
			{
				for(int j = 0; j < bus_no.length; j++)
				{
					if(busList.get(i).getBus_no() == Integer.parseInt(bus_no[j]))
					{
						busList.remove(i);
					}
				}
			}
			trafficVO.setBusList(busList);
		}
		
		if(train_no != null)
		{
			ArrayList<TrainVO> trainList = trafficVO.getTrainList();
			for(int i = 0; i < trainList.size(); i++)
			{
				for(int j = 0; j < train_no.length; j++)
				{
					if(trainList.get(i).getTrain_no() == Integer.parseInt(train_no[j]))
					{
						trainList.remove(i);
					}
				}
			}
			trafficVO.setTrainList(trainList);
		}
		session.setAttribute("trafficList", trafficVO);
		return new ModelAndView("redirect:zim_list.do");
	}
	
	//숙박 찜목록 추가
		//세션방식
		@RequestMapping("login_checkZimByLodge.do")
		public ModelAndView checkZimByLodge(HttpSession session, LodgeVO lvo, String lodge_no){						
			ArrayList<LodgeVO> lodgeZimList=(ArrayList<LodgeVO>) session.getAttribute("lodgeList");
			if(lodgeZimList==null){
				lodgeZimList=new ArrayList<LodgeVO>();			
			}else{
				for(int i=0;i<lodgeZimList.size();i++){
					if(lodgeZimList.get(i).getLodge_no() == lvo.getLodge_no()){
						return new ModelAndView("zim_list");
					}
				}			
			}
			List<LodgePictureVO> lodgePictureVO = lodgeService.getLodgePicture(lodge_no);	
			LodgeVO lodgeVO = lodgeService.getLodgeInfo(Integer.parseInt(lodge_no));
			lodgeVO.setLodgePictureVO(lodgePictureVO.get(0));			
			lodgeZimList.add(lodgeVO);
			session.setAttribute("lodgeList", lodgeZimList);		
			return new ModelAndView("zim_list");
		}
		@RequestMapping("login_deleteLodgeZim.do")
		public ModelAndView deleteLodgeZim(HttpSession session,String[] lodge_no){
			ArrayList<LodgeVO> lodgeList=(ArrayList<LodgeVO>) session.getAttribute("lodgeList");
			if(lodge_no!=null){		
				for(int i=0;i<lodgeList.size();i++){
					for(int j=0;j<lodge_no.length;j++){
						if(lodgeList.get(i).getLodge_no()==Integer.parseInt(lodge_no[j])){
							lodgeList.remove(i);
						}
					}
				}		
			}				
			session.setAttribute("lodgeList", lodgeList);
			return new ModelAndView("redirect:zim_list.do");
		}
		
		//음식 찜리스트
		@RequestMapping("login_checkFoodShopNo.do")
		public ModelAndView checkFoodShopNo(int foodshop_no){
			return new ModelAndView("redirect:login_addZimListByFoodShop.do?foodshop_no="+foodshop_no);
		}
		
		
		@RequestMapping("login_addZimListByFoodShop.do")
		public ModelAndView addZimListByFoodShop(HttpSession session,BestFoodVO bestFoodVO){
			//System.out.println("gggggg");
			ArrayList<BestFoodVO> bestFoodList =(ArrayList<BestFoodVO>) session.getAttribute("bestFoodList");
			if(bestFoodList == null){
				bestFoodList = new ArrayList<BestFoodVO>();
			}else{
				for(int i = 0; i < bestFoodList.size(); i++){
					if(bestFoodList.get(i).getFoodshop_no()==bestFoodVO.getFoodshop_no()){
						return new ModelAndView("zim_list");
					}
				}
			}
			//System.out.println("test: " + bestFoodList);
			bestFoodVO =(BestFoodVO) bestFoodService.getFoodInfo(bestFoodVO.getFoodshop_no());
			bestFoodList.add(bestFoodVO);
			session.setAttribute("bestFoodList", bestFoodList);
			return new ModelAndView("zim_list");
		}
		//찜리스트에서 선택한 음식점 삭제
		@RequestMapping("login_deleteFoodZim.do")
		public ModelAndView deleteTrafficZim(HttpSession session,String[] foodshop_no){
			ArrayList<BestFoodVO> bestFoodList =(ArrayList<BestFoodVO>) session.getAttribute("bestFoodList");
//			System.out.println("찜리스트 삭제");
			if(foodshop_no != null){
				for(int i = 0; i < bestFoodList.size(); i++){
					for(int j = 0; j < foodshop_no.length; j++){
						if(bestFoodList.get(i).getFoodshop_no() == Integer.parseInt(foodshop_no[j])){	
							bestFoodList.remove(i);
						}
					}
				}
			}
			session.setAttribute("bestFoodList", bestFoodList);
			return new ModelAndView("redirect:zim_list.do");
		}
		
	
}
