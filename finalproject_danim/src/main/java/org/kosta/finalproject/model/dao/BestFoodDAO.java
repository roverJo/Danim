package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodAndParamMapVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.FoodCmtVO;
import org.kosta.finalproject.model.vo.food.MenuVO;

public interface BestFoodDAO {

	public abstract List<AreaVO> searchArea();
	public List<DetailAreaVO> searchDetailArea(String area_name);
	public List<BestFoodVO> searchBestFood(BestFoodAndParamMapVO bestFoodAndParamMapVO);
	public List<MenuVO> detailFood(int foodshop_no);
	public List<BestFoodVO> searchAllBestFood(BestFoodAndParamMapVO bestFoodAndParamMapVO);
	public void updateHits(int foodshop_no);
	public List<BestFoodVO> foodtop5list();
	public BestFoodVO getFoodInfo(int foodshop_no);
	public void resetHits();
	public void foodShopRegister(BestFoodVO bestFoodVO);
	public List<BestFoodVO> allFoodShop();
	public BestFoodVO foodshopfind(BestFoodVO bestFoodVO);
	public BestFoodVO foodShopFindByNo(int foodshop_no);
	public void foodMenuRegister(MenuVO menuVO);
	public List<MenuVO> findMenu(int foodshop_no);
	public abstract int totalFoodByFoodType(BestFoodVO bestFoodVO);
	public abstract int totalFood(BestFoodVO bestFoodVO);
	public void menuUpdate(MenuVO menuVO);
	public void menuUpdateExcludePicture(MenuVO menuVO);
	public void foodshopupdate(BestFoodVO bestFoodVO);
	public void foodshopupdateExcludePic(BestFoodVO bestFoodVO);
	public List<BestFoodVO> totalSearchFoodshop(String totalSearch);
	public List<BestFoodVO> searchFoodshop(SearchVO svo);
	public List<FoodCmtVO> getCommentList(int foodshop_no);
	public void registerCmt(FoodCmtVO foodCmtVO);
	public void deleteComment(int foodcmt_no);
	public int updateComment(FoodCmtVO paramVO);
}