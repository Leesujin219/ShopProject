package login;

import java.util.Date;

public class LoginDataBean {

	private int num;	//회원번호
	private String memberlev;	//회원등급
	private String id;	
	private String password;
	private String name;
	private String email;
	private String phone;
	private String gender;
	private String birthday;
	private int age;	//나이
	private String addrnum;
	private String address1;
	private String address2;
	private Date reg_date;	//가입일자
	private int buynum;	//구매 횟수
	private int productnum;	//구매 상품 수
	private String[] gendertype= {"여","남"};
	private String[] memberlevtype= {"관리자","일반회원"};
	
	public String getGendertype() {
		if(gender.equals("f")) {
			return gendertype[0];
		}else {
			return gendertype[1];
		}
	}
	public String getMemberlevtype() {
		if(memberlev.equals("1")) {
			return memberlevtype[0];
		}else{
			return memberlevtype[1];
		}
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberlev() {
		return memberlev;
	}
	public void setMemberlev(String memberlev) {
		this.memberlev = memberlev;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	@Override
	public String toString() {
		return "LoginDataBean [num=" + num + ", memberlev=" + memberlev + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", birthday="
				+ birthday + ", age=" + age + ", addrnum=" + addrnum + ", address1=" + address1 + ", address2="
				+ address2 + ", reg_date=" + reg_date + ", buynum=" + buynum + ", productnum=" + productnum + "]";
	}

	
}
