package org.kosta.finalproject.model.vo.traffic;

import java.util.ArrayList;

public class TrafficVO
{
	private ArrayList<BusVO> busList;
	private ArrayList<TrainVO> trainList;
	public TrafficVO() {
		super();
	}
	public TrafficVO(ArrayList<BusVO> busList, ArrayList<TrainVO> trainList) {
		super();
		this.busList = busList;
		this.trainList = trainList;
	}
	public ArrayList<BusVO> getBusList() {
		return busList;
	}
	public void setBusList(ArrayList<BusVO> busList) {
		this.busList = busList;
	}
	public ArrayList<TrainVO> getTrainList() {
		return trainList;
	}
	public void setTrainList(ArrayList<TrainVO> trainList) {
		this.trainList = trainList;
	}
	@Override
	public String toString() {
		return "TrafficVO [busList=" + busList + ", trainList=" + trainList
				+ "]";
	}
	
	
}
