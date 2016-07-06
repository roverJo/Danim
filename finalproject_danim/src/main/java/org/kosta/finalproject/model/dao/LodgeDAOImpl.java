package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeAndParamMapVO;
import org.kosta.finalproject.model.vo.lodge.LodgeCmtVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LodgeDAOImpl implements LodgeDAO {
	@Resource
	private SqlSessionTemplate template;
	/*@Override
	public List<LodgeVO> lodge() {
		return template.selectList("lodge.lodge");
	}*/
	@Override
	public List<LodgeVO> showlodge(int no) {
		return template.selectList("lodge.showlodge",no);
	}
	@Override
	public List<String> lodgeNo() {
		return template.selectList("lodge.lodgeNo");
	}
	@Override
	public List<AreaVO> searchArea() {
		return template.selectList("area.searchArea");
	}
	@Override
	public List<DetailAreaVO> searchDetailArea(String area_name) {
		return template.selectList("detailarea.searchDetailArea",area_name);
	}
	@Override
	public List<LodgeVO> searchLodgeByNameAndKind(LodgeAndParamMapVO vo) {
		return template.selectList("lodge.searchLodgeByNameAndKind",vo);
	}
	@Override
	public LodgeVO getLodgeInfo(int lodge_no) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("lodge.getLodgeInfo",lodge_no);
	}
	@Override
	public List<LodgePictureVO> getLodgePicture(String lodge_no) {	
		return template.selectList("lodge.getLodgePicture",lodge_no);
	}
	@Override
	//탑리스트5 뽑아오기
	public List<LodgeVO> lodgetop5list(){
		return template.selectList("lodge.lodgetop5list");
	}
	@Override
	public int totalLodge(LodgeVO vo)
	{
		// TODO Auto-generated method stub
		return template.selectOne("lodge.totalLodge",vo);
	}
	//전체 숙박 리스트 검색
		public List<LodgeVO> allFindLodge(){
			return template.selectList("lodge.allFindLodge");
		}
		//숙박 등록
		public void lodgeRegister(LodgeVO lodgeVO){
			template.insert("lodge.lodgeRegister",lodgeVO);
		}
		//숙박 검색
		public LodgeVO lodgefind(LodgeVO lodgeVO){
			return template.selectOne("lodge.lodgefind",lodgeVO);
		}
		//속한 숙박의 사진 갯수 찾기
		public List<LodgePictureVO> findLodgeAllPicture(LodgePictureVO lodgePictureVO){
			return template.selectList("lodge.findLodgeAllPicture",lodgePictureVO);
		}
		//숙박 사진 등록(1개 업로드)
		public void lodgeResiPic(LodgePictureVO lodgePictureVO){
			template.insert("lodge.lodgeResiPic",lodgePictureVO);
		}
		//숙박 pk에 따른 사진 값들 찾아오기
		public List<LodgePictureVO> lodge_findPic(int lodge_no){
			return template.selectList("lodge.lodge_findPic",lodge_no);
		}
		//사진 값들 업데이트
		public void lodgePic_update(LodgePictureVO lodgePictureVO){
			template.update("lodge.lodgePic_update",lodgePictureVO);
		}
		public void lodgePic_ExcludePicupdate(LodgePictureVO lodgePictureVO){
			template.update("lodge.lodgePic_ExcludePicupdate",lodgePictureVO);
		}
		//숙박 업데이트
		public void lodgeshopupdate(LodgeVO lodgeVO){
			template.update("lodge.lodgeshopupdate",lodgeVO);
		}
		@Override
		public void updateHits(int no)
		{
			// TODO Auto-generated method stub
			template.update("lodge.updateHits",no);
		}
		//통합 검색()
		public List<LodgeVO> totalSearchLodgeshop(String totalSearch){
			return template.selectList("lodge.totalSearchLodgeshop",totalSearch);
		}
		
		@Override
		public List<LodgeVO> searchLodgeshop(SearchVO svo){
			return template.selectList("lodge.searchLodgeShop",svo);
		}
		
		/*한줄평추가*/
		@Override
		public List<LodgeCmtVO> getCommentList(int no) {
			return template.selectList("lodge.getCommentList",no);
		}
		@Override
		public void registerCmt(LodgeCmtVO lodgeCmtVO) {
			template.	insert("lodge.registerCmt",lodgeCmtVO);
		}
		@Override
		public void deleteComment(int lodgecmt_no) {
			template.delete("lodge.deleteComment",lodgecmt_no);			
		}
		@Override
		public int updateComment(LodgeCmtVO paramVO) {
			return template.update("lodge.updateComment",paramVO);
		}
}
