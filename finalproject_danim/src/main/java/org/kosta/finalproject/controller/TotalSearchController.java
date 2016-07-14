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
	public ModelAndView totalSearch(String totalSearch, String busNum, String trainNum, String lodgeNum, String foodNum){
		int bus=10;
		int train=10;
		int lodge=4;
		int food=4;
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
		if(foodNum!=null){
			food = Integer.parseInt(foodNum);
			if(food==0){
				food=4;
			}
		}
		if(lodgeNum!=null){
			lodge = Integer.parseInt(lodgeNum);
			if(lodge==0){
				lodge=4;
			}
		}
		
		ModelAndView mv=new ModelAndView();
		/* 숙박 & 음식 */
		List<BestFoodVO> testFood=bestFoodService.totalSearchFoodshop(totalSearch);
		List<BestFoodVO> searchFoodList=bestFoodService.searchFoodshop(new SearchVO(food, totalSearch));

		List<LodgeVO> test=lodgeService.totalSearchLodgeshop(totalSearch);
		List<LodgeVO> searchLodgeList=lodgeService.searchLodgeshop(new SearchVO(lodge, totalSearch));

		/* 교통 */
		List<BusVO> searchBusList=trafficService.totalSearchBus(new SearchVO(bus, totalSearch));
		int busSize = trafficService.countBusList(totalSearch);

		List<TrainVO> searchTrainList=trafficService.totalSearchTrain(new SearchVO(train, totalSearch));
		List<TrainVO> testTrain=trafficService.totalSearchTrainTest(totalSearch);

		mv.setViewName("total_totalSearchResult");
		/* 숙박 & 음식 */
		mv.addObject("foodList",searchFoodList);
		mv.addObject("lodgeList",searchLodgeList);
		mv.addObject("test",test);
		mv.addObject("testFood",testFood);
		
		/* 교통 */
		mv.addObject("busList",searchBusList);
		mv.addObject("busSize",busSize);
		mv.addObject("trainList",searchTrainList);
		mv.addObject("testTrain",testTrain);

		return mv;
	}
}
