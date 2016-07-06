package org.kosta.finalproject.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.LodgeDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeAndParamMapVO;
import org.kosta.finalproject.model.vo.lodge.LodgeCmtVO;
import org.kosta.finalproject.model.vo.lodge.LodgeListVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.stereotype.Service;

@Service
public class LodgeServiceImpl implements LodgeService {
	
	@Resource
	private LodgeDAO lodgeDAO;
	@Resource(name="pagingConfigLodge")
	private Map<String,Integer> pagingConfigLodge; 
	
	@Override
	public List<LodgeVO> showlodge(int no) 
	{
		return lodgeDAO.showlodge(no);
	}
	@Override
	public List<String> lodgeNo() {
		return lodgeDAO.lodgeNo();
	}
	@Override
	public List<AreaVO> searchArea() {
		return lodgeDAO.searchArea();
	}
	@Override
	public List<DetailAreaVO> searchDetailArea(String area_name) {
		return lodgeDAO.searchDetailArea(area_name);
	}
	@Override
	public LodgeListVO searchLodgeByNameAndKind(LodgeVO vo,String pageNo){			
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);		
		return searchLodgeByNameAndKind(vo,pno);
	}
	
	@Override
	public LodgeListVO searchLodgeByNameAndKind(LodgeVO vo,int pageNo) 
	{
		List<LodgeVO> list = lodgeDAO.searchLodgeByNameAndKind(new LodgeAndParamMapVO(vo,pageNo,pagingConfigLodge.get("numberOfContent")));
		int total=lodgeDAO.totalLodge(vo);
//		System.out.println(total);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigLodge);
		LodgeListVO lvo=new LodgeListVO(list,paging);
		return lvo;
	}
	@Override
	public LodgeVO getLodgeInfo(int lodge_no) 
	{
		// TODO Auto-generated method stub
		return lodgeDAO.getLodgeInfo(lodge_no);
	}
	@Override
	public List<LodgePictureVO> getLodgePicture(String lodge_no) {
		return lodgeDAO.getLodgePicture(lodge_no);
	}
	@Override
	public List<LodgeVO> lodgetop5list(){
		return lodgeDAO.lodgetop5list();
	}
	public List<LodgeVO> allFindLodge(){
		return lodgeDAO.allFindLodge();
	}
	public void lodgeRegister(LodgeVO lodgeVO){
		lodgeDAO.lodgeRegister(lodgeVO);
	}
	public LodgeVO lodgefind(LodgeVO lodgeVO){
		return lodgeDAO.lodgefind(lodgeVO);
	}
	
	public List<LodgePictureVO> findLodgeAllPicture(LodgePictureVO lodgePictureVO){
		return lodgeDAO.findLodgeAllPicture(lodgePictureVO);
	}
	public void lodgeResiPic(LodgePictureVO lodgePictureVO){
		lodgeDAO.lodgeResiPic(lodgePictureVO);
	}
	public List<LodgePictureVO> lodge_findPic(int lodge_no){
		return lodgeDAO.lodge_findPic(lodge_no);
	}
	public void lodgePic_update(LodgePictureVO lodgePictureVO){
		lodgeDAO.lodgePic_update(lodgePictureVO);
	}
	public void lodgePic_ExcludePicupdate(LodgePictureVO lodgePictureVO){
		lodgeDAO.lodgePic_ExcludePicupdate(lodgePictureVO);
	}
	public void lodgeshopupdate(LodgeVO lodgeVO){
		lodgeDAO.lodgeshopupdate(lodgeVO);
	}
	@Override
	public void updateHits(int no) 
	{
		// TODO Auto-generated method stub
		lodgeDAO.updateHits(no);
	}
	//전체 리스트에서 검색한 문자가 포함된 숙박 리스트를 뽑는다.
	public List<LodgeVO> totalSearchLodgeshop(String totalSearch){
		List<LodgeVO> list=lodgeDAO.totalSearchLodgeshop(totalSearch);
		ArrayList<LodgeVO> slist=new ArrayList<LodgeVO>();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getArea_name().contains(totalSearch)||list.get(i).getDetailarea_name().contains(totalSearch)||
					list.get(i).getLocal_area().contains(totalSearch)||list.get(i).getLodgetype().contains(totalSearch)||
					list.get(i).getShopname().contains(totalSearch)){
				slist.add(list.get(i));
			}
		}
		return slist;
	}
	
	@Override
	public List<LodgeVO> searchLodgeshop(SearchVO svo){
		return lodgeDAO.searchLodgeshop(svo);
	}
	
	/*한줄평추가*/
	@Override
	public List<LodgeCmtVO> getCommentList(int no) {
		return lodgeDAO.getCommentList(no);
	}
	@Override
	public void registerCmt(LodgeCmtVO lodgeCmtVO) {
		lodgeDAO.registerCmt(lodgeCmtVO);
	}
	@Override
	public void deleteComment(int lodgecmt_no) {
		lodgeDAO.deleteComment(lodgecmt_no);		
	}
	@Override
	public List<LodgeCmtVO> updateComment(LodgeCmtVO paramVO) {
		int lodge_no = paramVO.getLodgeVO().getLodge_no();
		lodgeDAO.updateComment(paramVO);
		List<LodgeCmtVO> list = lodgeDAO.getCommentList(lodge_no);		
		return list;
	}
}
