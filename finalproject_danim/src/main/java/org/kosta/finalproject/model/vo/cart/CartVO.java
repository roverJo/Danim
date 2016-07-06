package org.kosta.finalproject.model.vo.cart;

import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;

public class CartVO
{
	private int combinecart_no;
	private MemberVO memberVO;
	private BusVO busVO;
	private TrainVO trainVO;
	private BestFoodVO bestFoodVO;
	private LodgeVO lodgeVO;
	private int totalPrice;
	
	public CartVO() {
		super();
	}

	public CartVO(int combinecart_no, MemberVO memberVO, BusVO busVO,
			TrainVO trainVO, BestFoodVO bestFoodVO, LodgeVO lodgeVO,
			int totalPrice) {
		super();
		this.combinecart_no = combinecart_no;
		this.memberVO = memberVO;
		this.busVO = busVO;
		this.trainVO = trainVO;
		this.bestFoodVO = bestFoodVO;
		this.lodgeVO = lodgeVO;
		this.totalPrice = totalPrice;
	}

	public int getCombinecart_no() {
		return combinecart_no;
	}

	public void setCombinecart_no(int combinecart_no) {
		this.combinecart_no = combinecart_no;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public BusVO getBusVO() {
		return busVO;
	}

	public void setBusVO(BusVO busVO) {
		this.busVO = busVO;
	}

	public TrainVO getTrainVO() {
		return trainVO;
	}

	public void setTrainVO(TrainVO trainVO) {
		this.trainVO = trainVO;
	}

	public BestFoodVO getBestFoodVO() {
		return bestFoodVO;
	}

	public void setBestFoodVO(BestFoodVO bestFoodVO) {
		this.bestFoodVO = bestFoodVO;
	}

	public LodgeVO getLodgeVO() {
		return lodgeVO;
	}

	public void setLodgeVO(LodgeVO lodgeVO) {
		this.lodgeVO = lodgeVO;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "CartVO [combinecart_no=" + combinecart_no + ", memberVO="
				+ memberVO + ", busVO=" + busVO + ", trainVO=" + trainVO
				+ ", bestFoodVO=" + bestFoodVO + ", lodgeVO=" + lodgeVO
				+ ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	
}
