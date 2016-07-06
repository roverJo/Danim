package org.kosta.finalproject.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.finalproject.model.vo.cart.CartVO;
import org.kosta.finalproject.model.vo.cart.MemberAndParamMapVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

public interface CartDAO {


	void cartInsert(CartVO cartVO);

	List<CartVO> getCartList(MemberAndParamMapVO memberAndParamMapVO);

	int totalCart(MemberVO memberVO);

}