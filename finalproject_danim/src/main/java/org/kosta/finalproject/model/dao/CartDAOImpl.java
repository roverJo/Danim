package org.kosta.finalproject.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.cart.CartVO;
import org.kosta.finalproject.model.vo.cart.MemberAndParamMapVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO 
{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void cartInsert(CartVO cartVO) 
	{
		// TODO Auto-generated method stub
		template.insert("cart.insertCart",cartVO);
	}

	@Override
	public List<CartVO> getCartList(MemberAndParamMapVO memberAndParamMapVO)
	{
		//System.out.println(memberAndParamMapVO);
		// TODO Auto-generated method stub
		return template.selectList("cart.getCartList",memberAndParamMapVO);
	}

	@Override
	public int totalCart(MemberVO memberVO) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("cart.totalCart",memberVO);
	}
}
