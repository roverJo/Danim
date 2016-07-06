package org.kosta.finalproject.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.notice.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;	
	
	@Override
	public void write(NoticeVO nvo){
		sqlSessionTemplate.insert("notice.write",nvo);
	}			
	
	@Override
	public List<NoticeVO> getNoticeList(String pageNo){
		return sqlSessionTemplate.selectList("notice.getNoticeList", pageNo);
	}
	
	@Override
	public NoticeVO content(int noticeno){
		return (NoticeVO)sqlSessionTemplate.selectOne("notice.content",noticeno);
	}
	
	@Override
	public void deleteNotice(int noticeno){
		sqlSessionTemplate.delete("notice.deleteNotice", noticeno);
	}
	
	@Override
	public void updateNotice(NoticeVO nvo){
		sqlSessionTemplate.update("notice.updateNotice", nvo);
	}
	
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("notice.totalContent");
	}


	public List<NoticeVO> getNoticeList(HashMap<String, Integer> pagingConfig) {
	return sqlSessionTemplate.selectList("notice.getNoticeList", pagingConfig);
		
	}
}
