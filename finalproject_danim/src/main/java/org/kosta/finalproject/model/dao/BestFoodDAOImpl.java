package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodAndParamMapVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.FoodCmtVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BestFoodDAOImpl implements BestFoodDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<AreaVO> searchArea() 
	{
		return template.selectList("area.searchArea");
	}
	
	public List<DetailAreaVO> searchDetailArea(String area_name){
		return template.selectList("detailarea.searchDetailArea",area_name);
	}
	//모든 음식점 검색
	public List<BestFoodVO> allFoodShop(){
		return template.selectList("bestfood.allFoodShop");
	}
	
	//음식타입을 '전체'로 하였을 경우 사용
	public List<BestFoodVO> searchAllBestFood(BestFoodVO bestFoodVO){
		return template.selectList("bestfood.searchAllBestFood",bestFoodVO);
	}
	
	public List<MenuVO> detailFood(int foodshop_no){
		return template.selectList("menu.detailFood",foodshop_no);
	}
	//조회수 추가
	public void updateHits(int foodshop_no){
//		System.out.println("업데이트힛");
		template.update("bestfood.updateHits",foodshop_no);
	}
	//조회수 초기화
	public void resetHits(){
		template.update("bestfood.resetHits");
	}
	
	//탑리스트5 뽑아오기
	public List<BestFoodVO> foodtop5list(){
		return template.selectList("bestfood.foodtop5list");
	}
	
	public BestFoodVO getFoodInfo(int foodshop_no){
		return template.selectOne("bestfood.getFoodInfo",foodshop_no);
	}
	//음식점 등록
	public void foodShopRegister(BestFoodVO bestFoodVO){
		template.insert("bestfood.foodShopRegister",bestFoodVO);
	}
	//음식점 찾기(가게명,지역,상세지역)
	public BestFoodVO foodshopfind(BestFoodVO bestFoodVO){
		return template.selectOne("bestfood.foodshopfind",bestFoodVO);
	}
	//음식점 찾기(가게pk)
	public BestFoodVO foodShopFindByNo(int foodshop_no){
		return template.selectOne("bestfood.foodShopFindByNo",foodshop_no);
	}
	
	//메뉴 등록
	public void foodMenuRegister(MenuVO menuVO){
		template.insert("menu.foodMenuRegister",menuVO);
	}
	
	//메뉴 등록시 들어간 메뉴 파악
	public List<MenuVO> findMenu(int foodshop_no){
		return template.selectList("menu.findMenu",foodshop_no);
	}

	@Override
	public List<BestFoodVO> searchBestFood(
			BestFoodAndParamMapVO bestFoodAndParamMapVO) 
	{
		// TODO Auto-generated method stub
		return template.selectList("bestfood.searchBestFood",bestFoodAndParamMapVO);
	}

	@Override
	public int totalFoodByFoodType(BestFoodVO bestFoodVO) {
		// TODO Auto-generated method stub
		return template.selectOne("bestfood.totalFoodByFoodType",bestFoodVO);
	}

	@Override
	public List<BestFoodVO> searchAllBestFood(
			BestFoodAndParamMapVO bestFoodAndParamMapVO)
	{
		// TODO Auto-generated method stub
		return template.selectList("bestfood.searchAllBestFood",bestFoodAndParamMapVO);
	}

	@Override
	public int totalFood(BestFoodVO bestFoodVO) {
		// TODO Auto-generated method stub
		return template.selectOne("bestfood.totalFood",bestFoodVO);
	}
	//메뉴 업데이트
	public void menuUpdate(MenuVO menuVO){
		template.update("menu.menuUpdate",menuVO);
	}
	//사진을 제외한 업데이트
	public void menuUpdateExcludePicture(MenuVO menuVO){
		template.update("menu.menuUpdateExcludePicture",menuVO);
	}
	//음식점 수정
	public void foodshopupdate(BestFoodVO bestFoodVO){
		template.update("bestfood.foodshopupdate",bestFoodVO);
	}
	//음식점 수정2 사진없는 음식점 수정
	public void foodshopupdateExcludePic(BestFoodVO bestFoodVO){
		template.update("bestfood.foodshopupdateExcludePic",bestFoodVO);
	}
	
	public List<BestFoodVO> totalSearchFoodshop(String totalSearch){
		return template.selectList("bestfood.totalSearchFoodshop",totalSearch);
	}
	
	@Override
	public List<BestFoodVO> searchFoodshop(SearchVO svo){
		return template.selectList("bestfood.searchFoodshop",svo);
	}	
	
	/*한줄평추가*/
	@Override
	public List<FoodCmtVO> getCommentList(int foodshop_no) {
		return template.selectList("bestfood.getCommentList",foodshop_no);
	}

	@Override
	public void registerCmt(FoodCmtVO foodCmtVO) {
		template.insert("bestfood.registerCmt",foodCmtVO);		
	}

	@Override
	public void deleteComment(int foodcmt_no) {
		template.delete("bestfood.deleteComment",foodcmt_no);
		
	}

	@Override
	public int updateComment(FoodCmtVO paramVO) {
		return template.update("bestfood.updateComment",paramVO);
		
	}
}
