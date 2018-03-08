package product;

import java.util.Date;

public class OrderDataBean {
	private int ordernumkey;	//��ǰ�� �ֹ���ȣ
	private int ordernum;	//�׷� �ֹ���ȣ
	private int num;	//�����ϴ� ��ǰ��ȣ 
	private String productname;
	private int count;
	private String originalprice;	//��ǰ���ݾ�
	private String saleprice;	//���αݾ�
	private String price;	//���ݾ�-���αݾ�
	private String totalprice;	//�ֹ���ü�ݾ�
	private String name;	//�Ա��ڸ�
	private String id;
	private String getname;	//�޴»����
	private String phone;
	private String addrnum;
	private String address1;
	private String address2;
	private Date regdate;
	private String status;	//��۰���
	private String statususer;	//�ֹ�����
	private String moneycheck;	//�Ա�
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
