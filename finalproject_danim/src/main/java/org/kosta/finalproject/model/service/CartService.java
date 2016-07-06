package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.cart.CartListVO;
import org.kosta.finalproject.model.vo.cart.CartVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

public interface CartService 
{
	void cartInsert(CartVO cartVO);

	CartListVO getCartList(String pageNo, MemberVO memberVO);

	CartListVO getCartList(int pageNo, MemberVO memberVO);

}