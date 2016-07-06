package org.kosta.finalproject.model.vo.lodge;

public class LodgeVO {
	private int lodge_no;
	private String shopname;
	private String shopinfo;
	private String lodgetype;
	private int price;
	private String area_name;
	private String detailarea_name;
	private String local_area;
	private int hits;
	private LodgePictureVO lodgePictureVO;
	
	public LodgeVO() {
		super();
	}
	
	public LodgeVO(int lodge_no) {
		super();
		this.lodge_no = lodge_no;
	}

	public LodgeVO(int lodge_no, String shopname, String shopinfo,
			String lodgetype, int price, String area_name,
			String detailarea_name, String local_area, int hits,
			LodgePictureVO lodgePictureVO) {
		super();
		this.lodge_no = lodge_no;
		this.shopname = shopname;
		this.shopinfo = shopinfo;
		this.lodgetype = lodgetype;
		this.price = price;
		this.area_name = area_name;
		this.detailarea_name = detailarea_name;
		this.local_area = local_area;
		this.hits = hits;
		this.lodgePictureVO = lodgePictureVO;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShopinfo() {
		return shopinfo;
	}

	public void setShopinfo(String shopinfo) {
		this.shopinfo = shopinfo;
	}

	public String getLodgetype() {
		return lodgetype;
	}

	public void setLodgetype(String lodgetype) {
		this.lodgetype = lodgetype;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getLocal_area() {
		return local_area;
	}

	public void setLocal_area(String local_area) {
		this.local_area = local_area;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public LodgePictureVO getLodgePictureVO() {
		return lodgePictureVO;
	}

	public void setLodgePictureVO(LodgePictureVO lodgePictureVO) {
		this.lodgePictureVO = lodgePictureVO;
	}

	@Override
	public String toString() {
		return "LodgeVO [lodge_no=" + lodge_no + ", shopname=" + shopname
				+ ", shopinfo=" + shopinfo + ", lodgetype=" + lodgetype
				+ ", price=" + price + ", area_name=" + area_name
				+ ", detailarea_name=" + detailarea_name + ", local_area="
				+ local_area + ", hits=" + hits + ", lodgePictureVO="
				+ lodgePictureVO + "]";
	}
	
	
}
