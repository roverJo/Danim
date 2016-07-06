package org.kosta.finalproject.model.vo.traffic;

public class BusVO 
{
	private int bus_no;
	private String operation_time;
	private String end_area;
	private TerminalVO terminalVO;
	private int price;
	private String leadTime;
	private String busType;
	public BusVO() {
		super();
	}
	public BusVO(int bus_no, String operation_time, String end_area,
			TerminalVO terminalVO, int price, String leadTime, String busType) {
		super();
		this.bus_no = bus_no;
		this.operation_time = operation_time;
		this.end_area = end_area;
		this.terminalVO = terminalVO;
		this.price = price;
		this.leadTime = leadTime;
		this.busType = busType;
	}
	public BusVO(int bus_no) {
		super();
		this.bus_no = bus_no;
	}
	public int getBus_no() {
		return bus_no;
	}
	public void setBus_no(int bus_no) {
		this.bus_no = bus_no;
	}
	public String getoperation_time() {
		return operation_time;
	}
	public void setoperation_time(String operation_time) {
		this.operation_time = operation_time;
	}
	public String getEnd_area() {
		return end_area;
	}
	public void setEnd_area(String end_area) {
		this.end_area = end_area;
	}
	public TerminalVO getTerminalVO() {
		return terminalVO;
	}
	public void setTerminalVO(TerminalVO terminalVO) {
		this.terminalVO = terminalVO;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getleadTime() {
		return leadTime;
	}
	public void setleadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	public String getbusType() {
		return busType;
	}
	public void setbusType(String busType) {
		this.busType = busType;
	}
	@Override
	public String toString() 
	{
		return "BusVO [bus_no=" + bus_no + ", operation_time=" + operation_time
				+ ", end_area=" + end_area + ", terminalVO=" + terminalVO
				+ ", price=" + price + ", leadTime=" + leadTime + ", busType=" + busType
				+ "]";
	}
	
	
}
