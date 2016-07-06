package org.kosta.finalproject.model.vo.food;

import org.springframework.web.multipart.MultipartFile;

public class BestFoodVO {
	private int foodshop_no;
	private String shopname;
	private String shop_add;
	private String foodtype;
	private String area_name;
	private String detailarea_name;
	private int main_price;
	private String main_food;
	private String local_area;
	private String main_menu_picture;
	private MultipartFile uploadFile;
	public BestFoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BestFoodVO(int foodshop_no) {
		super();
		this.foodshop_no = foodshop_no;
	}

	public BestFoodVO(int foodshop_no, String shopname, String shop_add,
			String foodtype, String area_name, String detailarea_name,
			int main_price, String main_food, String local_area,
			String main_menu_picture, MultipartFile uploadFile) {
		super();
		this.foodshop_no = foodshop_no;
		this.shopname = shopname;
		this.shop_add = shop_add;
		this.foodtype = foodtype;
		this.area_name = area_name;
		this.detailarea_name = detailarea_name;
		this.main_price = main_price;
		this.main_food = main_food;
		this.local_area = local_area;
		this.main_menu_picture = main_menu_picture;
		this.uploadFile = uploadFile;
	}

	public int getFoodshop_no() {
		return foodshop_no;
	}

	public void setFoodshop_no(int foodshop_no) {
		this.foodshop_no = foodshop_no;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShop_add() {
		return shop_add;
	}

	public void setShop_add(String shop_add) {
		this.shop_add = shop_add;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getDetailarea_name() {
		return detailarea_name;
	}

	public void setDetailarea_name(String detailarea_name) {
		this.detailarea_name = detailarea_name;
	}

	public int getMain_price() {
		return main_price;
	}

	public void setMain_price(int main_price) {
		this.main_price = main_price;
	}

	public String getMain_food() {
		return main_food;
	}

	public void setMain_food(String main_food) {
		this.main_food = main_food;
	}

	public String getLocal_area() {
		return local_area;
	}

	public void setLocal_area(String local_area) {
		this.local_area = local_area;
	}

	public String getMain_menu_picture() {
		return main_menu_picture;
	}

	public void setMain_menu_picture(String main_menu_picture) {
		this.main_menu_picture = main_menu_picture;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "BestFoodVO [foodshop_no=" + foodshop_no + ", shopname="
				+ shopname + ", shop_add=" + shop_add + ", foodtype="
				+ foodtype + ", area_name=" + area_name + ", detailarea_name="
				+ detailarea_name + ", main_price=" + main_price
				+ ", main_food=" + main_food + ", local_area=" + local_area
				+ ", main_menu_picture=" + main_menu_picture + ", uploadFile="
				+ uploadFile + "]";
	}


}
