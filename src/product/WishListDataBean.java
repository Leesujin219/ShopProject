package product;

public class WishListDataBean {
	private int wishnum;
	private String id;
	private int num;
	
	public int getWishnum() {
		return wishnum;
	}
	public void setWishnum(int wishnum) {
		this.wishnum = wishnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "WishListDataBean [wishnum=" + wishnum + ", id=" + id + ", num=" + num + "]";
	}
	
	
}
