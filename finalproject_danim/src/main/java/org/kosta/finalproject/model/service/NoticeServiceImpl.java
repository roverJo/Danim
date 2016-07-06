package org.kosta.finalproject.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.NoticeDAO;
import org.kosta.finalproject.model.vo.notice.NoticeListVO;
import org.kosta.finalproject.model.vo.notice.NoticePagingBean;
import org.kosta.finalproject.model.vo.notice.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Resource(name="noticeDAOImpl")
	private NoticeDAO noticeDAO;
	
	@Resource(name="pagingConfig")
	private Map<String,Integer> pagingConfig;
	
	@Override
	public void write(NoticeVO noticeVO){
		noticeDAO.write(noticeVO);
	}	

	@Override
	public NoticeListVO getNoticeList(String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		return getNoticeList(Integer.parseInt(pageNo));
	}
	
	@Override
	public NoticeListVO getNoticeList(int pageNo){
		HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("pageNo", pageNo);
		paramMap.put("numberOfContent", pagingConfig.get("numberOfContent"));
		List<NoticeVO> list=noticeDAO.getNoticeList(paramMap);
		int total=noticeDAO.totalContent();
		NoticePagingBean paging=new NoticePagingBean(total,pageNo,pagingConfig);
		NoticeListVO lvo=new NoticeListVO(list,paging);
//		System.out.println(noticeDAO.getNoticeList(paramMap));
		return lvo;
	}

	@Override
	public NoticeListVO getNoticeList(){
		return getNoticeList(1);
	}

	@Override
	public NoticeVO content(int noticeno){
		return noticeDAO.content(noticeno);
	}
	
	@Override
	public void deleteNotice(int noticeno){
		noticeDAO.deleteNotice(noticeno);
	}

	@Override
	public void updateNotice(NoticeVO noticeVO){
		noticeDAO.updateNotice(noticeVO);
	}

}
