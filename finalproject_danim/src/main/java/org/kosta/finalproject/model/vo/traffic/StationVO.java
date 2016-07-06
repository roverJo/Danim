package org.kosta.finalproject.model.vo.traffic;

import org.kosta.finalproject.model.vo.area.AreaVO;

public class StationVO 
{
	private String station_no;
	private String station_name;
	private AreaVO areaVO;
	public StationVO() {
		super();
	}
	public StationVO(String station_no, String station_name, AreaVO areaVO) {
		super();
		this.station_no = station_no;
		this.station_name = station_name;
		this.areaVO = areaVO;
	}
	public String getStation_no() {
		return station_no;
	}
	public void setStation_no(String station_no) {
		this.station_no = station_no;
	}
	public String getStation_name() {
		return station_name;
	}
	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	public AreaVO getAreaVO() {
		return areaVO;
	}
	public void setAreaVO(AreaVO areaVO) {
		this.areaVO = areaVO;
	}
	@Override
	public String toString() {
		return "StationVO [station_no=" + station_no + ", station_name="
				+ station_name + ", areaVO=" + areaVO + "]";
	}
	
}
