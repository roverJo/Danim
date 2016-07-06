package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	@Resource
	private BestFoodService bestFoodService;
	//음식 리스트 메인화면에 띄우기
	@Resource
	private LodgeService lodgeService;
	
	@RequestMapping("toplist.do")
	public ModelAndView toplist(){
		ModelAndView mv=new ModelAndView();
		List<BestFoodVO> foodlist = bestFoodService.foodtop5list();
		List<LodgeVO> lodgelist=lodgeService.lodgetop5list();
		//System.out.println(foodlist);
		mv.addObject("foodlist",foodlist);
		mv.addObject("lodgelist",lodgelist);
		mv.setViewName("topsearch_topsearch");
		return mv;
		//return new ModelAndView("topsearch_topsearch","foodlist",foodlist);
	}
}
