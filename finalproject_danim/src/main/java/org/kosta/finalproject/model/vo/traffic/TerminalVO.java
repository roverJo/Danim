package org.kosta.finalproject.model.vo.traffic;

import org.kosta.finalproject.model.vo.area.AreaVO;

public class TerminalVO 
{
	private String terminal_no;
	private String terminal_name;
	private AreaVO areaVO;
	public TerminalVO() {
		super();
	}
	public TerminalVO(String terminal_no, String terminal_name, AreaVO areaVO) {
		super();
		this.terminal_no = terminal_no;
		this.terminal_name = terminal_name;
		this.areaVO = areaVO;
	}
	public String getTerminal_no() {
		return terminal_no;
	}
	public void setTerminal_no(String terminal_no) {
		this.terminal_no = terminal_no;
	}
	public String getTerminal_name() {
		return terminal_name;
	}
	public void setTerminal_name(String terminal_name) {
		this.terminal_name = terminal_name;
	}
	public AreaVO getAreaVO() {
		return areaVO;
	}
	public void setAreaVO(AreaVO areaVO) {
		this.areaVO = areaVO;
	}
	@Override
	public String toString() {
		return "TerminalVO [terminal_no=" + terminal_no + ", terminal_name="
				+ terminal_name + ", areaVO=" + areaVO + "]";
	}
	
	
}
