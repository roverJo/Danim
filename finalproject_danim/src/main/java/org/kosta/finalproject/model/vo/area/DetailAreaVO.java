package org.kosta.finalproject.model.vo.area;

public class DetailAreaVO {
	
	private String area_name;
	private String detailarea_name;
	public DetailAreaVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DetailAreaVO(String area_name, String detailarea_name) {
		super();
		this.area_name = area_name;
		this.detailarea_name = detailarea_name;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getDetailarea_name() {
		return detailarea_name;
	}
	public void setDetailarea_name(String detailarea_name) {
		this.detailarea_name = detailarea_name;
	}
	@Override
	public String toString() {
		return "DetailAreaVO [area_name=" + area_name + ", detailarea_name="
				+ detailarea_name + "]";
	}
	
	
}
