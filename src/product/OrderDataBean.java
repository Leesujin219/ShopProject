package product;

import java.util.Date;

public class OrderDataBean {
	private int ordernumkey;	//제품별 주문번호
	private int ordernum;	//그룹 주문번호
	private int num;	//구입하는 제품번호 
	private String productname;
	private int count;
	private String originalprice;	//상품원금액
	private String saleprice;	//할인금액
	private String price;	//원금액-할인금액
	private String totalprice;	//주문전체금액
	private String name;	//입금자명
	private String id;
	private String getname;	//받는사람명
	private String phone;
	private String addrnum;
	private String address1;
	private String address2;
	private Date regdate;
	private String status;	//배송관련
	private String statususer;	//주문관련
	private String moneycheck;	//입금
	private Date moneyregdate;
	
	public int getOrdernumkey() {
		return ordernumkey;
	}
	public void setOrdernumkey(int ordernumkey) {
		this.ordernumkey = ordernumkey;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(String saleprice) {
		this.saleprice = saleprice;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGetname() {
		return getname;
	}
	public void setGetname(String getname) {
		this.getname = getname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddrnum() {
		return addrnum;
	}
	public void setAddrnum(String addrnum) {
		this.addrnum = addrnum;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatususer() {
		return statususer;
	}
	public void setStatususer(String statususer) {
		this.statususer = statususer;
	}
	
	public String getMoneycheck() {
		return moneycheck;
	}
	public void setMoneycheck(String moneycheck) {
		this.moneycheck = moneycheck;
	}
	
	public Date getMoneyregdate() {
		return moneyregdate;
	}
	public void setMoneyregdate(Date moneyregdate) {
		this.moneyregdate = moneyregdate;
	}
	@Override
	public String toString() {
		return "OrderDataBean [ordernumkey=" + ordernumkey + ", ordernum=" + ordernum + ", num=" + num
				+ ", productname=" + productname + ", count=" + count + ", originalprice=" + originalprice
				+ ", saleprice=" + saleprice + ", price=" + price + ", totalprice=" + totalprice + ", name=" + name
				+ ", id=" + id + ", getname=" + getname + ", phone=" + phone + ", addrnum=" + addrnum + ", address1="
				+ address1 + ", address2=" + address2 + ", regdate=" + regdate + ", status=" + status + ", statususer="
				+ statususer + ", moneycheck=" + moneycheck + ", moneyregdate=" + moneyregdate + "]";
	}
	

}
