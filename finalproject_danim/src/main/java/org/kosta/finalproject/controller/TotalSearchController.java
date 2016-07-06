package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class TotalSearchController {
	@Resource
	private BestFoodService bestFoodService;
	@Resource
	private LodgeService lodgeService;
	@Resource
	private TrafficService trafficService;

	@RequestMapping("totalSearch.do")
	public ModelAndView totalSearch(String totalSearch, String lodgeNum, String busNum,String trainNum, String foodNum){
		int lodge=4;
		int food=4;
		int bus=10;
		int train=10;
		if(lodgeNum!=null){
			lodge = Integer.parseInt(lodgeNum);
			if(lodge==0){
				lodge=4;
			}
		}
		if(foodNum!=null){
			food = Integer.parseInt(foodNum);
			if(food==0){
				food=4;
			}
		}
		if(busNum!=null){
			bus=Integer.parseInt(busNum);
			if(bus==0){
				bus=10;
			}
		}
		if(trainNum!=null){
			train=Integer.parseInt(trainNum);
			if(train==0){
				train=10;
			}
		}
		ModelAndView mv=new ModelAndView();

		/**/
		//	    List<BestFoodVO> searchFoodList=bestFoodService.totalSearchFoodshop(totalSearch);
		List<BestFoodVO> testFood=bestFoodService.totalSearchFoodshop(totalSearch);
		List<BestFoodVO> searchFoodList=bestFoodService.searchFoodshop(new SearchVO(food, totalSearch));

		//		List<LodgeVO> searchLodgeList=lodgeService.totalSearchLodgeshop(totalSearch);
		List<LodgeVO> test=lodgeService.totalSearchLodgeshop(totalSearch);
		List<LodgeVO> searchLodgeList=lodgeService.searchLodgeshop(new SearchVO(lodge, totalSearch));
		/**/
		List<BusVO> searchBusList=trafficService.totalSearchBus(new SearchVO(bus, totalSearch));
		List<BusVO> testBus =trafficService.totalSearchBusTest(totalSearch);


		List<TrainVO> searchTrainList=trafficService.totalSearchTrain(new SearchVO(train, totalSearch));
		List<TrainVO> testTrain=trafficService.totalSearchTrainTest(totalSearch);

		mv.setViewName("total_totalSearchResult");
		/**/
		mv.addObject("foodList",searchFoodList);
		mv.addObject("lodgeList",searchLodgeList);
		mv.addObject("test",test);
		mv.addObject("testFood",testFood);
		/**/
		mv.addObject("busList",searchBusList);
		mv.addObject("testBus",testBus);
		mv.addObject("trainList",searchTrainList);
		mv.addObject("testTrain",testTrain);

		return mv;
	}

	//로그인 상태면 false
	//로그아웃 상태면 true
	@RequestMapping("total_checkLogin.do")
	@ResponseBody
	public boolean chkLogging(HttpServletRequest request){
		Boolean flag = false;
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");
		if(memberVO == null){
			flag = true;
		}
		return flag;
	}
}
