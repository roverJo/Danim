package org.kosta.finalproject.model.service;

import org.kosta.finalproject.model.vo.notice.NoticeListVO;
import org.kosta.finalproject.model.vo.notice.NoticeVO;

public interface NoticeService {

	public abstract void write(NoticeVO noticeVO);

	public abstract NoticeVO content(int noticeno);

	public abstract void deleteNotice(int noticeno);

	public abstract void updateNotice(NoticeVO noticeVO);

	public abstract NoticeListVO getNoticeList(String pageNo);

	public abstract NoticeListVO getNoticeList(int pageNo);

	public abstract NoticeListVO getNoticeList();

}