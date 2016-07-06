package org.kosta.finalproject.model.vo.area;

public class AreaVO 
{
	private String area_name;

	public AreaVO() {
		super();
	}

	public AreaVO(String area_name) {
		super();
		this.area_name = area_name;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	@Override
	public String toString() {
		return "AreaVO [area_name=" + area_name + "]";
	}
	
	
}
