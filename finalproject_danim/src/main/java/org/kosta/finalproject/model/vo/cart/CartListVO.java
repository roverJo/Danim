package org.kosta.finalproject.model.vo.cart;

import java.util.List;

import org.kosta.finalproject.model.vo.PagingBean;

public class CartListVO 
{
	private List<CartVO> cartList;
	private PagingBean pagingBean;
	public CartListVO() {
		super();
	}
	public CartListVO(List<CartVO> cartList, PagingBean pagingBean) {
		super();
		this.cartList = cartList;
		this.pagingBean = pagingBean;
	}
	public List<CartVO> getCartList() {
		return cartList;
	}
	public void setCartList(List<CartVO> cartList) {
		this.cartList = cartList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "CartListVO [cartList=" + cartList + ", pagingBean="
				+ pagingBean + "]";
	}
	
	
}
