package org.kosta.finalproject.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.finalproject.model.vo.notice.NoticeVO;

public interface NoticeDAO {

	public void write(NoticeVO nvo);

	public abstract List<NoticeVO> getNoticeList(String pageNo);

	public abstract NoticeVO content(int noticeno);

	public abstract void deleteNotice(int noticeno);

	public abstract void updateNotice(NoticeVO noticeVO);

	public abstract int totalContent();

	List<NoticeVO> getNoticeList(HashMap<String, Integer> pagingConfig);

}