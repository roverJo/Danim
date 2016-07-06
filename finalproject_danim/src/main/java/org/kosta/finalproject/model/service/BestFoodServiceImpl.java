package org.kosta.finalproject.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.BestFoodDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodAndParamMapVO;
import org.kosta.finalproject.model.vo.food.BestFoodListVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.FoodCmtVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.springframework.stereotype.Service;

@Service
public class BestFoodServiceImpl implements BestFoodService {
	@Resource
	private BestFoodDAO bestFoodDAO;

	@Resource(name="pagingConfigFood")
	private Map<String,Integer> pagingConfigFood; 

	@Override
	public List<AreaVO> searchArea() 
	{
		return bestFoodDAO.searchArea();
	}
	public List<DetailAreaVO> searchDetailArea(String area_name){
		return bestFoodDAO.searchDetailArea(area_name);
	}
	public BestFoodListVO searchBestFood(BestFoodVO bestFoodVO,String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);	
		return searchBestFood(bestFoodVO,pno);
	}

	public BestFoodListVO searchBestFood(BestFoodVO bestFoodVO, int pageNo) 
	{
		List<BestFoodVO> list = bestFoodDAO.searchBestFood(new BestFoodAndParamMapVO(bestFoodVO,pageNo,pagingConfigFood.get("numberOfContent")));
		int total=bestFoodDAO.totalFoodByFoodType(bestFoodVO);
//		System.out.println(total);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigFood);
		BestFoodListVO lvo=new BestFoodListVO(list,paging);
		return lvo;
	}
	public BestFoodListVO searchAllBestFood(BestFoodVO bestFoodVO,String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);	
		return searchAllBestFood(bestFoodVO,pno);
	}

	public BestFoodListVO searchAllBestFood(BestFoodVO bestFoodVO, int pageNo) 
	{
		List<BestFoodVO> list = bestFoodDAO.searchAllBestFood(new BestFoodAndParamMapVO(bestFoodVO,pageNo,pagingConfigFood.get("numberOfContent")));
		int total=bestFoodDAO.totalFood(bestFoodVO);
//		System.out.println(total);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigFood);
		BestFoodListVO lvo=new BestFoodListVO(list,paging);
		return lvo;
	}
	public List<MenuVO> detailFood(int foodshop_no){
		return bestFoodDAO.detailFood(foodshop_no);
	}
	public void updateHits(int foodshop_no){
		bestFoodDAO.updateHits(foodshop_no);
	}
	public List<BestFoodVO> foodtop5list(){
		return bestFoodDAO.foodtop5list();
	}
	public BestFoodVO getFoodInfo(int foodshop_no){
		return bestFoodDAO.getFoodInfo(foodshop_no);
	}
	public void resetHits(){
		bestFoodDAO.resetHits();
	}
	public void foodShopRegister(BestFoodVO bestFoodVO){
		bestFoodDAO.foodShopRegister(bestFoodVO);
	}
	public List<BestFoodVO> allFoodShop(){
		return bestFoodDAO.allFoodShop();
	}
	public BestFoodVO foodshopfind(BestFoodVO bestFoodVO){
		return bestFoodDAO.foodshopfind(bestFoodVO);
	}
	public BestFoodVO foodShopFindByNo(int foodshop_no){
		return bestFoodDAO.foodShopFindByNo(foodshop_no);
	}
	public void foodMenuRegister(MenuVO menuVO){
		bestFoodDAO.foodMenuRegister(menuVO);
	}
	public List<MenuVO> findMenu(int foodshop_no){
		return bestFoodDAO.findMenu(foodshop_no);
	}
	public void menuUpdate(MenuVO menuVO){
		bestFoodDAO.menuUpdate(menuVO);
	}
	public void menuUpdateExcludePicture(MenuVO menuVO){
		bestFoodDAO.menuUpdateExcludePicture(menuVO);
	}
	public void foodshopupdate(BestFoodVO bestFoodVO){
		bestFoodDAO.foodshopupdate(bestFoodVO);
	}
	public void foodshopupdateExcludePic(BestFoodVO bestFoodVO){
		bestFoodDAO.foodshopupdateExcludePic(bestFoodVO);
	}
	// 전체 리스트에서 검색한 문자가 포함된 음식점 리스트를 뽑는다.
	public List<BestFoodVO> totalSearchFoodshop(String totalSearch){
		List<BestFoodVO> blist= bestFoodDAO.totalSearchFoodshop(totalSearch);
		ArrayList<BestFoodVO> slist=new ArrayList<BestFoodVO>();

		for(int i=0;i<blist.size();i++){
			if(blist.get(i).getShopname().contains(totalSearch)||blist.get(i).getArea_name().contains(totalSearch)||
					blist.get(i).getDetailarea_name().contains(totalSearch)||blist.get(i).getLocal_area().contains(totalSearch)||
					blist.get(i).getShop_add().contains(totalSearch)||blist.get(i).getFoodtype().contains(totalSearch)){
				slist.add(blist.get(i));
			}
		}
		return slist;
	}

	@Override
	public List<BestFoodVO> searchFoodshop(SearchVO svo){
		return bestFoodDAO.searchFoodshop(svo);
	}
	
	/*한줄평추가*/
	@Override
	public List<FoodCmtVO> getCommentList(int foodshop_no) {
		return bestFoodDAO.getCommentList(foodshop_no);
	}
	@Override
	public void registerCmt(FoodCmtVO foodCmtVO) {
		bestFoodDAO.registerCmt(foodCmtVO);		
	}
	@Override
	public void deleteComment(int foodcmt_no) {
		bestFoodDAO.deleteComment(foodcmt_no);		
	}
	@Override
	public List<FoodCmtVO> updateComment(FoodCmtVO paramVO) {
		int foodshop_no=paramVO.getBestFoodVO().getFoodshop_no();
		bestFoodDAO.updateComment(paramVO);
		List<FoodCmtVO> list=bestFoodDAO.getCommentList(foodshop_no);
		return list;
	}
}
