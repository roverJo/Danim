package org.kosta.finalproject.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.CartDAO;
import org.kosta.finalproject.model.vo.PagingBean;
import org.kosta.finalproject.model.vo.cart.CartListVO;
import org.kosta.finalproject.model.vo.cart.CartVO;
import org.kosta.finalproject.model.vo.cart.MemberAndParamMapVO;
import org.kosta.finalproject.model.vo.member.MemberListVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService 
{
	@Resource
	private CartDAO cartDAO;
	
	@Resource(name="pagingConfigCart")
	private Map<String,Integer> pagingConfigCart;

	@Override
	public CartListVO getCartList(String pageNo,MemberVO memberVO){			
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int pno=Integer.parseInt(pageNo);		
		return getCartList(pno,memberVO);
	}
	@Override
	public CartListVO getCartList(int pageNo,MemberVO memberVO){		
		/*HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		paramMap.put("pageNo", pageNo);
		paramMap.put("numberOfContent", pagingConfigCart.get("numberOfContent"));*/
		List<CartVO> list = cartDAO.getCartList(new MemberAndParamMapVO(memberVO,pageNo,pagingConfigCart.get("numberOfContent")));
		int total=cartDAO.totalCart(memberVO);
		PagingBean paging=new PagingBean(total,pageNo,pagingConfigCart);
		CartListVO lvo=new CartListVO(list,paging);
		return lvo;
	}
	
	@Override
	public void cartInsert(CartVO cartVO) 
	{
		// TODO Auto-generated method stub
		cartDAO.cartInsert(cartVO);
	}

	
	
}
