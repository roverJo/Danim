package org.kosta.finalproject.model.vo.food;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	private int menu_no;
	private String food_picture;
	private int price;
	private String food_name;
	private int foodshop_no;
	private BestFoodVO bestFoodVO;
	private MultipartFile uploadFile;
	public MenuVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuVO(int menu_no, String food_picture, int price,
			String food_name, int foodshop_no, BestFoodVO bestFoodVO,
			MultipartFile uploadFile) {
		super();
		this.menu_no = menu_no;
		this.food_picture = food_picture;
		this.price = price;
		this.food_name = food_name;
		this.foodshop_no = foodshop_no;
		this.bestFoodVO = bestFoodVO;
		this.uploadFile = uploadFile;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getFood_picture() {
		return food_picture;
	}
	public void setFood_picture(String food_picture) {
		this.food_picture = food_picture;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFoodshop_no() {
		return foodshop_no;
	}
	public void setFoodshop_no(int foodshop_no) {
		this.foodshop_no = foodshop_no;
	}
	public BestFoodVO getBestFoodVO() {
		return bestFoodVO;
	}
	public void setBestFoodVO(BestFoodVO bestFoodVO) {
		this.bestFoodVO = bestFoodVO;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "MenuVO [menu_no=" + menu_no + ", food_picture=" + food_picture
				+ ", price=" + price + ", food_name=" + food_name
				+ ", foodshop_no=" + foodshop_no + ", bestFoodVO=" + bestFoodVO
				+ ", uploadFile=" + uploadFile + "]";
	}
	
}
