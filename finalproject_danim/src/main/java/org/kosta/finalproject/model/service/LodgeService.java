package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeCmtVO;
import org.kosta.finalproject.model.vo.lodge.LodgeListVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;

public interface LodgeService {
//	List<LodgeVO> lodge();
	List<LodgeVO> showlodge(int no);
	List<String> lodgeNo();
	List<AreaVO> searchArea();
	List<DetailAreaVO> searchDetailArea(String area_name);
	LodgeListVO searchLodgeByNameAndKind(LodgeVO vo, String pageNo);
	LodgeListVO searchLodgeByNameAndKind(LodgeVO vo,int pageNo); 
	LodgeVO getLodgeInfo(int lodge_no);
	List<LodgePictureVO> getLodgePicture(String lodge_no);
	public List<LodgeVO> lodgetop5list();
	public List<LodgeVO> allFindLodge();
	public void lodgeRegister(LodgeVO lodgeVO);
	public LodgeVO lodgefind(LodgeVO lodgeVO);
	public List<LodgePictureVO> findLodgeAllPicture(LodgePictureVO lodgePictureVO);
	public void lodgeResiPic(LodgePictureVO lodgePictureVO);
	public List<LodgePictureVO> lodge_findPic(int lodge_no);
	public void lodgePic_update(LodgePictureVO lodgePictureVO);
	public void lodgePic_ExcludePicupdate(LodgePictureVO lodgePictureVO);
	public void lodgeshopupdate(LodgeVO lodgeVO);
	void updateHits(int no);
	public List<LodgeVO> totalSearchLodgeshop(String totalSearch);
	public List<LodgeVO> searchLodgeshop(SearchVO svo);
	List<LodgeCmtVO> getCommentList(int no);
	void registerCmt(LodgeCmtVO lodgeCmtVO);
	void deleteComment(int lodgecmt_no);
	List<LodgeCmtVO> updateComment(LodgeCmtVO paramVO);
}
