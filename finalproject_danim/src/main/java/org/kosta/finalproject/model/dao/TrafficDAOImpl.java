package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.StationVO;
import org.kosta.finalproject.model.vo.traffic.TerminalVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrafficDAOImpl implements TrafficDAO 
{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<AreaVO> searchArea() 
	{
		return template.selectList("area.searchArea");
	}

	@Override
	public List<TerminalVO> searchTerminal(String area_name) 
	{
		// TODO Auto-generated method stub
		return template.selectList("terminal.searchTerminal",area_name);
	}

	@Override
	public List<StationVO> searchStation(String area_name) 
	{
		// TODO Auto-generated method stub
		return template.selectList("station.searchStation",area_name);
	}

	@Override
	public List<String> searchEndAreaByTer(String terminalName) 
	{
		// TODO Auto-generated method stub
		return template.selectList("bus.searchEndAreaByTer",terminalName);
	}

	@Override
	public List<String> searchEndAreaBySta(String stationName) 
	{
		// TODO Auto-generated method stub
		return template.selectList("train.searchEndAreaBySta",stationName);
	}

	@Override
	public List<BusVO> getBusList(BusVO busVO) 
	{
		// TODO Auto-generated method stub
		return template.selectList("bus.getBusList",busVO);
	}

	@Override
	public List<TrainVO> getTrainList(TrainVO trainVO)
	{
		// TODO Auto-generated method stub
		return template.selectList("train.getTrainList",trainVO);
	}

	@Override
	public BusVO getBusInfo(int bus_no)
	{
		// TODO Auto-generated method stub
		return template.selectOne("bus.getBusInfo",bus_no);
	}

	@Override
	public TrainVO getTrainInfo(int train_no) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("train.getTrainInfo",train_no);
	}

	@Override
	public BusVO checkDB(BusVO busVO) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("bus.checkDB",busVO);
	}

	@Override
	public void insertBusByExcel(BusVO busVO) 
	{
		template.insert("bus.insertBusByExcel",busVO);
	}

	@Override
	public TerminalVO getTerminalNo(String terminal_name) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("terminal.getTerminalNo",terminal_name);
	}

	@Override
	public void updateBusByExcel(BusVO busVO)
	{
		// TODO Auto-generated method stub
		template.update("bus.updateBusByExcel",busVO);
	}

	@Override
	public StationVO getStationNo(String station_name) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("station.getStationNo",station_name);
	}

	@Override
	public TrainVO checkDBTrain(TrainVO trainVO)
	{
		// TODO Auto-generated method stub
		return template.selectOne("train.checkDBTrain",trainVO);
	}

	@Override
	public void insertTrainByExcel(TrainVO trainVO) 
	{
		
		// TODO Auto-generated method stub
		template.insert("train.insertTrainByExcel",trainVO);
	}

	//통합검색 버스
	public List<BusVO> totalSearchBus(SearchVO svo){
		return template.selectList("bus.totalSearchBus",svo);
	}
	
	public List<BusVO> totalSearchBusTest(String totalSearch){
		return template.selectList("bus.totalSearchBusTest",totalSearch);
	}
	//통합검색 기차
	public List<TrainVO> totalSearchTrain(SearchVO svo){
		return template.selectList("train.totalSearchTrain",svo);
	}
	
	public List<TrainVO> totalSearchTrainTest(String totalSearch){
		return template.selectList("train.totalSearchTrainTest",totalSearch);
	}
}
