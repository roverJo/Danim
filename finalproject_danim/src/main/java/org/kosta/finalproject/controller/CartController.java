package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.service.CartService;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.cart.CartListVO;
import org.kosta.finalproject.model.vo.cart.CartVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController 
{
	@Resource
	private CartService cartService;
	@Resource
	private TrafficService trafficService;
	@Resource
	private BestFoodService bestFoodService;
	@Resource
	private LodgeService lodgeService;
	
	@RequestMapping("login_cartList.do")
	public ModelAndView getCartList(HttpSession session,String pageNo)
	{
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");
		
		CartListVO cartListVO = cartService.getCartList(pageNo,memberVO);
		
		ArrayList<CartVO> cartList = (ArrayList<CartVO>) cartListVO.getCartList();
		
		for(int i = 0; i < cartList.size(); i++)
		{
			int totalPrice = 0;
			if(cartList.get(i).getBusVO() != null)
			{
				totalPrice += cartList.get(i).getBusVO().getPrice();
			}
			
			if(cartList.get(i).getTrainVO() != null)
			{
				totalPrice += cartList.get(i).getTrainVO().getPrice();
			}
			
			if(cartList.get(i).getBestFoodVO() != null)
			{
				totalPrice += cartList.get(i).getBestFoodVO().getMain_price();
			}
			
			if(cartList.get(i).getLodgeVO() != null)
			{
				totalPrice += cartList.get(i).getLodgeVO().getPrice();
			}
			cartList.get(i).setTotalPrice(totalPrice);
		}
//		System.out.println(cartListVO);
		
		return new ModelAndView("cart_list","cartListVO",cartListVO);
	}
	
	@RequestMapping("login_cartInsert.do")
	public ModelAndView cartInsert(HttpSession session,CartVO cartVO,String traffic_no,String foodshop_no,String lodge_no)
	{
//		System.out.println("CartVO : "+cartVO);
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");
		cartVO.setMemberVO(memberVO);
		
		if(traffic_no.equals("") == false)
		{
			String type = traffic_no.substring(0,traffic_no.lastIndexOf("/"));
			traffic_no = traffic_no.substring(traffic_no.lastIndexOf("/") + 1);
			if(type.equals("bus"))
			{
				cartVO.setBusVO(new BusVO(Integer.parseInt(traffic_no)));
			}
			else if(type.equals("train"))
			{
				cartVO.setTrainVO(new TrainVO(Integer.parseInt(traffic_no)));
			}
		}
		
		if(lodge_no.equals("") == false)
		{
			cartVO.setLodgeVO(new LodgeVO(Integer.parseInt(lodge_no)));
		}
		
		if(foodshop_no.equals("") == false)
		{
			cartVO.setBestFoodVO(new BestFoodVO(Integer.parseInt(foodshop_no)));
		}
		
		cartService.cartInsert(cartVO);
		
		return new ModelAndView("redirect:login_cartList.do");
	}
	
	@RequestMapping("cartDetailInfoByBus.do")
	@ResponseBody
	public BusVO cartDetailInfoByBus(String bus_no)
	{
		//System.out.println(bus_no);
		BusVO busVO = trafficService.getBusInfo(Integer.parseInt(bus_no));
		return busVO;
	}
	
	@RequestMapping("cartDetailInfoByTrain.do")
	@ResponseBody
	public TrainVO cartDetailInfoByTrain(String train_no)
	{
		//System.out.println(bus_no);
		TrainVO trainVO = trafficService.getTrainInfo(Integer.parseInt(train_no));
		return trainVO;
	}
	
	@RequestMapping("cartDetailInfoByLodge.do")
	@ResponseBody
	public List<LodgeVO> cartDetailInfoByLodge(HttpServletRequest request,String lodge_no)
	{
		List<LodgeVO> list=lodgeService.showlodge(Integer.parseInt(lodge_no));
		List<String> rlist=lodgeService.lodgeNo();
		request.setAttribute("rlist", rlist);
		return list;
	}
	
	@RequestMapping("cartDetailInfoByFood.do")
	@ResponseBody
	public List<MenuVO> cartDetailInfoByFood(String foodshop_no)
	{
		List<MenuVO> detailFoodList=bestFoodService.detailFood(Integer.parseInt(foodshop_no));
//		System.out.println("food: "+detailFoodList);
		return detailFoodList;
	}
	
	
}
